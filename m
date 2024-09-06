Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6A3CE7AFC
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 09:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDCB10E9DD;
	Fri,  6 Sep 2024 09:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkwieGCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D91C10E9D9
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725615909; x=1757151909;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5nKyiTginwWp0dh+t3/y+NIvTv72dZKSlTZL1X/oxCw=;
 b=BkwieGCUPIBTwcGKL4eorR+cUv5fu1Fvgp3TrPmzNzum45mkL0YKOo8n
 7q8yVSLasQ4KWfj0jsn4113B1zBbqocC9TFaP2swhtmnCwnZYlY6lsz3o
 Jug2D0h4nZgkjjbcI4QoELwyYLQHqu00m+rLuIeOP6x4SxHMw7xxKo0sH
 esmJ3FwIp/JsjFy5cmDNIZxHYMsjjmRrC01O/F3akfXywATOPi4cvmJiL
 qoltEkncBO5PMyG35zdbunDCZL4vGpC4PSVyM7RzSP6ER7P4IgCs8myZw
 aR05eIIRS8LOxc+JkUGuvJxDY6S9Nx4Y6HxDFNxEQ4tXJmFqAfj2t1v2Z Q==;
X-CSE-ConnectionGUID: 5JvKwGYDQkqQ9zJYxn+AeQ==
X-CSE-MsgGUID: 5q11FhhpTNqbeEm++i6Hig==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24564014"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24564014"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:45:08 -0700
X-CSE-ConnectionGUID: gPNvdgzBSSG8ynt36lcccw==
X-CSE-MsgGUID: fEijYRcqQ/C5cxsUy4vtZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="66239989"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 02:45:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 02:45:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 02:45:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 02:45:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 02:45:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oef3H7Hf+e63FIiWsDOM2e3dpiyZ73CxEjGAY4MlYegjCNriO99Oic8X0FpQ4Y0b6TKP/5K15zJAOkk1cDmzU0Gs8dmc/s0LG2ZuZBE/tIJ1GQilWKTjh1fl/hOPlGZXm3h/LxOlFsb0UCS//nxSjzVNiRSLBcJwiYXhD5b3z7RvOnCGbikmcBZBDTJytCEd2K4X3FAVwo5L+dkyBPN/wbjpFZDxDpZsSbmp0p7oeOdeFc2WpzkW+sirCgS8b0/46EuR79jgVtVWZRgAnZEkRF/No4eN3BaDPE6mst4N8cfB3g/FPRPM7NZrlnylPd4ITUKH396/bUkkF4LAHOgKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nKyiTginwWp0dh+t3/y+NIvTv72dZKSlTZL1X/oxCw=;
 b=spJ33PhuF9YKtOfOtrS6an7FH8EcztXV70L+aduhrgLfbwsaWLIUKoCFKtKTyVOvtiUVJkm91JxHwCHgBoAL8U4DpmqTEr9rVG6oB4EW9ShAAw3iH8zljL90wkB0YYN4eTa6Ui6Hz+dJxc/ZT3p69q7y93iISZkOlvKpcC+PT5Lup8IseG/M8qrRihw9hzRjaaT77M2KxGzdg8NH+IQBl4JeoC0L5t/7qOQUDZ2HxuTe6qNmajczoMwjxhQRL4nFnn4Zv3Ot7lMwas5h+qK8Rig0oh//Pcv4fh3XyuqGQOYAnh6xIGqnOCNLany6UNn59mbvqE//cXhDC0qnEwG6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 09:45:04 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 09:45:04 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Remove runtime argument from display s/r
 functions
Thread-Topic: [PATCH 2/4] drm/xe: Remove runtime argument from display s/r
 functions
Thread-Index: AQHa/6R1MZggT3cIbUi4l1RgWieUsLJJZmwAgAEdLgA=
Date: Fri, 6 Sep 2024 09:45:04 +0000
Message-ID: <51452e250231d8bf58b460c313461fdae417589f.camel@intel.com>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <20240905150052.174895-3-maarten.lankhorst@linux.intel.com>
 <tsaiwhxdaoxqoftx34onq3a4nuvrpkgxko6mdiht6djb5gnb5n@khycsb3zqegt>
In-Reply-To: <tsaiwhxdaoxqoftx34onq3a4nuvrpkgxko6mdiht6djb5gnb5n@khycsb3zqegt>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|DM6PR11MB4580:EE_
x-ms-office365-filtering-correlation-id: db5ba4f0-7d73-4beb-aed1-08dcce5895c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?emQrSnhnNU5xU285QkQrZ0wzS01UeUtOT0FCbzlsbG5pbEVzNXdwTm9Nc1Q1?=
 =?utf-8?B?VFQ2dEp4bUplb2U4OVRVQ3NZOXd4RWI0ZW9pOTlRVEYvVTFNMkJVSUdobFNG?=
 =?utf-8?B?MHpDTWNacFRjeTJ4S1NTeVdXSGRuQlc2L3ZPY3E1Vm1pQXpoZndBRnIyVjg4?=
 =?utf-8?B?a3grY1JXbTUvcUpoZ0lBM0g2ZDVLLytWRGc0N2lZOGZqYkgzWnZ1UHBOdHJj?=
 =?utf-8?B?ZHJLRHZibjZkMGxtdkpxZVJic3ZIZFRKRXZpNmY5ZzlZT3VKbDE5bDRYcm1K?=
 =?utf-8?B?bVJPNUVZdjc0eFlKZkcwNnNYV2dYU2FrVDl3QTJZQ29URVBhSGFMQnBpbUtt?=
 =?utf-8?B?MGY1bmxxTS96QXB4WVNrQTQvc0UwZm5QTHJVc0dQVkdQa1FobDJsSTlZdENq?=
 =?utf-8?B?TGJVT1dJa0pERS9mbVRSV1pKTW1RUmpuejNvSGt1SWJsVmxqcThPMmd1Q0tw?=
 =?utf-8?B?NVJRbXROUUF3akZJMGNPbFRZdkZtbmdDaXpUYmNHcUwyOGZ3U3ZIRWIvZE9n?=
 =?utf-8?B?K3JIZWQ1OHRDSWFpMFgzb3dWV1lWVFVzZFV1SnFMYUtaejVWS1ZMMnIweW1O?=
 =?utf-8?B?aFFHMklLQ2hyYW94MDBGNTd6ZGlHOG0xeTQrdTZ6R0RWdkIyYVlyNVhUOGph?=
 =?utf-8?B?ekQ0STdaTytSa2dKM2JERmYyRkZHcUprL1licjNWamxPeDJ3eDMrZ3dWZEZh?=
 =?utf-8?B?ZUFXcWhlMHFaUVM5MVNEWVdiMHk0Zm9HSFA4amtKRTVtQlNmMUpzZWg3SlpJ?=
 =?utf-8?B?YXhGT0kvMnVuTFBFdVRzUTJZc3hHd0U3cE5NRHpqdzBoMGVsM2ZjbHRyUWt5?=
 =?utf-8?B?dU1sQWlpQUVJNUROSTk4MzdGS0FFVEJmRXFoOEl3RTAydEZGTzJ4U3pOMGVQ?=
 =?utf-8?B?K3pjbW1Xb2FwYmlYbExwQXlkRkRxL2Z6bS94TUwvZmlqWTNNckt5S04zMFZU?=
 =?utf-8?B?ZFgwcmEyVWxBSzBCZlRtV2I0QVc0QzhhZGRVeWF3Y1RsZG5rTjlwd0Z4VWsr?=
 =?utf-8?B?R09PQTBPVjEwS01OdWxjbkNhU3RLeWpNdHlwWnNPTjVGYldDK1hCVmhVY1NI?=
 =?utf-8?B?b25xWmJFWTFoRE9zODM1bXFPdzJMMXJVYmJxZlJDV3dEcVZ4ZjF6S2lQc3Fy?=
 =?utf-8?B?amFRajR2b21OcW5CUE0xbjhCUXNuTFZLU3dJcGxPNmQrWUtoVGRUaHJvOWpW?=
 =?utf-8?B?YmxOcnlvaFk4WURPaW1qWWFrNFNGUHNodmZOdWxTVXFmaEllVmx5UzZncXRE?=
 =?utf-8?B?WG1pbkJrSUdyZWJUVmJqSmpIeTFSV3k3eEs2dTUyUUMybmFtekcxcjdhMlhZ?=
 =?utf-8?B?aDEwcmpaelNBbHpPWVQxemRScEFqa01EeWlNeVZ2Zm81WmZiUHFMYjYyeXpE?=
 =?utf-8?B?UHhiemxKTWtYMUtpODQ2d0l2bVlnRzVUcmNEd25qejBTWlpBNnRnSmR4TVNa?=
 =?utf-8?B?MTgrdWVhUzNDZXhGcDdwcm5RVjNQaU56SzlhWkVlUnNqL1hUa243ZUh1VEVy?=
 =?utf-8?B?Rm5VTEtTLytmdEQ0RFR2U2F6SGxKZDNXYU50N2k0MjNpRnhjcCtNUXdjUzBB?=
 =?utf-8?B?N0Z0WUxFcVFHVnU1MjRtYnlneHg3SjE2ZXhDTjJrWUZvYmpnL3J3WkU5NG45?=
 =?utf-8?B?UlNUQUhuTkRNekx5S2JxaTV4TVJoM1JJUlVIazRLdXZ3V3V4d3BYK0ZIUldR?=
 =?utf-8?B?eWpsaG9tWjFMbUpNZ1NXdmdlOXJKSVZxbFdTV2xuVkdjMmNyYndvZnZZRElM?=
 =?utf-8?B?YlpwWFZFYndCcFFkdkp2VzI1OGgra1hTdFBRNkVrRkZkQ3ZDQy9jRkg1ajBl?=
 =?utf-8?Q?3W2LnNsJZitsrkWqW7bxgMlyS70MzzgVDW+Bk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUNORWhCY2U2SDZkRWhJMmpZcnJJYnBDYnpVaVNpWFhtSUFQN1hDcEk4dU85?=
 =?utf-8?B?dHB3Z2phN3lKVmJab1I0Q3dMamlXLy8zNnpMdkJQd2VBdGp1Y25yTWpCMmpQ?=
 =?utf-8?B?RHN1ZFp0NS81WDhiZkhoVWNPcHdlWEhYZ2NaN084NVV4cDcyeUZNbFdXaG9G?=
 =?utf-8?B?ckhIV0RlMXo3cWp2WDB3TmloN01razlhTVd4QXY2UGpjaStQcE5xazVWeDdW?=
 =?utf-8?B?dmF5UTJMQmhGY0padzI1TTZKeGJGcVRsQ25FSHJQaWQ0NUJ3RDdla1pWRjZO?=
 =?utf-8?B?V2F0Z042ZG5YQ0toMzZIMzZHY0ZkWkRXS0k0bEQ2dmJ5eTQ5MjRqWkJjN0JU?=
 =?utf-8?B?em1wVUx6OWQyeTZBRHJLdCtNUG1zYktwSEQrTXRJUlF0eXpDOVFrV2V6SUcv?=
 =?utf-8?B?OUJ2eWdldlZKaTh0Yzd3VC9NTkIyemEvTkd2d1o4RXZhME1HbGFQek1kOGR6?=
 =?utf-8?B?amEwVEd1T0ZsQ1RiNjJ3eW9mNDhKVFdiNDBzUWFFUXdGOUpCMVZnSyttS2Nu?=
 =?utf-8?B?VFhseE82U1c3MkEzRmovajM5UXRXYmozL2ZZMzBYTU1xb1Y4bnNQMDdtQlBx?=
 =?utf-8?B?c3V5amplSTlaempPZHNzb044dXZEbGhIaXlCOUJKT2tiM2I0OTB4MEx1M2JM?=
 =?utf-8?B?Mk5ZbDBLRWtyNHhpbDVEVDNSQllFTUk3Tkd0cDJFMEM3UGNjWGRSTXRTSk14?=
 =?utf-8?B?N1hUYWRPTU9ySmthOEZGazJ4NldlVERFdkVseXEwajdRSm01WlVsYkNlaDh5?=
 =?utf-8?B?Z2VkSWV6WDRBWG1tZGErR2JRT2hyL01xalhmRjJHTkNSdy9HVHlWSHdlYVhN?=
 =?utf-8?B?QlhsRGhQWHVGeE1EdENTVUIwUW9sajhDOFQwdjNGK2tWNWVkaUpHZUZmaGFW?=
 =?utf-8?B?MUFIb3MxTnlxT3QxZVA1UFJBY3dCM1I3dVBZbUdLTFpTVXZ0YXY0cFNXQmJh?=
 =?utf-8?B?dDFjOURWcko0bXAzZStubGNCOUdUT1lrUTFVWjRuMkZXek00NEMydWVKSlFx?=
 =?utf-8?B?cEZYSnh4MnliTXU1RXYyaXNZdTBOdS9tbHAxWDB3SklGOEoxSVhrSWU2QnZK?=
 =?utf-8?B?blFQVHhFK1podldwS3IyWkdDVWhNOFprTkt0Yzd3elY5NVVoRkthRTNDNFJx?=
 =?utf-8?B?TjloaXU1SXhCdnRlU3lzK1NUckVWUW9JU3JkZkxWQ0RpTXRJNEhLbmpVWEw3?=
 =?utf-8?B?aFpvQmFMVkJPL1NLWjdXcWNjcnZKRUhWYlVWb3V0VlRzL3B6dXZKcjk1c2M5?=
 =?utf-8?B?c0hrYzU2YTFVV0NGOWx6RDVDWGJTYlo0MkJMTFpIRXJPR0x0WWxGRDJBMmR1?=
 =?utf-8?B?WGpnclgrMFZlOHhmck1tRzVIcXg4WEd4Z1JZZ1o5Qm5TcWdQTUEyUXlFUzh4?=
 =?utf-8?B?R3czK0NGT3JkZzhJT25GMDFBL0ZHam5tYitsL0dLVXNuVm9SdVhzVnZSL3U0?=
 =?utf-8?B?elh1WkEyNk1lTitraVJJcXVscE1ZM1NjbjZVUFlzQXJLdEFEOXNKR2liZU1C?=
 =?utf-8?B?eEVBVW9tWE8rSU9rVVdFNmVmdW53V3crTFUrRkVrS1FWZnV0ZENxRE8xeERL?=
 =?utf-8?B?YlNTYzZvMEI4VFlmWW1KeTZUc0ZxOGU5T2VQVmNUcXNsMDNwT3A3M20zVW43?=
 =?utf-8?B?SGlmT1NqK1g3QnlISGFUY0JLZHFrZjBtWW1lNEs4ZFQ1RlZIdmhUMDBscnpJ?=
 =?utf-8?B?QXNwMjNreDQwTXlrZzJUWkVGR2dOSWw4Um16eWprRWJaNjVMQ3lOam1EdTBa?=
 =?utf-8?B?UkpkdG5yTzcwUjFLMVFJN3VuOFBQdUVoemgyZmNMUVlXaHFKOFBhKzFTcGoz?=
 =?utf-8?B?V25FcXFzRzM1U1JtT2tzTi8xbzJCSkFpcnd4MDRRMDRlWFl5K3lQZlJ5Y3JI?=
 =?utf-8?B?U1FVV0JBbm5ESTQ1MXU3T2w5YTVYOXg2VTlZUGZOdmxFMk4vUDV5RUtHZUc3?=
 =?utf-8?B?NGVxVVVtcG9kenJXVEZFWmpzMDRpRnFKM2dTMTF4SHp3VW83ZkNXaU1ybldw?=
 =?utf-8?B?RjBqRlpUM1RrSkRsbzEzUUFPNm4rQ3ExTmJESjluRmxmdW5hbG9KcUxKNGdR?=
 =?utf-8?B?SENqR25YcUg2dVdOYUdVWFVnUWd6QTczNjVxbDdNRzdqcFJWREUySmxKd3Ns?=
 =?utf-8?B?Z2lrdnBxeXVNNS81azAxa01qdFR4SlZ6R1FNOHJmNlZuanRsMXVSK0RBc3Z4?=
 =?utf-8?Q?baEYlAfgpTlDa7RuPxGEsPA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51D8038C144FF14785BA4070996AACF2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5ba4f0-7d73-4beb-aed1-08dcce5895c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 09:45:04.4834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9MzVu84UbdPMcHmM/BfNGAJ3w8ST5B1ik7DuhTqk882/sd0KDI9/6S9JuaS4lmS7K3ZpOFq9DIGZsg4fpyj4TN6JbElOp9rgslaRbqHteA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

SGkgTHVjYXMsDQoNCk9uIFRodSwgMjAyNC0wOS0wNSBhdCAxMTo0NCAtMDUwMCwgTHVjYXMgRGUg
TWFyY2hpIHdyb3RlOg0KPiBPbiBUaHUsIFNlcCAwNSwgMjAyNCBhdCAwNTowMDo1MFBNIEdNVCwg
TWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6DQo+ID4gVGhlIHByZXZpb3VzIGNoYW5nZSBlbnN1cmVz
IHRoYXQgcG1fc3VzcGVuZCBpcyBvbmx5IGNhbGxlZCB3aGVuDQo+ID4gc3VzcGVuZGluZyBvciBy
ZXN1bWluZy4gVGhpcyBlbnN1cmVzIG5vIGZ1cnRoZXIgYnVncyBsaWtlIHRob3NlDQo+ID4gaW4g
dGhlIHByZXZpb3VzIGNvbW1pdC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
IGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYyB8IDUzICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0NCj4gPiBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5
LmggfMKgIDggKystLQ0KPiA+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDYgKy0tDQo+ID4gMyBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRp
b25zKCspLCAyOCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3Bs
YXkveGVfZGlzcGxheS5jDQo+ID4gaW5kZXggYzBlOWFhN2EyNzRmMS4uMzMwNzFhYzNiYzEyZCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMNCj4gPiBA
QCAtMzEwLDE4ICszMTAsNyBAQCBzdGF0aWMgdm9pZCB4ZV9kaXNwbGF5X2ZsdXNoX2NsZWFudXBf
d29yayhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiB9DQo+ID4gDQo+ID4gLyogVE9ETzogU3lz
dGVtIGFuZCBydW50aW1lIHN1c3BlbmQvcmVzdW1lIHNlcXVlbmNlcyB3aWxsIGJlIHNhbml0aXpl
ZCBhcyBhIGZvbGxvdy11cC4gKi8NCj4gDQo+IG5vdCBzdXJlIHdoYXQgdGhlIFRPRE8gbWVhbnMu
Li4gbnVrZT8gb3IgYXQgbGVhc3QgcmVtb3ZlICJhcyBhDQo+IGZvbGxvdy11cCIgYW5kIGV4cGxh
aW4gd2hhdCBleGFjdGx5IGlzIG1pc3NpbmcvYnJva2VuLg0KPiANCj4gQW55d2F5LCB1bnJlbGF0
ZWQgdG8geW91ciBwYXRjaC4NCg0KIlRvZG8iIHdhcyBhZGRlZCBhcyBwYXJ0IG9mwqBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNjEwNDk0LyBiYXNlZCBvbiBpbnB1dCBm
cm9tDQpJbXJlLiBBbmQgY29tbWl0IGxvZyBoYXMuLg0KDQoiV2hpbGUgeGVfZGlzcGxheV9wbV9z
dXNwZW5kL3Jlc3VtZSgpIHBlcmZvcm1zIHN0ZXBzIGR1cmluZyBydW50aW1lDQpzdXNwZW5kL3Jl
c3VtZSB0aGF0IHNob3VsZG4ndCBoYXBwZW4sIGxpa2Ugc3VzcGVuZGluZyBNU1QgYW5kIHRoZXkN
CmFyZSBtaXNzaW5nIG90aGVyIHN0ZXBzIGxpa2UgZW5hYmxpbmcgREM5LCB0aGlzIHBhdGNoc2V0
IGlzIG1lYW50DQp0byBrZWVwIHRoZSBjdXJyZW50IGJlaGF2aW9yIHdydC4gdGhlc2UsIGxlYXZp
bmcgdGhlIGNvcnJlc3BvbmRpbmcNCnVwZGF0ZXMgZm9yIGEgZm9sbG93LXVwIg0KDQpUaGVyZSBp
cyBhIHRhc2sgcGxhbm5lZCBmb3IgcmVmYWN0b3JpbmcgdGhlc2UgVkxLLTYzMjM1DQoNCkJSDQp2
aW5vZA0KDQo+IA0KPiA+IC12b2lkIHhlX2Rpc3BsYXlfcG1fcnVudGltZV9zdXNwZW5kKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlKQ0KPiA+IC17DQo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+aW5m
by5wcm9iZV9kaXNwbGF5KQ0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm47DQo+ID4gLQ0KPiA+IC3CoMKgwqDCoMKgwqDCoGlmICh4ZS0+ZDNjb2xkLmFsbG93ZWQpDQo+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Rpc3BsYXlfcG1fc3VzcGVuZCh4
ZSwgdHJ1ZSk7DQo+ID4gLQ0KPiA+IC3CoMKgwqDCoMKgwqDCoGludGVsX2hwZF9wb2xsX2VuYWJs
ZSh4ZSk7DQo+ID4gLX0NCj4gPiAtDQo+ID4gLXZvaWQgeGVfZGlzcGxheV9wbV9zdXNwZW5kKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRpbWUpDQo+ID4gK3N0YXRpYyB2b2lkIF9feGVf
ZGlzcGxheV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRpbWUpDQo+
ID4gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9
ICZ4ZS0+ZGlzcGxheTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBzMmlkbGUgPSBzdXNwZW5k
X3RvX2lkbGUoKTsNCj4gPiBAQCAtMzU2LDI2ICszNDUsMzEgQEAgdm9pZCB4ZV9kaXNwbGF5X3Bt
X3N1c3BlbmQoc3RydWN0IHhlX2RldmljZSAqeGUsIGJvb2wgcnVudGltZSkNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgaW50ZWxfZG1jX3N1c3BlbmQoeGUpOw0KPiA+IH0NCj4gPiANCj4gPiAtdm9pZCB4
ZV9kaXNwbGF5X3BtX3N1c3BlbmRfbGF0ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiArdm9p
ZCB4ZV9kaXNwbGF5X3BtX3N1c3BlbmQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gK3sNCj4g
PiArwqDCoMKgwqDCoMKgwqBfX3hlX2Rpc3BsYXlfcG1fc3VzcGVuZCh4ZSwgZmFsc2UpOw0KPiA+
ICt9DQo+ID4gKw0KPiA+ICt2b2lkIHhlX2Rpc3BsYXlfcG1fcnVudGltZV9zdXNwZW5kKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlKQ0KPiA+IHsNCj4gPiAtwqDCoMKgwqDCoMKgwqBib29sIHMyaWRsZSA9
IHN1c3BlbmRfdG9faWRsZSgpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5pbmZvLnBy
b2JlX2Rpc3BsYXkpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47
DQo+ID4gDQo+ID4gLcKgwqDCoMKgwqDCoMKgaW50ZWxfcG93ZXJfZG9tYWluc19zdXNwZW5kKHhl
LCBzMmlkbGUpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmICh4ZS0+ZDNjb2xkLmFsbG93ZWQpDQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9feGVfZGlzcGxheV9wbV9zdXNwZW5k
KHhlLCB0cnVlKTsNCj4gPiANCj4gPiAtwqDCoMKgwqDCoMKgwqBpbnRlbF9kaXNwbGF5X3Bvd2Vy
X3N1c3BlbmRfbGF0ZSh4ZSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfaHBkX3BvbGxfZW5h
YmxlKHhlKTsNCj4gPiB9DQo+ID4gDQo+ID4gLXZvaWQgeGVfZGlzcGxheV9wbV9ydW50aW1lX3Jl
c3VtZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiArdm9pZCB4ZV9kaXNwbGF5X3BtX3N1c3Bl
bmRfbGF0ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiB7DQo+ID4gK8KgwqDCoMKgwqDCoMKg
Ym9vbCBzMmlkbGUgPSBzdXNwZW5kX3RvX2lkbGUoKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYg
KCF4ZS0+aW5mby5wcm9iZV9kaXNwbGF5KQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuOw0KPiA+IA0KPiA+IC3CoMKgwqDCoMKgwqDCoGludGVsX2hwZF9wb2xsX2Rp
c2FibGUoeGUpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGludGVsX3Bvd2VyX2RvbWFpbnNfc3VzcGVu
ZCh4ZSwgczJpZGxlKTsNCj4gPiANCj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmQzY29sZC5h
bGxvd2VkKQ0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9kaXNwbGF5X3Bt
X3Jlc3VtZSh4ZSwgdHJ1ZSk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfZGlzcGxheV9wb3dl
cl9zdXNwZW5kX2xhdGUoeGUpOw0KPiA+IH0NCj4gPiANCj4gPiB2b2lkIHhlX2Rpc3BsYXlfcG1f
cmVzdW1lX2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+IEBAIC0zODgsNyArMzgyLDcg
QEAgdm9pZCB4ZV9kaXNwbGF5X3BtX3Jlc3VtZV9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfcG93ZXJfZG9tYWluc19yZXN1bWUoeGUpOw0KPiA+
IH0NCj4gPiANCj4gPiAtdm9pZCB4ZV9kaXNwbGF5X3BtX3Jlc3VtZShzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgYm9vbCBydW50aW1lKQ0KPiA+ICtzdGF0aWMgdm9pZCBfX3hlX2Rpc3BsYXlfcG1fcmVz
dW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRpbWUpDQo+ID4gew0KPiA+IMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9ICZ4ZS0+ZGlzcGxheTsN
Cj4gPiANCj4gPiBAQCAtNDIyLDYgKzQxNiwyMyBAQCB2b2lkIHhlX2Rpc3BsYXlfcG1fcmVzdW1l
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRpbWUpDQo+ID4gwqDCoMKgwqDCoMKgwqDC
oGludGVsX3Bvd2VyX2RvbWFpbnNfZW5hYmxlKHhlKTsNCj4gPiB9DQo+ID4gDQo+ID4gK3ZvaWQg
eGVfZGlzcGxheV9wbV9yZXN1bWUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gK3sNCj4gPiAr
wqDCoMKgwqDCoMKgwqBfX3hlX2Rpc3BsYXlfcG1fcmVzdW1lKHhlLCBmYWxzZSk7DQo+ID4gK30N
Cj4gPiArDQo+ID4gK3ZvaWQgeGVfZGlzcGxheV9wbV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSkNCj4gPiArew0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmICgheGUtPmluZm8ucHJv
YmVfZGlzcGxheSkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOw0K
PiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBpbnRlbF9ocGRfcG9sbF9kaXNhYmxlKHhlKTsNCj4g
PiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHhlLT5kM2NvbGQuYWxsb3dlZCkNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX194ZV9kaXNwbGF5X3BtX3Jlc3VtZSh4ZSwgdHJ1
ZSk7DQo+ID4gK30NCj4gPiArDQo+ID4gKw0KPiA+IHN0YXRpYyB2b2lkIGRpc3BsYXlfZGV2aWNl
X3JlbW92ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICphcmcpDQo+ID4gew0KPiA+IMKg
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGFyZzsNCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5oIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5oDQo+ID4gaW5kZXggNTNkNzI3ZmQ3OTJiNC4uYmVk
NTVmZDI2ZjMwNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94
ZV9kaXNwbGF5LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNw
bGF5LmgNCj4gPiBAQCAtMzQsMTAgKzM0LDEwIEBAIHZvaWQgeGVfZGlzcGxheV9pcnFfZW5hYmxl
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1MzIgZ3VfbWlzY19paXIpOw0KPiA+IHZvaWQgeGVfZGlz
cGxheV9pcnFfcmVzZXQoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+IHZvaWQgeGVfZGlzcGxh
eV9pcnFfcG9zdGluc3RhbGwoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9ndCAqZ3Qp
Ow0KPiA+IA0KPiA+IC12b2lkIHhlX2Rpc3BsYXlfcG1fc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgYm9vbCBydW50aW1lKTsNCj4gPiArdm9pZCB4ZV9kaXNwbGF5X3BtX3N1c3BlbmQoc3Ry
dWN0IHhlX2RldmljZSAqeGUpOw0KPiA+IHZvaWQgeGVfZGlzcGxheV9wbV9zdXNwZW5kX2xhdGUo
c3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+IHZvaWQgeGVfZGlzcGxheV9wbV9yZXN1bWVfZWFy
bHkoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+IC12b2lkIHhlX2Rpc3BsYXlfcG1fcmVzdW1l
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRpbWUpOw0KPiA+ICt2b2lkIHhlX2Rpc3Bs
YXlfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiB2b2lkIHhlX2Rpc3BsYXlf
cG1fcnVudGltZV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiB2b2lkIHhlX2Rp
c3BsYXlfcG1fcnVudGltZV9yZXN1bWUoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+IA0KPiA+
IEBAIC02NSwxMCArNjUsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHhlX2Rpc3BsYXlfaXJxX2Vu
YWJsZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTMyDQo+ID4gZ3VfbWlzY19paXIpDQo+ID4gc3Rh
dGljIGlubGluZSB2b2lkIHhlX2Rpc3BsYXlfaXJxX3Jlc2V0KHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KSB7fQ0KPiA+IHN0YXRpYyBpbmxpbmUgdm9pZCB4ZV9kaXNwbGF5X2lycV9wb3N0aW5zdGFsbChz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX2d0ICpndCkge30NCj4gPiANCj4gPiAtc3Rh
dGljIGlubGluZSB2b2lkIHhlX2Rpc3BsYXlfcG1fc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwgYm9vbCBydW50aW1lKSB7fQ0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgeGVfZGlzcGxheV9w
bV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7fQ0KPiA+IHN0YXRpYyBpbmxpbmUgdm9p
ZCB4ZV9kaXNwbGF5X3BtX3N1c3BlbmRfbGF0ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkge30NCj4g
PiBzdGF0aWMgaW5saW5lIHZvaWQgeGVfZGlzcGxheV9wbV9yZXN1bWVfZWFybHkoc3RydWN0IHhl
X2RldmljZSAqeGUpIHt9DQo+ID4gLXN0YXRpYyBpbmxpbmUgdm9pZCB4ZV9kaXNwbGF5X3BtX3Jl
c3VtZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgYm9vbCBydW50aW1lKSB7fQ0KPiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgeGVfZGlzcGxheV9wbV9yZXN1bWUoc3RydWN0IHhlX2RldmljZSAqeGUpIHt9
DQo+ID4gc3RhdGljIGlubGluZSB2b2lkIHhlX2Rpc3BsYXlfcG1fcnVudGltZV9zdXNwZW5kKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlKSB7fQ0KPiA+IHN0YXRpYyBpbmxpbmUgdm9pZCB4ZV9kaXNwbGF5
X3BtX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7fQ0KPiANCj4gQXdlc29t
ZSEgTGV0IG1lIG9mZmVyIHlvdSBhIHZpcnR1YWwgbWVkYWwgb2YgIm1ha2luZyBvdXIgaW50ZXJu
YWwgQVBJcw0KPiBzdWNrIGxlc3MiLiBFdmVuIGlmIHdlIHN0aWxsIGhhdmUgdGhhdCBib29sIGJl
aW5nIHBhc3NlZCBhcm91bmQgaXQncw0KPiB3ZWxsIGhpZGRlbiBpbiBkcml2ZXJzL2dwdS9kcm0v
eGUvZGlzcGxheS94ZV9kaXNwbGF5LmMuDQo+IA0KPiANCj4gUmV2aWV3ZWQtYnk6IEx1Y2FzIERl
IE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiANCj4gdGhhbmtzDQo+IEx1Y2Fz
IERlIE1hcmNoaQ0KPiANCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+IGluZGV4IDliMTIwNGRi
MTJjM2QuLjk2MGVkNTBlM2E0MWIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+IEBAIC0x
MjMsNyArMTIzLDcgQEAgaW50IHhlX3BtX3N1c3BlbmQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+
ID4gwqDCoMKgwqDCoMKgwqDCoGZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9zdXNwZW5kX3ByZXBhcmUoZ3QpOw0KPiA+IA0K
PiA+IC3CoMKgwqDCoMKgwqDCoHhlX2Rpc3BsYXlfcG1fc3VzcGVuZCh4ZSwgZmFsc2UpOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoHhlX2Rpc3BsYXlfcG1fc3VzcGVuZCh4ZSk7DQo+ID4gDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoC8qIEZJWE1FOiBTdXBlciByYWNleS4uLiAqLw0KPiA+IMKgwqDCoMKgwqDC
oMKgwqBlcnIgPSB4ZV9ib19ldmljdF9hbGwoeGUpOw0KPiA+IEBAIC0xMzMsNyArMTMzLDcgQEAg
aW50IHhlX3BtX3N1c3BlbmQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoGZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGVyciA9IHhlX2d0X3N1c3BlbmQoZ3QpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWYgKGVycikgew0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZGlzcGxheV9wbV9yZXN1bWUoeGUsIGZhbHNlKTsNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Rpc3Bs
YXlfcG1fcmVzdW1lKHhlKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBnb3RvIGVycjsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoH0NCj4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+IEBAIC0xODcsNyArMTg3LDcgQEAgaW50
IHhlX3BtX3Jlc3VtZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
Zm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHhlX2d0X3Jlc3VtZShndCk7DQo+ID4gDQo+ID4gLcKgwqDCoMKgwqDCoMKgeGVfZGlzcGxh
eV9wbV9yZXN1bWUoeGUsIGZhbHNlKTsNCj4gPiArwqDCoMKgwqDCoMKgwqB4ZV9kaXNwbGF5X3Bt
X3Jlc3VtZSh4ZSk7DQo+ID4gDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGVyciA9IHhlX2JvX3Jlc3Rv
cmVfdXNlcih4ZSk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpDQo+ID4gLS0gDQo+ID4g
Mi40NS4yDQo+ID4gDQoNCg==
