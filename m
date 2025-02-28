Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB72C282CD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 11:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B0510E093;
	Fri, 28 Feb 2025 11:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2L3gIz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09C810E093
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740741128; x=1772277128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BmWz73DYWsT3sNS75U11MF4yTNREonZr/rmk8ZdTjE4=;
 b=F2L3gIz1YSlimAtWtodO4MGhZDkIh0dmHvfwgzhQs9HagEN6WcFlVLzx
 eEBiXAiB/gv1MV9JOSfvsWZ3TypZh+VYTvBr//G/hC92Wc6qEOClWWmsZ
 0OGM5mz18lGAh0gCY9TGFyswtahnSzEZe92sxT4ueMUSykYeeh41YLFpf
 JrGti7lZqFtu0mOQyNWzAgH4MFEN83wDQ85Wb7RucJFKy+LdW5x0UI4Pt
 or4r0sA0moRrPq3ofezFtzQoJUThu7APdbGW2jX/7HWa0tOKLlErpNzOw
 TWf6YE5ipzP3uDs5s+MutRkScJbWgwkSs4LysppiZdZG0kHuVbnU+xIQY g==;
X-CSE-ConnectionGUID: s8/3wIi4RC6A6lWiPWNTVw==
X-CSE-MsgGUID: DOfEfIEwS6C8a1dS/Ezw/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59203160"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="59203160"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 03:12:08 -0800
X-CSE-ConnectionGUID: fpIS64rWTruq8uw+kZoO9w==
X-CSE-MsgGUID: 1NRfzqYfRfqHt2xjOBftcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117072789"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 03:12:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 03:12:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 03:12:07 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 03:12:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD/SKY1ddCQjkT8ledvQsp4wjSLu92EBcVsAM/p7j8390qV7D/FuyJnC2SGAcFLBQXzEoMX6jbUPzLnebEHM4oOBeUq4DEOuNy9a+XLhsFolqp8nAkg1ZXnIwP26qGDBTokRpLfRi4kyIAIUMFCv7KvuX3sTi4OuJqxUg4CQW0kvKorsXnNp9n8eHAy+il24uQNpNmTaBTSl6MLoT3YbBnKZxykZ3fkkYSondOLaDf+kOWZCXwPQ++Bfi76fqzuiFTgqExLdewSMZOC1nBkGX5PtqFpS1b3Kz+66QmJXL+9mtNVf3FR8Yj9s8nqjiTaTjH3uRSgs6RsFlshcGZFAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmWz73DYWsT3sNS75U11MF4yTNREonZr/rmk8ZdTjE4=;
 b=oIrIYlafOwloEh27J5CCzoMXDyFK31cnoZLASC0WYZfXmiB5VhxbV6gATHBYsrF0pFsjrAzDiFajzm2BpmYqV5Mmsw6lIerSp1BWzKfdfpQ+ptCk3siESVc5zpt5c8UdfTRMWi1RdgJHmKoHCkDkR9YHlPLxsq+i/zd/oMdpbcPRgA83V0jcVO0/yExPzhb3+G4HgqNo7ByAwm+vu3ybhD6QH73teW8T2GKpJe9We4NhLZl0KZV9xg9vQCy50ls+9lMyN/clSWOUFvmgZiEixmlbERTfqh1CdQy4EldYpxQdwSCPm0lu1N2l+2DUOh3OqSKFl8zRSAzgZKsf/z2oXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SA0PR11MB4734.namprd11.prod.outlook.com (2603:10b6:806:99::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.22; Fri, 28 Feb 2025 11:12:00 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%7]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 11:11:59 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Bhatia, Aradhya" <aradhya.bhatia@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed actions
Thread-Topic: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed
 actions
Thread-Index: AQHbia1mIZnwzBm7s0uFGGpRmrBRbrNcgdiAgAAN9oA=
Date: Fri, 28 Feb 2025 11:11:59 +0000
Message-ID: <3a74a434957fb52ebcc36a4d5b88e8428ac2165f.camel@intel.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
 <20250228065224.320811-2-aradhya.bhatia@intel.com>
 <1b66c78c-82d4-4002-9fa4-6f30e97e0268@intel.com>
In-Reply-To: <1b66c78c-82d4-4002-9fa4-6f30e97e0268@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SA0PR11MB4734:EE_
x-ms-office365-filtering-correlation-id: b58578e8-fb86-4eb7-2b86-08dd57e8b8ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?enJJYnR6ZStTWDZFeEJreXhqVitxakh0eFVabTZTSE80cmRWcUlReHF5djlY?=
 =?utf-8?B?YjkxczJZTG53N3kyVzJOVnA2ZFlKNHgzVTk0OTQ1NDRRa0xyNUdlYlRpVlZR?=
 =?utf-8?B?d1pZWVFaUjVSa28xZmRaSnYwbDgrc3pvUkJHVlhZZDRTZzNRb2NlZ1JlSkZG?=
 =?utf-8?B?WlBUa3F3UFhLbnMrNlkwYTZSQk1VQnBtOUVKQjQwaU5NVHo1Nm9Balg4eUFy?=
 =?utf-8?B?dDZvc0JodTFCb01pa0g5RWkxSDl3Mk5XeTZQZ2pWVGltYU14cC9CL3JDdmF4?=
 =?utf-8?B?S0lYVHAxelM0L3ZrV0JXcHNWRWVIWnU4UzVSUHFPVmdVQXMvRXRNYU96Y0R4?=
 =?utf-8?B?MDJoeTFoVUo4OVZHbWtDS1lCMk9NVlpFUy9ZR0MwbEdPYkpaQm9XRjJwbXdH?=
 =?utf-8?B?clNMOWhrMG9uTm1BcDJCTTZzaklBSzlJcHdqRlJXbGhCaWxGL1NtbnlyUDA5?=
 =?utf-8?B?ZUZwNzJ6c0NxbHVpcThFM0VORTZCNnEwcDdDdlFkcldkbEd0M3F5NFpka2ww?=
 =?utf-8?B?b2hCVGFkaXVXdzlIUDFVUDlKNWVjdXNRVkVTNXRrTldURmtQcTJDQ1Z6ejJR?=
 =?utf-8?B?czZVT0tKRS84R2dNS2hMRXFUV09jcDM5WG9PVTlQdnNYRkQxakh4RkQ4dFc2?=
 =?utf-8?B?bWpsbUpBNlk4a2FSN0NadlZqd1pURlJwdFptNGJyV1Z5TnVNQ2lwTGZrTkJU?=
 =?utf-8?B?dXhNNVJiTk9LanRBeUsrcnZxekMzVjRtcTh6ZThGQ281dUJTRWgwVEtua1pE?=
 =?utf-8?B?aStzbGtmOHRLVmNUSVRZcTdZUFMvdnhUNnJ0YXNaRjFBTllNOEIzODdZcU0z?=
 =?utf-8?B?TG16T1ExUHEvejBZSW9PQmU1Kzh1T0haWE1yTU02MG5BSWJCdVhYMnJVZmJJ?=
 =?utf-8?B?cG1aV2loQ2hUR0dFQVFoR24wd2gzWnI1c0h5VUJOU0NYNURBc0lNNGR4Mjk3?=
 =?utf-8?B?WUxBNUhpVjhCTFJQZjZ6OE9VcmpnbVRzamxnem5HZzlNbWhCSVJkUytnV2Ni?=
 =?utf-8?B?TDRacWVoYVhCa3YrNlBvaU8zODVFa1RKS1d3QnZ4Y2hIeEFtNnNzdWM2U3ov?=
 =?utf-8?B?TzNFamo1YS9Cck9DUTJjVlNzKzh5R2JBdEdEaEpnTTJ6L3ZyVThZekxoVjdz?=
 =?utf-8?B?R2JHVDlEN21vV1gzSFlGSGZENEVRa2U1S1JsbG1sMGhndmdTSjlRb0tMbmpx?=
 =?utf-8?B?dWVqOXBud3B0TEJtdXlWSUxYbzV3N1dKRGNVMUlYUC9iWTVXZGlRMFp0OUVC?=
 =?utf-8?B?ZHVlako2aE5jRTlNZ0hZWmsvOEZodlB4MUxBRFBFcUw0N0drdnI1a1NlOEZF?=
 =?utf-8?B?ZjAwa21ZNDd5b25KaStBak9lQjd5WDA0U3QweThPWGZ3L0s0L1FrOXVtZXlL?=
 =?utf-8?B?UFZpK0tuSm1XOFhvN1VFNitMb21PWWVkTkttUGJoc3lQR244ajc1TTNERkdM?=
 =?utf-8?B?WVhYaGxxQnViL3d1VHRUaUVzbmhKbUh2ZUFOZWJIRzlYdnpoUzRGcm53Rkkx?=
 =?utf-8?B?OEkrWm5sWmtVdDFOdUNUb2RaVVBhaG85WEMxZ2g5ZEZGUVdkTFlFd0JpRDZy?=
 =?utf-8?B?WElGRnFyQytvYTlUVjc0bXB5ZWtPUzNlT21INFZ6ZVVDY1dKK1FaaXZ0VmJa?=
 =?utf-8?B?NFVPVmkxd1R6eTRVQXB1TWdENWZVRVZlSEVGN1JpN1dZdVFsVCtnU21jUmRG?=
 =?utf-8?B?WXdGU09qdy8xbTlBVDdLc1NPQkV3S1R5WFFFSzlpV3Z1SjBvU0Q1RC85bHJO?=
 =?utf-8?B?Z2I3SXExKytvSS9yS1NGc3h6SU8wN2VUNHRZUTFIbTNDSDM5dXNJUXU5cnll?=
 =?utf-8?B?RTVneFV0QVFVN1RaMkh0OG9uc0VkVnk3Mnk1akFTSWo2bE9CK3RUODhHQkh1?=
 =?utf-8?B?YWJuNk0rZ1hGT25CcWZ4S0pTSmhUQzVVSG9hU0UvRThTTzFUeUQvMjhpU0k0?=
 =?utf-8?Q?B2eT76piF0TX1rlMwof+G/Ln0q7I6IgU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L09McFBFRE5IcFhITTVnUDdtaFNPTHlyYjVtVVhQQzlHeUtGREpnMStUOG90?=
 =?utf-8?B?RHZjZWdRZWQvMVB1dkEwY2pXaWlxdFV6Wjl1a2p0eTdiSklTT1JlU05VTWJu?=
 =?utf-8?B?T3BjQngvVXVJSzVSckpubUlYN1hPQVAwYUlGUlVuQkNIUUV1Um1NQ2t2K0lt?=
 =?utf-8?B?TElpdEgxME1ldzNibUFpRlc2MnlhYUN6ems1UTFCSmNLS3RYOWpGbG92b3JM?=
 =?utf-8?B?RWRYcFU5RUc3d2FTZ2t1aEJOQU1PZ0x5cVg2Y3hneFRoU0ptYVlyRFQ5TlJR?=
 =?utf-8?B?KzEvSnBSZUhlbTZhZGF0SVQ3bm4yTFY3VGp1UE8wWWFoOXhOOEFRN3lhMkVi?=
 =?utf-8?B?V1Z0bEZIN21FbzBRcG13ZU14UTBNbkMwSlI4WkZONmxTNUozS2J3dDNVNEhy?=
 =?utf-8?B?bkU2MndndVIvYUZZRnpUMEpQczd3b2ZEQVJzVUluL203VHV3TFpCalh6c2FB?=
 =?utf-8?B?K2RrSUFCandVZW01alU0WURUajh1YWFnd1pCR1R3dm9CVWJuWmdHQUNPNmxF?=
 =?utf-8?B?U0FBcXo2SXk3ckdmeUV6RU45VEhSTjEvSzRITVRKcmdHeElMU1J0RVdEd2hR?=
 =?utf-8?B?b1ZtY29aT2FxbmxKb3hjTncvbjc3UG1UNmtaUDZxVDhKRkNMRmxBOEN0T3pP?=
 =?utf-8?B?Wk9Jckt0aG9yRjJsSFplMjliaWpkVVJrTGtiditRbFNWVzh3a2lEUE5ORUJ5?=
 =?utf-8?B?MEcrYTZRU3grMEt0NCtacWREVDFRUWhuWDJmd2pRTGRlTWRrbDREMUpOZTlt?=
 =?utf-8?B?VXU5aHRLcVEwVXlCQmVhNnZhdllkQ05INFdWKzhCTkRJSkUzeEIzZmM2aWpu?=
 =?utf-8?B?QktBdGNIVElydjdtY1licjdLbEZYZ1ZXQThuRG1Id21IQVpLYnB1WEMzWWZX?=
 =?utf-8?B?SmVkbU10b05iaG13cm9NZlZQSkZ6d2xza0ExeisxOWJqZ2pnR0tHeHZTTjN5?=
 =?utf-8?B?am8zRFJVRmRMOVVqTk1sRmx3aGU3Y2R6Y08ra2ZFaGdaVFA3UnluR0ZQOHg2?=
 =?utf-8?B?MktGeUdPTjArTlZFZ3RlTmIrQ3BnQ01SNFJhUE5VekpWaUZ3K2dES0ZkeHdv?=
 =?utf-8?B?YjBWbjFNUmhBUEJFY0tjWVZvZDNYUlNiZUJ3NE1xYW94NU9vVm1Wb0VhVURU?=
 =?utf-8?B?dTFYbFkzaEkxK1lPMWJUeGlOQ2w5WTZZaE5nY2trMldrckFBWnVNNDJnRnU0?=
 =?utf-8?B?dzQxaW5jamtxUkE3YUR2bTl1cEQwVnF0eUNHK0tuUm5FOVZ0VkhjUTFZQ3Bz?=
 =?utf-8?B?L0dub1F2UmlwL2xsRXRRMDFwVEVuWng5OTNROHhqQUxoMXpERFVIVmNPT3li?=
 =?utf-8?B?QjZlVTNvZndsUmNock45RDRXQXREcm9PWDJCbmI3T291RkpaRkNsUXRKT2lr?=
 =?utf-8?B?dUNhMER1d1NBOEM2TmVHNHNKRWtDSWhpTDlqOTczWW1TUjZRNys0OUkydThu?=
 =?utf-8?B?ME1kT29udytpUXhJK3pFLzNXWElOSENteTlEVE5TQU5uZjhGRWhtNjVtM2Zr?=
 =?utf-8?B?K3ppdFdYc1J4YzNQRGh0Tldia0E3SXk1STdJeHo3VFhkWWpUZDlHU3RBa1hz?=
 =?utf-8?B?RklZdjFOOExRWGFhcW1vemZWZUFxUS9xQnpsUktVaGdlN3lQVHJXOThZYXdu?=
 =?utf-8?B?ckFTRTJRakhkOWVpRHF4TWxqSmVIeGd1a2lNaGhCQzJBQTVRRnIrb3N6cFMz?=
 =?utf-8?B?aHptNE45ZWpxZXF5YmY5aDBObUFzU2dIL2phTWlXOVNZSE5RcWo1cHNFcXFV?=
 =?utf-8?B?YjRkanBaNXlsZ0xtZHRSY1ZGUzNJU2JmWUlKYmhlU0ZaQXhDUTdJcThQMHR0?=
 =?utf-8?B?NnVXMHM0cnJ5cWlTOFgyM3d3Nk1iSUh4czJRbXJ6SzN5RHhaZnlTdjdIOXhx?=
 =?utf-8?B?dVp6MXFCMUhhRnZaVm5ac2hya2NXM01jS3haUDVYZyt0TWxEWmZwb0dVYkpJ?=
 =?utf-8?B?TTJnZmxFTysvT0NNWng0L0VxUVZiR1VGUWZSVk16MTRrWUxobUFsSW9CSzhO?=
 =?utf-8?B?MGNVLytJd3pRQ21DMHd1SmNkaTcwZk5pV3owOC9jVG9FWkpWcjVKVGhhZGp1?=
 =?utf-8?B?Ulp6bW1yVDRJcHBtaStQTUtXOXpGMVlwV2NZRE5zVmw5bDZ4QUU4OStOb3Nq?=
 =?utf-8?B?L0NLVUFyVWhXempoWHJ3SXU4NXJEeUVZTkJRL0JwdENnN2dnTmJBdkk3QmZJ?=
 =?utf-8?Q?FYSqmPBInDP/5Zx/djawIGyThaDNvjAbSmDGPX+8mfyi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94F213955B80254F9CB25E8519EE3837@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58578e8-fb86-4eb7-2b86-08dd57e8b8ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 11:11:59.8516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 08SegZMGG2DrnOB7K72G0e2kE1Zy88/RL6sYQm1vB93GtoGxoll0t2wqNRTMKQ1Qg41MAaNrDNJDDxs5OMRH3hcNg4hAVpnZnKKlaoxSCfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4734
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SGksIE1hdHRoZXcNCg0KT24gRnJpLCAyMDI1LTAyLTI4IGF0IDEwOjIxICswMDAwLCBNYXR0aGV3
IEF1bGQgd3JvdGU6DQo+IE9uIDI4LzAyLzIwMjUgMDY6NTIsIEFyYWRoeWEgQmhhdGlhIHdyb3Rl
Og0KPiA+IENoYW5nZSB0aGUgc2NvcGUgb2YgdGhlIG1pZ3JhdGUgc3Vic3lzdGVtIHRvIGJlIGRl
diBtYW5hZ2VkIGluc3RlYWQNCj4gPiBvZg0KPiA+IGRybSBtYW5hZ2VkLg0KPiA+IA0KPiA+IFRo
ZSBwYXJlbnQgcGNpIHN0cnVjdCAmZGV2aWNlLCB0aGF0IHRoZSB4ZSBzdHJ1Y3QgJmRybV9kZXZp
Y2UgaXMgYQ0KPiA+IHBhcnQNCj4gPiBvZiwgZ2V0cyByZW1vdmVkIHdoZW4gYSBob3QgdW5wbHVn
IGlzIHRyaWdnZXJlZCwgd2hpY2ggY2F1c2VzIHRoZQ0KPiA+IHVuZGVybHlpbmcgaW9tbXUgZ3Jv
dXAgdG8gZ2V0IGRlc3Ryb3llZCBhcyB3ZWxsLg0KPiANCj4gTmljZSBmaW5kLiBCdXQgaWYgdGhh
dCdzIHRoZSBjYXNlIHRoZW4gdGhlIG1pZ3JhdGUgQk8gaGVyZSBpcyBqdXN0DQo+IG9uZSANCj4g
b2YgbWFueSB3aGVyZSB3ZSB3aWxsIHNlZSB0aGlzLiBCYXNpY2FsbHkgYWxsIHN5c3RlbSBtZW1v
cnkgQk8gY2FuIA0KPiBzdWZmZXIgZnJvbSB0aGlzIEFGQUlDVCwgaW5jbHVkaW5nIHVzZXJzcGFj
ZSBvd25lZC4gU28gSSB0aGluayB3ZQ0KPiBuZWVkIA0KPiB0byByYXRoZXIgc29sdmUgdGhpcyBm
b3IgYWxsLCBhbmQgSSBkb24ndCB0aGluayB3ZSBjYW4gcmVhbGx5IHRpZSB0aGUNCj4gbGlmZXRp
bWUgb2YgYWxsIEJPcyB0byBkZXZtLCBzbyBsaWtlbHkgbmVlZCBhIGRpZmZlcmVudCBhcHByb2Fj
aC4NCj4gDQo+IEkgdGhpbmsgd2UgbWlnaHQgaW5zdGVhZCBuZWVkIHRvIHRlYXJkb3duIGFsbCBk
bWEgbWFwcGluZ3Mgd2hlbg0KPiByZW1vdmluZyANCj4gdGhlIGRldmljZSwgbGVhdmluZyB0aGUg
Qk8gaW50YWN0LiBJdCBsb29rcyBsaWtlIHRoZXJlIGlzIGFscmVhZHkgYSANCj4gaGVscGVyIGZv
ciB0aGlzLCBzbyBtYXliZSBzb21ldGhpbmcgcm91Z2hseSBsaWtlIHRoaXM6DQo+IA0KPiBAQCAt
OTgwLDYgKzk4MCw4IEBAIHZvaWQgeGVfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSkNCj4gDQo+IMKgwqDCoMKgwqDCoMKgwqAgZHJtX2Rldl91bnBsdWcoJnhlLT5kcm0pOw0KPiAN
Cj4gK8KgwqDCoMKgwqDCoCB0dG1fZGV2aWNlX2NsZWFyX2RtYV9tYXBwaW5ncygmeGUtPnR0bSk7
DQo+ICsNCj4gwqDCoMKgwqDCoMKgwqDCoCB4ZV9kaXNwbGF5X2RyaXZlcl9yZW1vdmUoeGUpOw0K
PiANCj4gwqDCoMKgwqDCoMKgwqDCoCB4ZV9oZWNpX2dzY19maW5pKHhlKTsNCj4gDQo+IEJ1dCBJ
IGRvbid0IHRoaW5rIHVzZXJwdHIgd2lsbCBiZSBjb3ZlcmVkIGJ5IHRoYXQsIGp1c3QgYWxsIEJP
cywgc28gDQo+IGxpa2VseSBuZWVkIGFuIGV4dHJhIHN0ZXAgdG8gYWxzbyBudWtlIGFsbCB1c2Vy
c3B0ciBkbWEgbWFwcGluZ3MNCj4gc29tZXdoZXJlLg0KDQpJIGhhdmUgYmVlbiBkaXNjdXNzaW5n
IHRoaXMgYSBiaXQgd2l0aCBBcmFkaHlhLCBhbmQgdGhlIHByb2JsZW0gaXMgYQ0KYml0IGNvbXBs
ZXguIA0KDQpSZWFsbHkgaWYgdGhlIFBDSSBkZXZpY2UgZ29lcyBhd2F5LCB3ZSBuZWVkIHRvIG1v
dmUgKmFsbCogYm9zIHRvDQpzeXN0ZW0uIFRoYXQgc2hvdWxkIGNsZWFyIG91dCBhbnkgZG1hIG1h
cHBpbmdzLCBzaW5jZSB3ZSBtYXAgZG1hIHdoZW4NCm1vdmluZyB0byBUVC4gQWxzbyBWUkFNIGJv
cyBzaG91bGQgYmUgbW92ZWQgdG8gc3lzdGVtIHdoaWNoIHdpbGwgYWxzbw0KaGFuZGxlIHRoaW5n
cyBsaWtlIFNWTSBtaWdyYXRpb24uDQoNCkJ1dCB0aGF0IGRvZXNuJ3QgcmVhbGx5IGhlbHAgd2l0
aCBwaW5uZWQgYm9zLiBTbyBJTU8gc3Vic3lzdGVtcyB0aGF0DQphbGxvY2F0ZSBwaW5uZWQgYm9z
IG5lZWQgdG8gYmUgZGV2bSBtYW5hZ2VkLCBhbmQgdGhpcyBpcyBhIHN0ZXAgaW4gdGhhdA0KZGly
ZWN0aW9uLiBCdXQgd2UgcHJvYmFibHkgbmVlZCB0byBkZWFsIHdpdGggc29tZSBmYWxsb3V0LiBG
b3IgZXhhbXBsZQ0Kd2hlbiB3ZSB0YWtlIGRvd24gdGhlIHZyYW0gbWFuYWdlcnMgdXNpbmcgZHJt
bW1fIHRoZXknZCB3YW50IHRvIGNhbGwNCmV2aWN0X2FsbCgpIGFuZCB0aGUgbWlncmF0ZSBzdWJz
eXN0ZW0gaXMgYWxyZWFkeSBkb3duLg0KDQpTbyBJIHRoaW5rIGEgbmF0dXJhbCBwbGFjZSB0byBk
ZWFsIHdpdGggc3VjaCBmYWxsb3V0cyBpcyB0aGUgcmVtb3ZlKCkNCmNhbGxiYWNrLCB3aGlsZSBz
dWJzeXN0ZW1zIHdpdGggcGlubmVkIGJvcyB1c2UgZGV2bV8NCg0KQnV0IGFkbWl0dGVkbHkgdG8g
bWUgaXQncyBub3QgcmVhbGx5IGNsZWFyIGhvdyB0byAqYmVzdCogaGFuZGxlIHRoaXMNCnNpdHVh
dGlvbi4gSSBzdXNwZWN0IGlmIHdlIHJlYWxseSBzdHJlc3MtdGVzdCBkZXZpY2UgdW5iaW5kaW5n
IG9uIGENCnJ1bm5pbmcgYXBwIHdlJ3JlIGdvaW5nIHRvIGhpdCBhIGxvdCBvZiBwcm9ibGVtcy4N
Cg0KQXMgZm9yIHRoZSB1c2VycHRycywgSSBqdXN0IHBvc3RlZCBhIHNlcmllcyB0aGF0IGludHJv
ZHVjZXMgYSBwZXItDQp1c2VycHRyIGRlZGljYXRlZCB1bm1hcCBmdW5jdGlvbi4gV2UgY291bGQg
cHJvYmFibHkgcHV0IHRoZW0gb24gYQ0KZGV2aWNlIGxpc3Qgb3Igc29tZXRoaW5nIHNpbWlsYXIg
dGhhdCBjYWxscyB0aGF0IGZ1bmN0aW9uIChvciBqdXN0DQpnZW5lcmFsIHVzZXJwdHIgaW52YWxp
ZGF0aW9uKSBmb3IgYWxsIHVzZXJwdHJzLg0KDQovVGhvbWFzDQoNCg0KDQoNCg0KPiANCj4gPiAN
Cj4gPiBUaGUgbWlncmF0ZSBzdWJzeXN0ZW0sIHdoaWNoIGhhbmRsZXMgdGhlIGxpZmV0aW1lIG9m
IHRoZSBwYWdlLXRhYmxlDQo+ID4gdHJlZQ0KPiA+IChwdCkgQk8sIGRvZXNuJ3QgZ2V0IGEgY2hh
bmNlIHRvIGtlZXAgdGhlIEJPIGJhY2sgZHVyaW5nIHRoZSBob3QNCj4gPiB1bnBsdWcsDQo+ID4g
YXMgYWxsIHRoZSByZWZlcmVuY2VzIHRvIERSTSBoYXZlbid0IGJlZW4gcHV0IGJhY2suDQo+ID4g
V2hlbiBhbGwgdGhlIHJlZmVyZW5jZXMgdG8gRFJNIGFyZSBpbmRlZWQgcHV0IGJhY2sgbGF0ZXIs
IHRoZQ0KPiA+IG1pZ3JhdGUNCj4gPiBzdWJzeXN0ZW0gdHJpZXMgdG8gcHV0IGJhY2sgdGhlIHB0
IEJPLiBTaW5jZSB0aGUgdW5kZXJseWluZyBpb21tdQ0KPiA+IGdyb3VwDQo+ID4gaGFzIGJlZW4g
YWxyZWFkeSBkZXN0cm95ZWQsIGEga2VybmVsIE5VTEwgcHRyIGRlcmVmZXJlbmNlIHRha2VzDQo+
ID4gcGxhY2UNCj4gPiB3aGlsZSBhdHRlbXB0aW5nIHRvIGtlZXAgYmFjayB0aGUgcHQgQk8uDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQXJhZGh5YSBCaGF0aWEgPGFyYWRoeWEuYmhhdGlhQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5j
IHwgNiArKystLS0NCj4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
bWlncmF0ZS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ID4gaW5k
ZXggMjc4YmM5NmNmNTkzLi40ZTIzYWRmYTIwOGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
aWdyYXRlLmMNCj4gPiBAQCAtOTcsNyArOTcsNyBAQCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZQ0KPiA+
ICp4ZV90aWxlX21pZ3JhdGVfZXhlY19xdWV1ZShzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkNCj4gPiDC
oMKgCXJldHVybiB0aWxlLT5taWdyYXRlLT5xOw0KPiA+IMKgIH0NCj4gPiDCoCANCj4gPiAtc3Rh
dGljIHZvaWQgeGVfbWlncmF0ZV9maW5pKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmFy
ZykNCj4gPiArc3RhdGljIHZvaWQgeGVfbWlncmF0ZV9maW5pKHZvaWQgKmFyZykNCj4gPiDCoCB7
DQo+ID4gwqDCoAlzdHJ1Y3QgeGVfbWlncmF0ZSAqbSA9IGFyZzsNCj4gPiDCoCANCj4gPiBAQCAt
NDAxLDcgKzQwMSw3IEBAIHN0cnVjdCB4ZV9taWdyYXRlICp4ZV9taWdyYXRlX2luaXQoc3RydWN0
DQo+ID4geGVfdGlsZSAqdGlsZSkNCj4gPiDCoMKgCXN0cnVjdCB4ZV92bSAqdm07DQo+ID4gwqDC
oAlpbnQgZXJyOw0KPiA+IMKgIA0KPiA+IC0JbSA9IGRybW1fa3phbGxvYygmeGUtPmRybSwgc2l6
ZW9mKCptKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwltID0gZGV2bV9remFsbG9jKHhlLT5kcm0uZGV2
LCBzaXplb2YoKm0pLCBHRlBfS0VSTkVMKTsNCj4gPiDCoMKgCWlmICghbSkNCj4gPiDCoMKgCQly
ZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gPiDCoCANCj4gPiBAQCAtNDU1LDcgKzQ1NSw3IEBA
IHN0cnVjdCB4ZV9taWdyYXRlICp4ZV9taWdyYXRlX2luaXQoc3RydWN0DQo+ID4geGVfdGlsZSAq
dGlsZSkNCj4gPiDCoMKgCW1pZ2h0X2xvY2soJm0tPmpvYl9tdXRleCk7DQo+ID4gwqDCoAlmc19y
ZWNsYWltX3JlbGVhc2UoR0ZQX0tFUk5FTCk7DQo+ID4gwqAgDQo+ID4gLQllcnIgPSBkcm1tX2Fk
ZF9hY3Rpb25fb3JfcmVzZXQoJnhlLT5kcm0sIHhlX21pZ3JhdGVfZmluaSwNCj4gPiBtKTsNCj4g
PiArCWVyciA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCh4ZS0+ZHJtLmRldiwNCj4gPiB4ZV9t
aWdyYXRlX2ZpbmksIG0pOw0KPiA+IMKgwqAJaWYgKGVycikNCj4gPiDCoMKgCQlyZXR1cm4gRVJS
X1BUUihlcnIpOw0KPiA+IMKgIA0KPiANCg0K
