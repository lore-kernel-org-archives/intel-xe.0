Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51FBE6FE26
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 23:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3558A10E2DA;
	Tue, 23 Dec 2025 23:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMZDYp4x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080AA10E2DA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 23:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766533194; x=1798069194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PFf1qMhYUsfjESiB8fS/97WdZhgNz+BleZZT8VjJH0E=;
 b=iMZDYp4x1qJalj9ukrorLNVJoc5cJ6P+StyZNVyt17nmzbN7mGWkiJh2
 6u352YyQu3/Xqfk3DV3sB2gtrSPkobnQZ0wuO61eiQjNyqBkvthrHULXr
 tz53ugIessEeMcSdz07h53G7jvoW2a4RbZ7x0Mfo6WIV0io6n6ioRIbNi
 SS7VE0gHdDJoMizEQm5QFe92dWWdIe2Cr+esjp5/tE7P/tAVsFM0QONh6
 43VVBr8tbuqKGKeW5k3A4DaGIiXido4yUez8VXCCUEx6b8pR7ImdbOM/v
 BIWz2RdqPygyIS4dpYdUVhgsv+pULA4l40mWEDl2TDg3/9D0JdqzclxA7 g==;
X-CSE-ConnectionGUID: V9zVlbauQteXbM+NFoCfQQ==
X-CSE-MsgGUID: tM9+/ZYzRpacZThTwAuczA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79741246"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; d="scan'208";a="79741246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 15:39:53 -0800
X-CSE-ConnectionGUID: dZP6c/BKTdyk3N2Ec5hQdg==
X-CSE-MsgGUID: tYu69jNyT/Kc3Lld+IRCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; d="scan'208";a="199641258"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 15:39:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 15:39:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 15:39:52 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 15:39:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlhhWCFdv/U7Os16H+0r4BpbJ5mZjXQDXD6iO4yM8Uf63m/ebTZUQEMH5qse3lhRGae9YnbRVhmA/58RbZ6jRdAE7pOYdb6ZoRy7Cl1a6D7SSIbr2Rv5tpg6+9DBgnmuebZC1aVmgjH7uXaU/MPyBKNyf8tMLiZx65N47weXUrOU40sFlnX/zJYmcLnko471EKOCCstUKroup6N30EZ5o/4n1qa3Gxrx+OXIws6cdp+/8SGppqSaMbeY7SW9kYg4ATftMKFqzVyyU4wOJv5Q0pZoSsYyFA5ZHcDm/TiP8SxebOmf9/GgH9+JLs23K4hzBL7BfpZpvDYw6zMu/fylpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9LJffpzJLUF6a+bnG+eaGmoIYMWiuQDt1LRc+sAeng=;
 b=zUFtUZE1Y3a4W1UM6x7GVn0K7ihCoor/TqyHPthySTosvGuhPbL/TUkwmLhINe5Lx2Sgh8dJz2T/ss2pTlkJ2/sasxuB/akZ8ZmkoTc41G1TfArnKSpxMHSx9N4tj4NppwaPco4/EofuxFo0yIQCJJqfe+jnQ2/3bXq+QyxDoI3bqHJUXRAHDG3g4rkpjw7KE2nGMmkufFHGSsW3SK7W9oKE0mUr6iJwH56k3C/nLLnFTi8e5Ebmse6n7TYNb1+Y0oBjb/2dD8mjqCm4quQjPC2oNv5A4aQmvML5zOCSKOGo9O6z3ZL27k6HkhngkRyb+OS2/Z87lcG5t1M1u+V0cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 23:39:50 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 23:39:50 +0000
Date: Tue, 23 Dec 2025 15:39:47 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Return EBADFD from read if EU stall
 registers get reset
Message-ID: <aUsoQy89xwWAAkmM@intel.com>
References: <6d78578c015b12e7ae243727ca7ed4b93551075d.1765174462.git.harish.chegondi@intel.com>
 <87fr97worl.wl-ashutosh.dixit@intel.com>
 <aUnIQQl7yQ9G7EwR@intel.com>
 <87ecolwzt7.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87ecolwzt7.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:303:8d::24) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ca6eed-573d-42d6-e157-08de427c90bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzRROCtJbFNpR1pRUWVIWTZmQUlEZG04U0R2NEM1bmJvaFNQb2tMYzF6VnlQ?=
 =?utf-8?B?Z1JvV0xCbEEyTHM1L1k3R0Y4UXNGOFBVcDNLS0FoNEpzbXpjMHJZNGg1aEZx?=
 =?utf-8?B?MVh0NkROUk51d1F2eEpVWndmNExsa3NBTm4xQVRtdklOLzFNa2tWWUorNzcw?=
 =?utf-8?B?U1hQejZTelc2RjNDUjUyTUpFZjYvV1JBOUx2ZURpMnJJN1R5LzdUcXFGcW82?=
 =?utf-8?B?M0pNdlBKTXorYVh1a2tOcjVkbUZxUjZqZmh1SUREeVRiUjE4OGZxaTFrSGNW?=
 =?utf-8?B?KzB2dlFQZU9ad1JZeEdyalFEalhXV1Y3TEthNXpiYWZqUUJFL21RWENqUGhR?=
 =?utf-8?B?SXVHbWFYYnRoWjYyWlVrMmtHYmV3UDMxNUVQbmowclQxTEkxN0JqRTVRVHVl?=
 =?utf-8?B?Zk5JdUVlRlROcHR4NU5KKzdxcTRmMURORW83OUd2UHVUQ1hDeS9LU1FUcjZU?=
 =?utf-8?B?RkJLMExTbzJwekhhTXRyNjBVaFhSSmd4VGpaeE91SENVc1VDcVBDN1QxS1VF?=
 =?utf-8?B?c1NOaDE2MmhjV09UWTF4ZXpCcGRyL2l3UjJCQ3RocldGOE1zdkJUR1RkdGl3?=
 =?utf-8?B?b3ZZK0YwWGg1WlRQSkdlYkIyYi9keVFTc1NVd0grTzNpbHhOaFk0RS96WVpW?=
 =?utf-8?B?UkFqdUd3bnFFdFlUVDMwNkhabmc3U0VRSy8vcFVXSVpjZlRhVktpZ0hFTHFE?=
 =?utf-8?B?TkEyNGFCN1o5cHhrSGR3ek1XWWF4aGNXNFlRK05lNG1JUWZJOStvTUcwSktG?=
 =?utf-8?B?MTBCSmFaaVVNMDlFM2tQRGJYVEtncFNaYTUyeit6azcvYjZLVVl0Yy9lRGd5?=
 =?utf-8?B?RHIwRVBpL3gzMXRjVnVsOXBoNS9KME1nWGdML1I0anAyNEwzWlVtMFlTd2Z5?=
 =?utf-8?B?WVlDa3lNYk9kOEdoZmZQT2R5N1ZpL3k2RlppajFSdnREK2c4eWZZKzlKOEZ0?=
 =?utf-8?B?bXoyUWsrWENSY3pkRlVpZkhqOGtweXkwUjNFMWpMRXZjRUtuZTFIamJrS0lU?=
 =?utf-8?B?Z0lGWW9yc29aeDM0TFFjR3BpNS9ia2l1M0g2YjhvKzFFQ0JTQnlMbHZYYXhy?=
 =?utf-8?B?Vk1DQ2RhUk1VRUVFaHd3L3daT1lMYi8rcGQrdVVFelBiR2Z6enEzbFRydFZr?=
 =?utf-8?B?VWplbTZDMm1GbHluUWl1WXh1UlNCdUxlRmljMllGdm0wTVQxZVY3YmIydmhW?=
 =?utf-8?B?SndJMnlDNStlU0EzSXg3bkIxU0QxRXFFNWVoVVdzYUZtenlVZ0tWdTNGRmJi?=
 =?utf-8?B?ZnFYRlBGY1FiVDk1ak9SSTNGaXFEYzF0TUxjYUI2TXZzWXZnMC85aHJ3U0FO?=
 =?utf-8?B?K3pqaDJVMGNDM0tOckoweWs5SlViWGEvYWVFQXhDcXFzSjc2cnpTK0xQUEJ1?=
 =?utf-8?B?eWV2Q28xWnloeGJnKzhEUFltUk00TFFEait1cE5aSkoyZEdyRUg3ZFpFQUIw?=
 =?utf-8?B?Sms4UkdocGZBdFh6SVNKL3pNVDlPOC9NRTRqT0VEaGdkNkg0U3k1aUNQOXVT?=
 =?utf-8?B?eldERGRFMVkyTk5WTmowRHJJbzRmSVJObW1tUnRRakdMSmUzYVBpRFpKS1Nw?=
 =?utf-8?B?ZzVCby9Fd2ZmZVZtb0pMMkwzdzdKVnVPckRLMTFRT2xRTTV6U1d4NDJab1ZY?=
 =?utf-8?B?QmVMNmFmTFZhTGJWaVJTb0gwRUlBUEtsWkh3eFlKNFhGSkhUSkYzcFJVRlFW?=
 =?utf-8?B?eUU3bE9HSmpXMG9jemVJSEFzcWNIaVRscE9CSGRwRWtWRVRnOU5tT3pORzR6?=
 =?utf-8?B?NStvZHZ3Ni8xYi95WnZJMkMreHcyVEdVdVBCeG5uQXdtbGp0TElFNmtaWjNq?=
 =?utf-8?B?cnpUb2FpUDNQbEgwcnpxcDlDSWcydldHR2RBSW5ncGxKRHY2ck96dlhmUVBp?=
 =?utf-8?B?NEtRQldiUkI2Y1YyTlR5NUk3Q3lSZTRKdmtxS2dNM2E3SEZqTXNkOW0yMzla?=
 =?utf-8?Q?/KHo/qpRkp0VJ6gK0bjDiFEzgXVWVu9M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME85OGZqcklKd0tNeW5LUGdibytPL0hpRmNzTUJFRFp5ZDV1U0hsTG1FSlpC?=
 =?utf-8?B?bjR1YVZCUWFqQVhCWmVrYU1OZUw1Wk1GNGM4WHZtSTB2YjZMWWRpcmUzSVUw?=
 =?utf-8?B?ZVMyMHVZeEFEUWR4UHY1ZnJ6Z1ZSc3I5T3pjRE93STBtM0VwQ2tzZHJ1NklH?=
 =?utf-8?B?SjdzUG90WE1OYjIxb3ZRUDN0UW5JVm5ibXNmb2ZYVEFCNkx4ZVJBMzFTaWk1?=
 =?utf-8?B?cXhCdjB3K0Vwc1MrWkxwZDloOVlyMm1wRWZXOXFpSkdLb2ZERVhCSktGeThE?=
 =?utf-8?B?VGZDZFQ0UFBpU0xkS3Z6cVhaYUxJTHIrUkQ2Rm1uaGJuTmErWGZsZzFDYi9p?=
 =?utf-8?B?cytRZU9paXRZQ1g4SjhGNE1aL2tQQTNFMUsvK3UvUjMrOWNZcVMzbERmQVN0?=
 =?utf-8?B?Z1Z4Y25Obkh0VGp0OWdlb1pndTA2dHRzSkJqYVUzUGszMEVrcytEYkZOeGJJ?=
 =?utf-8?B?RWhXZEhxaldnUTRIZTFZQ1F2L3dkbkRoczVobXBmMStuQVhoVU9heW50RFp2?=
 =?utf-8?B?S3VNYlBsSVk1aXhETXpEMXVSR0JZdlcrTTdTTEN0SXhnME4zb0VQZ0cvK3Nl?=
 =?utf-8?B?ZnhtOGwvcTlXYnIwVVJmSkUxL2hMcVdrWGQzMGFHUXdFbloyNG5FTkczWDRW?=
 =?utf-8?B?NXJOMUZleVFzS0Z0WnFvbSsxU1FPa0d2T2ltZXozWEpvei90NEJUOHJVdnVU?=
 =?utf-8?B?RXJ1N0djb0JyOWpud3AxcGJjWFYrLzA3Vldock4rYzk3UlJqdGZPcXByOThU?=
 =?utf-8?B?UXplOFhpS3VTT01sTVdDS0E4cCt0SDRtQlpTK3FRbmRMZ3dGcVBrQXNYVTha?=
 =?utf-8?B?UnBKSjlhS2JTc1p0ZlV3eHR0OTVaN05Td2lSUjB0OGplYzN2dENIM1BkcnRZ?=
 =?utf-8?B?MTlua21sNVhUUFBRMVJCcUQrcXYxTVRmaFc1NVBoclYyUWtVRjBKRXlCeFB1?=
 =?utf-8?B?ejJtTXBiUGxuOVc5ZnBTQlQxUUZMYU5yditLdStDRE5UdUdPRFVPbnhqdXlk?=
 =?utf-8?B?ZjFwT3JSWjBmeGpCMC9iaEMyRTIzOFdOWlBkMW1PaHRVZlQ4VDNqSGZJa2Yy?=
 =?utf-8?B?NE50VkdtZUdkVUZYcW1xaWhlMXptenVIVzRZUWs0Mzl5VGxhb2x4NlVSYjhy?=
 =?utf-8?B?eTI3NWNtS2FHSDZQRG1sdy9tS21VNWhVQnVmREtPZ2hPOFZEL0d1SHJ2WFJz?=
 =?utf-8?B?WkxiS2Fnc21OUkRram0vaVJhR09OVzREbEVSTXNLay9VM0VMYjE5b3ByRmQ1?=
 =?utf-8?B?U0pwYzE3NDY0QTNuaXhoSUw2K3d2NENaUVNDRzZ6VHl4dFI4MitkS3hybHNB?=
 =?utf-8?B?UlZOZWFpd05JdGlOcCtoNzdnTnlsNG1PWFZlTXhMNUNDQlR6ZUtvQ0RRUkt2?=
 =?utf-8?B?blp3bG9NQXp3RlY3bURJaWpHU3FjbXFIM3I1bEV3RjhWM0IxUDMvTkI3RnNE?=
 =?utf-8?B?cldzQ2pRbmM0VDBvYXpSQ2RIUGZRTFd2bWVzS2dCdFYySjlCUjFldXUvWTJP?=
 =?utf-8?B?ZmdGWUU1ajREMmlnZEZMK3JOWmI1NkM5anJlK2N2cTlQNTZoOGxyN0ViNGx4?=
 =?utf-8?B?dTYvWUpSaFpLdnYvankxWGlNRCs0S3hNOXBaajc1a3hYY1ZXWjhYRDZYVkp1?=
 =?utf-8?B?dDN4ZnVMNThuMDkzR1dORDFFM2FwanJyTVJDRGpiTlF1KzdRVk9CMkJSNmFK?=
 =?utf-8?B?d2NYdktaaHVnNnl5dURFMkhEN2dGUXpCZndJWG1xU2FOL1J4S2kzZnVza043?=
 =?utf-8?B?U0JJblllbm8yRmtTYm9ISlBGN0x0elJVNHREMmhieUp4dUo1VlU2aEZUQUJM?=
 =?utf-8?B?Yk5DQTkyWkxVaUowMGt4ZWFLV3hOb1lLcmFPTFBMdTBxUmVsRTdpOFVLZ0RB?=
 =?utf-8?B?Slcxd1VrUmdNSjVuZFhWUGxlWkZPdWllOW5rUVNxY2E2aTk2UStpeDI2MzRV?=
 =?utf-8?B?a2lraHVaUnZOM0pJV3pmb0JkVnIzbGZnZEhYMTJveXhLK0tpVXV2MVF4b01r?=
 =?utf-8?B?VDhHa1Z6S2lBT0ZtSXZCcDk4amluVDZoNnBsd0JmVGFnL3Y3bkZybXBxQzhT?=
 =?utf-8?B?WVZGVGZDcVlSVm1WcCtxT0pXS2xBUTVWMzd1OGtSRHc3YUVwUEIwYVZEMG8x?=
 =?utf-8?B?dWJpUkRmS01BSTMwMXhMNlpSeVREYVdsMVRXUGt2Y01sYVA2T1ZhOHdOZit4?=
 =?utf-8?B?eDlYT0wrYmVlclVmUnBuWFFtajkxbVIzam9RNmJVbU9NWHdaWDE0aUU4eVFV?=
 =?utf-8?B?eW5PNk9IQk9GNHY3YWE1ekZ2WTZFZ2d3dUl3V3QxRGVENkZkcnAzZFBrdnJJ?=
 =?utf-8?B?SnRDdU42TkVOMmdqYTZsbUpJTWRLd0ZXZndoQ0dCbUJXUGF2dngrcW81dDlM?=
 =?utf-8?Q?w/hsNr8Yvx1Dzirs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ca6eed-573d-42d6-e157-08de427c90bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 23:39:50.5857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Kk/J19SJzzq9p1xz1oWjqE82yu4CXMq5C9YM+50eA2einsFZO/uE+bdpld0e4vMO+RTv5VrCTB3TV95AYnKbcK2YkX/bYtamvVIU9DGAPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
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

On Mon, Dec 22, 2025 at 09:08:04PM -0800, Dixit, Ashutosh wrote:
> On Mon, 22 Dec 2025 14:37:53 -0800, Harish Chegondi wrote:
> >
> > On Thu, Dec 18, 2025 at 11:53:02AM -0800, Dixit, Ashutosh wrote:
> > > On Sun, 07 Dec 2025 22:16:11 -0800, Harish Chegondi wrote:
> > > >
> > >
> > Hi Ashutosh,
> > > Hi Harish,
> > >
> > > > If a reset (GT or engine) happens during EU stall data sampling, all the
> > > > EU stall registers can get reset to 0. This will result in EU stall data
> > > > buffers' read and write pointer register values to be out of sync with
> > > > the cached values. This can result in read() returning invalid data. To
> > > > prevent this, check the value of a EU stall base register. If it is zero,
> > > > it indicates a reset may have happened that wiped the register to zero.
> > > > If this happens, return EBADFD from read() upon which the user space
> > > > should close the fd and open a new fd for a new EU stall data
> > > > collection session.
> > > >
> > > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_eu_stall.c | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > index 97dfb7945b7a..02c0beb4559f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > @@ -541,9 +541,24 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> > > >	size_t total_size = 0;
> > > >	u16 group, instance;
> > > >	unsigned int xecore;
> > > > +	u32 base_reg_value;
> > > >	int ret = 0;
> > > >
> > > >	mutex_lock(&stream->xecore_buf_lock);
> > > > +	/* If a GT or engine reset happens during EU stall data sampling,
> > > > +	 * all EU stall registers get reset to 0 and the cached values of
> > > > +	 * EU stall data buffers' read and write pointers are out of sync
> > > > +	 * with the register values. This can cause invalid data to be
> > > > +	 * returned from read(). To prevent this, check the value of a
> > > > +	 * EU stall base register. If it is zero, return -EBADFD. The
> > > > +	 * user is expected to close the fd and open a new fd.
> > > > +	 */
> > > > +	base_reg_value = xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE);
> > > > +	if (unlikely(!base_reg_value)) {
> > > > +		xe_gt_dbg(gt, "EU stall base register has been reset to 0\n");
> > > > +		mutex_unlock(&stream->xecore_buf_lock);
> > > > +		return -EBADFD;
> > > > +	}
> > >
> > > So I am seeing two problems here:
> > >
> > > 1. We are doing register read every read() call, rather than just when a
> > >    reset happens.
> > >
> > > 2. The other issue is should reset itself unblock a blocked poll() or
> > >    blocking read() call? If we don't do that, it is possible that poll()
> > >    or blocking read() remains blocked indefinitely and so either the
> > >    non-blocking read() doesn't get called at all, or a blocking read()
> > >    remains indefinitely blocked. So that we never actually return -EBADFD
> > >    even though a reset has happened.
> > >
> > >    (Note that, for exec(), I believe any blocked fences will unblock and
> > >    return error etc. if a reset happens during an exec() call (see
> > >    reset_status()), so EU stall should probably do something similar).
> > >
> > > So to address these two issues how about doing something like this:
> > >
> > > 1. Call an EU stall callback from xe_guc_exec_queue_reset_handler(). In the
> > >    callback, if an EU stall stream is open on that gt, check if
> > >    XEHPC_EUSTALL_BASE is 0 and set a stream variable stream->reset under a
> > >    suitable lock (likely xecore_buf_lock).
> >
> > I thought about this and I think this can be racy - if read() is called
> > after the engine and the EU stall registers got reset but before the
> > stream->reset is set, the read() would return bad EU stall data. I think
> > the XEHPC_EUSTALL_BASE register should be checked either in the polling
> > thread or in read (as in this patch) to avoid any race conditions.
> 
> In that case we need to ask GuC team about "pre context reset" g2h/h2g
> messages/callbacks.
> 
> Is it possible to deduce that reset has happened from the write_ptr
> register which is read in eu_stall_data_buf_poll? Say what happens to the
> mask bits when reset occurs (why are the mask bits there in the first place
> in a register which cannot be written by SW)? Then we can use that to set
> stream->reset, and not have to introduce an extra register read.
The write_ptr gets reset to 0, but it happens when the buffer wraps
around too. I am not sure about the mask bits, but I can check what
happens to them after a reset.
> 
> In a sense read() cannot return bad data since it uses cached read/wrt
> ptr's. So as long as we catch the reset while updating write_ptr, we should
> be ok.
> 
> Or, can we can drop the constraint that read() will never return bad
> data. If a reset happens, read() can return bad data.
> 
> Or do you have any other ideas to address the issues I mentioned above?
You earlier suggested about checking the base register in the polling
thread. If we set the stream->reset in the polling thread, it can be
used in both read() and poll(). Do you think this would address the
issues you mentioned above ?

Thank You
Harish.


> 
> >
> > >
> > > 2. From eu_stall_data_buf_poll(), if stream->reset is set, return true to
> > >    wake up any waiters. We may also need to set POLLERR or POLLHUP revents.
> > >
> > > 3. Now from read(), if stream->reset is set return -EBADFD.
> > >
> > > So I think something like this solves both problems mentioned above.
> > >
> > > So could you please look into this and see if this is possible? Or any
> > > other thoughts about this?
> > >
> > > Thanks.
> > > --
> > > Ashutosh
> > Thank You
> > Harish.
> > >
> > > >	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
> > > >		if (!stream->data_drop.reported_to_user) {
> > > >			stream->data_drop.reported_to_user = true;
> > > > --
> > > > 2.43.0
> > > >
