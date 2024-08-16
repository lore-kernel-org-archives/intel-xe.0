Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472B2C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F46010E7EA;
	Fri, 16 Aug 2024 15:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+VHLNha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BD610E7EA
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820676; x=1755356676;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8Sy5GNnQr4XbI/K/OBmyqAFqIrcMCkN55+zRtPk+TAU=;
 b=Y+VHLNhaRmK72K7PC2/BoEZTO0mx+hpTM3Ld1r0sXfC/nPfPzUHpOw0f
 VcvfCMp6/lquCIGQ0qBVpz+P7dhTdfwDcR5vFHJgxl7D7QtW0eMyOa0Xf
 /tpxxT6HXUNCDe/ZhFBJcIPfzR3SfNaMKfb2AeotvQziITne90DkKdqkM
 HY0GbFIO0pZYNAVSh3ndlN585/Vj4rFoY/dpKr2vgPPXm320lTXIxib5C
 3dGCmpmeB9YRp+BT6Q00KQ148dscd9ZKeiwloy5oc59EY0G0mten0PQCh
 QF6XgTUTo/eYyXs/AYdBwCECcn1ijfVHzn4j21y1COD/yhgxRiafeVlv4 w==;
X-CSE-ConnectionGUID: JDsabUoTRcCO11fQB1SruQ==
X-CSE-MsgGUID: NVTDlVXKTm2riEUJr7BWEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="13054509"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="13054509"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:04:36 -0700
X-CSE-ConnectionGUID: zHbnm1V9ThCEu6ek3tvtjw==
X-CSE-MsgGUID: oZ+bVXLTTM+JtyhYVDyZ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59384794"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:04:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:04:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:04:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKA6FdT35VHK8/ZXd6KYs47OWMzigFGo6v/BfM6xANAmmcte1sUsZBK3wpgXo+45pmvLYVySTbgV5BA+G2B4L1bGqYmTncJM30vJ/km9VtDQWHPGAFisBljuRR3dD5rUN97VvzU90Ot+P6uVGEfLGifMpLNml3YhypeJOKSzIUGhqvPMKC9D3JqRdjZb3a+P58lX7EZfKhI1/jajmTZ7ofTzblsVxqS8HFhSnJBdIhW20VljdPRhETOj9riuKzFknE7nQFuU+WmzDQNCVaMTw1HknJALkJU5GWsUtCduDesFmi0STEYWScuA1KBIkikssdVjdjGs/HRbdlRpjHuG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWUM5XSxHbawEK7mpMGzc/GeuzjUJXjVQ1eDocGbtZY=;
 b=m3AhwmImbW312uvZSEmRMygyemChCFiUkN90FWFopbPzr0qe1FmM8UntYoQs1SGQ1IUI/siS0ueZTlzPawAFOEK3pbPg6SrtWiEDH6sgTCcntq8P+tUdfAuTJu6QeWYSja8L50UaIhlNtTbW721wgCYnP4Dw5CX2341B000bK9OMx0GBHlJo0cOz64NGOHrgILq6+ooByMzxTfWkTq8o5jLGmWPvfexQRLohGAd3TwOYRl9t7i5arhf2wp5FhTS6GEVbCLy4YbAlPEXxu1OtSC6V0DFKUxX+DbAQdTC+Q5RRV+UnWmW6AaYfunE1bd59Qy5EJLnw/7TLXhQBb2LXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 15:04:31 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:04:31 +0000
Date: Fri, 16 Aug 2024 11:04:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 04/12] drm/{i915, xe}: Avoid direct inspection of dpt_vma
 from outside dpt
Message-ID: <Zr9qez1j2-Xp7VG6@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
 <20240815220732.49675-4-rodrigo.vivi@intel.com>
 <fdtthw5qcngmwdzqltik6voazr2yhx4qtnspyawi6c5gfj2fl6@dpjv3qcqnt7n>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdtthw5qcngmwdzqltik6voazr2yhx4qtnspyawi6c5gfj2fl6@dpjv3qcqnt7n>
X-ClientProxiedBy: SJ0PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:a03:338::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd23f39-4b0c-4758-b233-08dcbe04bb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzBNV1hERGkzcUs3NU1LODQ2SVVDUkdadUNxeThHcGp2MUxncVUzRnpsY3FK?=
 =?utf-8?B?RXlueHlxVitDVXlVdFhWWGZyL3ZzdGNwbFBKQ3BSOXh2YUJKNzFMNXNHUW1B?=
 =?utf-8?B?UmlhTGVhNHk3Y2JNQjN4NU1GcDZsejF2akdXemVuNldlczFIWk9aUHM4N3Q3?=
 =?utf-8?B?aWVBS3hYWEROYldqcFJFb0xQdU5GVG91MmphUEU3VWxWQk9hYmtnVXBoa1p1?=
 =?utf-8?B?Z1EwTkRSdGw2SThVR2tYenFzN1NQbVpNZ0pCRU1PN3I3MXhqa2xpT1BQY2wy?=
 =?utf-8?B?bjJNSit3U2pZVFlpU1J4S2VEcGZNSitobzdaZEhWU1o4Uzg1M3VHTUxnTldQ?=
 =?utf-8?B?U3JDRTlXeHhyakJ0dEVlTGFidmRid1EwSDBUaEF5RUZxMElSM0s1V0NxTEU1?=
 =?utf-8?B?RTVoSFdENE9va2ZpOHZVMjFXNFpad3luZXJiMFVXVTczTk9EWDkwTGdERWh2?=
 =?utf-8?B?d005dFV6eEV4Qi8xczV0RUtBQ0oxVWQrSGV5NXZRVmY4LzlLVi9HSlFVaW03?=
 =?utf-8?B?RDNMT3Q5OWJDMENYYXJxMDhURFl2dFNtN1diQ0xVdXFDSmZiQW1OL2FEMlBR?=
 =?utf-8?B?enpBcnFFb1BKR1pyaFlQK2pUb3dCa2cycE8rbUpvQ1JGNGRKNUx2MFFZakQ5?=
 =?utf-8?B?ZFVCSktjR01pU2xTaHYvNFhBM0hYZTdITktvZlRhN3JNK25pbnFrdWpmajdD?=
 =?utf-8?B?Skd1WEY2aW9Va2JEazRSdCt2NW9vV1cvZDdWZUpoNmJ1aDQxb1pwTnVIb1lr?=
 =?utf-8?B?aXBpYVNnUHo4WlNQOFFDckNQdVEyUnVkY0grcEoxeVB6cmdtTFZ1ZnI3REFh?=
 =?utf-8?B?Y2pjeGVYQzNrQWI5ZGZiQlo5bEtNK0hUTURPSkFUcmJIaWVzQmxyYm9DVVRp?=
 =?utf-8?B?cDM4akFWZUZWMWxudlh1eVE0TlhZVU1vcWM2M2JEMW45MUg5K3FDdWtjNHpG?=
 =?utf-8?B?d01mSFo2QktwaGF4QXkwNjBBZ2Y2b05RTnV0ZmhNZHdJajVHWnAwak9SbERt?=
 =?utf-8?B?SmV5RUtzblRvb1ZKUFBxaGhOdTV1MUVEb0FDYmtGTEdmdHBJbWQ1NWxmcXJI?=
 =?utf-8?B?NFJkNXE3K09SeTFHZXU0QXVvdHlrM25rbXNaWjNTZGM0YW1oUlRhVDIxVTZt?=
 =?utf-8?B?endhQ1ZsWVgwcG1nVlVCRXoxTnc2VytoNVBtc2pLL2h1dnUybGE0T3djUjF6?=
 =?utf-8?B?VFJkajNlZzBpbTV5TDVEMG44ZnBoYWtiTWpHUi9DNHdFOSs1Yk1EZW44alA4?=
 =?utf-8?B?NjIrUE55V3dLZmJsQTA1L3pFUGxnSElZQ01xRVVNOG1YOEtWVGZMTlFVenBZ?=
 =?utf-8?B?ckM5WjhXc2dtcUtmRE56RlYyNUdZMkVLZkx3dDdCN0lQWWwrZU1vNitHaWNN?=
 =?utf-8?B?TFlwVDU4M3JxMFI2RVVTcG1VTmpBK2NXRUtkeGtPUllvZjhRV3lSeEsvb1ZQ?=
 =?utf-8?B?dSs2Y0dvY2pGTHB0T285N3A5U0JDTnAvUE11WWhrS1ljMG1uRUFTYVprOEZo?=
 =?utf-8?B?Tk9GYmhHc0xNNlRBa1l5Wkx2Z1MyL3RGT0tHKzU1MzFvM2doaWIybHFnRzlP?=
 =?utf-8?B?b2RPVUhmc0FLdTZ6a3dwblpiaWp0eE9QTWhVYyt3YS95eG5mdWlsMDQyU3RN?=
 =?utf-8?B?TFROSFN5STh5Y1B2bTQ5aTE1b2tzVlVBK1J0cnVEb3dVK0dyNysxUnorOXZ1?=
 =?utf-8?B?Ukhsa2lJMzB5UVhIUCtkMkhtZUxndGVwRmdHa1NyTVNocmdrUDRYMDJyWGRz?=
 =?utf-8?B?QTQwbW1VSERVR0E4eGdvM2d4YlRCNGVqamhVQWoxcG50TUdGd3prODBUTXFO?=
 =?utf-8?B?QXR5ZTAxK0VtRkQrL0FOUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm1xTXVTQ29ZOEU0cjk5SHpsbFBMaG1QMG9HVWtwZE5BeHFuMjVHdkJNcjlJ?=
 =?utf-8?B?c1VsQlN5YmN1REltQWtvSXE2S01DSHZEeUZRQ1NDSVhPR0ZMNmFLRngwZzNH?=
 =?utf-8?B?ZVc0ZFhzMC9keCttemt1bEFwcGlOQk9aRGlNdEJtTDViU0Y0VzBvM251UXZY?=
 =?utf-8?B?eXYwb3ByaXNiZkFDUUF2TTRGTlVJRStqeDJEZWxUMDcvME9qRGd1OFZXOFhQ?=
 =?utf-8?B?djNiOG1SOTgyM3NBSTdPbXB1YXJmZkZJQituVGRWM0F2NlF5M0JTblJoZ244?=
 =?utf-8?B?Y3BGUFU1dUdGUmlrK2ZoaFN3RHlxajVzZk9qcXdhb1JvcWlGdTVwU0RHRS9s?=
 =?utf-8?B?aUNJUCtncllRVll4cGdVckRxNzVUdlQ2emw1aFF1U2RVbzNGeWplU1RBenFw?=
 =?utf-8?B?RmdFbGJ0UFZPeGxMMi9GMWdGNGlNRmdPU3NkMXJpUm1vV0NGMzJCaUJhajcr?=
 =?utf-8?B?RitIa3RYNUs3ckxpdUozVGI3bXFheE1NQUFHZDM4Wldhb29hQU5uZjdHQnFy?=
 =?utf-8?B?OVk3dUtyR0ZGRXA1UE8wY0xOTzFhaW5FVVFIeUh0cDVaVVBJUndCUlFZcVlZ?=
 =?utf-8?B?ZnoxSXppYUcvMjB6ajc2MkZOTWRrVmNRdkVWUXkrZXNvTlMxY0pvbDNiajhQ?=
 =?utf-8?B?QjBEVC9kOEhBWjREQzg0VG1TbXRGVlYvU0tZVngwbE1SQ2xaTzQ3bHJ4U3p2?=
 =?utf-8?B?d0JTVkJZZDVJV2dTclJxWDlIZHNWam93aFNxNTcrU2RtTldyR1NQN1hQZEpj?=
 =?utf-8?B?cENSUjRKS0tKRXpjWVBYTENOUldWWGg2MCtLR3BuRWhyT3FjTW1uckhHSUFJ?=
 =?utf-8?B?U3Z1bFNiWVZ6TzVKR2RDSElSZDJGSjNsUkZXaGdvelhRYkdPZXNhbUlFOVdp?=
 =?utf-8?B?N1Qrd2VGRy9jeTk2c0c3eGtyNnN0L2JkUWwzZk0yOU5nWW50ZXIzN0FmOFQ4?=
 =?utf-8?B?Uk4wcFV5eEUrVm53WXp4K2VkSWM4MEkyeWdEekZxQ2VZeEdTUVp3N2RDMjJB?=
 =?utf-8?B?alZPRWZHUGR5VFl1UHhpaWdFZkxsRW4zbkYxckxTTTU3QVlsdWtsZy9iM2pV?=
 =?utf-8?B?Q2ZPZ1YxUVlYWDBpdFZ6ZVIwSXdUS1dFY1EyM3NGc2Z5clVhQ3RWbWZOTlBX?=
 =?utf-8?B?dmxYQmVDR3JZSXkwQXlQZngxZmY0QkU4U2loa3ZFb1lWNEtTWXl1YjBYdkJk?=
 =?utf-8?B?NlVtQmk2VEo1SmsvR24yS1duQWg5dzRnTVpVMCtvWW8yMk9FMTZHWWo0ejlz?=
 =?utf-8?B?U2FuSWMxb094R1Z5dHkwL1ZzTmFKNHRrajZJNE9Od1B6ZjU3bmdsM3JMSElJ?=
 =?utf-8?B?V25GMllKS0FuMXcyRWI4dkxDM1VpcE84Nys5S3QrbzRrZ01YODRmWm1tWEFq?=
 =?utf-8?B?aUpQUmRlWVFVcDZldGsreXVSd2ZUSklYd1VXcmo1NTVKY0ZUZ1RxWXR4NytK?=
 =?utf-8?B?NWpQK2FQTjNkMGwvcGJ6M1NCdzZTdWhLdjY3VUd5b2VOVVlEWTE0VXpBL1hj?=
 =?utf-8?B?aS8yY0lxZHo0eGxXd1hWY1hjTTBRSEhPRERydXJnYkZXY3U5RTlZNTc3am1V?=
 =?utf-8?B?bkNzN1ltbUZZU2pnRHdiZGNmYzdwV3hGblFZVWFnTW90Q2tzcWx4aFFqSmM1?=
 =?utf-8?B?anhTS0pTTk5PQ255ZXRDazBRdlZnWU1oQUJTVkIvdS8vWDZ5d0NhcmJNeEVm?=
 =?utf-8?B?cDk3cFgxd0p3Mzl6WmhQMWpEY3FmTlR2KzhYQnA1UHo3R2RQMytTZTdPS3NM?=
 =?utf-8?B?OENVMzFHVnNmL1M4aXpQcnJHSDR6Y3hMclRwMnRxV2NGWFhzUi9DcGVVR2Fm?=
 =?utf-8?B?bmtiL2EvYUpVcUE5aEFZcUMxdmY2WUFSV09DbnpNUGRzQTJrNnUwUW9tRCtI?=
 =?utf-8?B?a0ZWb3RVUnpTb2d1a0kvd2Jib2E1eW5EWVRLMVV0Rmdha2lqRmFibEs3cVJJ?=
 =?utf-8?B?dXd5WVBKS2MrcUYxSW9Pa2RlbThqaDlLbWprYkh6am5JU2tRWlo2TndibGZ5?=
 =?utf-8?B?c3dqQnA3M3R4bmlNZi9TY1pVTlUvVFlMWFo3UllzNHBXdmVsUE1XRUxFRFBN?=
 =?utf-8?B?TjEyWmN4NVZHZzEwRDMzWm9sYjVjdmhoTXNrK2s0YlVNMHpPNzh0WEhrankr?=
 =?utf-8?Q?3JWKGBR6Q4qOeuauM7LX7fS6J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd23f39-4b0c-4758-b233-08dcbe04bb1a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:04:30.9916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/x86LwuSEAKpZhgi8s+0n/Uelwi4ke3U2EIrVMnp2jjB6ZQKqpvXm6EMzKfI+cF7JtPjU+WrrZZRbntd7IIVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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

On Fri, Aug 16, 2024 at 12:16:36AM -0500, Lucas De Marchi wrote:
> On Thu, Aug 15, 2024 at 06:07:24PM GMT, Rodrigo Vivi wrote:
> > DPT code is so dependent on i915 vma implementation and it is not
> > ported yet to Xe.
> > 
> > This patch limits inspection to DPT's VMA struct to intel_dpt
> > component only, so the Xe GGTT code can evolve.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/i915/display/intel_dpt.c           | 4 ++++
> > drivers/gpu/drm/i915/display/intel_dpt.h           | 1 +
> > drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
> > drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
> > 4 files changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
> > index 73a1918e2537..3a6d99044828 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> > @@ -317,3 +317,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
> > 	i915_vm_put(&dpt->vm);
> > }
> > 
> > +u64 intel_dpt_offset(struct i915_vma *dpt_vma)
> > +{
> > +	return dpt_vma->node.start;
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
> > index ff18a525bfbe..7336e905142d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dpt.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dpt.h
> > @@ -20,5 +20,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
> > void intel_dpt_resume(struct drm_i915_private *i915);
> > struct i915_address_space *
> > intel_dpt_create(struct intel_framebuffer *fb);
> > +u64 intel_dpt_offset(struct i915_vma *dpt_vma);
> 
> CI doesn't show the exact line, but build is breaking here:
> 
> ./../drivers/gpu/drm/i915/display/intel_dpt.h:23:1: error: unknown type name ‘u64’
>    23 | u64 intel_dpt_offset(struct i915_vma *dpt_vma);
>       | ^~~
> make[7]: *** [../drivers/gpu/drm/i915/Makefile:419: drivers/gpu/drm/i915/display/intel_dpt.hdrtest] Error 1
> make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/i915] Error 2
> 
> #include <linux/types.h>
> 
> to fix it.

Thanks. I had seen the build failure and thought I was on some wrong base or something
and didn't carefully look that.

> 
> And CONFIG_DRM_XE_WERROR in your .config

The oddest part is that I do have this here.
In both of the machines where I was always building this code
and absolutely no warning of any kind! o.O

> 
> Lucas De Marchi
> 
> > 
> > #endif /* __INTEL_DPT_H__ */
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index ba5a628b4757..1cf1d5c8b9dc 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -14,6 +14,7 @@
> > #include "intel_de.h"
> > #include "intel_display_irq.h"
> > #include "intel_display_types.h"
> > +#include "intel_dpt.h"
> > #include "intel_fb.h"
> > #include "intel_fbc.h"
> > #include "intel_frontbuffer.h"
> > @@ -1162,7 +1163,7 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
> > 		 * within the DPT is always 0.
> > 		 */
> > 		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
> > -			    plane_state->dpt_vma->node.start);
> > +			    intel_dpt_offset(plane_state->dpt_vma));
> > 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
> > 		return offset >> 9;
> > 	} else {
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index d7db44e79eaf..42d431ff14e7 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -377,8 +377,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
> > }
> > 
> > /*
> > - * For Xe introduce dummy intel_dpt_create which just return NULL and
> > - * intel_dpt_destroy which does nothing.
> > + * For Xe introduce dummy intel_dpt_create which just return NULL,
> > + * intel_dpt_destroy which does nothing, and fake intel_dpt_ofsset returning 0;
> >  */
> > struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
> > {
> > @@ -389,3 +389,8 @@ void intel_dpt_destroy(struct i915_address_space *vm)
> > {
> > 	return;
> > }
> > +
> > +u64 intel_dpt_offset(struct i915_vma *dpt_vma)
> > +{
> > +	return 0;
> > +}
> > -- 
> > 2.46.0
> > 
