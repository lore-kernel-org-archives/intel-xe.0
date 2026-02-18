Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312FCE9A050
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 21:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E13C10E665;
	Wed, 18 Feb 2026 21:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8G4k0ss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F1A10E672
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 21:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771449688; x=1802985688;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+SIWXqAXfBl6sUy2xCAg10gcN7zdNJ5xvrrYWDkZ7I4=;
 b=b8G4k0ssOcj8BFkzIZkZqzBCeFTKkEXZMcjhmgbQFDs7WkOX9TIanKDY
 fy62lChZ9qzlRPVo+HUZQZv31JBUZF2uPjdL1QmIPogvHQ5DcaLjjBM7f
 MStCgOBcoihMb8y093UGKsh9O9DciKmLSZidThEyIwu85n1AfYQvvH5Nm
 G0/UBxL+8vy3Fd3FQNizvDt95Q1bv001IPlB40WcRaBFwHHOGiLxut1v7
 VKxOn87NZPv5KC7/E+UoYG7ZxA+ZTfMa8hBGy9/dTkuyIgStF3FMZoJ5N
 mvRUmiNJwPXw2xwqVUyXIKhLV8www52M9NetIGneI+9UcWAKKEHmNfmN3 A==;
X-CSE-ConnectionGUID: Msf9NfjxTrCMpo6SilVUfw==
X-CSE-MsgGUID: TK3OF+xLQXKxwwC37xiffw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71558155"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="71558155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 13:21:27 -0800
X-CSE-ConnectionGUID: sTN9kyvESNWYHVJsoF36tQ==
X-CSE-MsgGUID: hv7luxlPQ02FPSVm0fwMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213403953"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 13:21:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 13:21:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 13:21:26 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 13:21:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PK1k7jfK6kFdPJ1kKRsuN7xFhiLWhCe1/wtbeq31kq2nzgk5vdB8RCHg0b3v3/aAKE5YdFp5wDEqg7goZ5bs5YERhSRJF+d0O1nR1PuSzJ7sQpDkPllf6/F9wvdukxSX0BxE7WrYtuNR1QBtoGrrABGYnyfWbz9TNJpWGGOmvLxDlvgr8pXpkLb9cNpu84PwvSidQCXJLnef+En8I+nQK5BgNHv/TPycv5FM2h/PWDkmf/BQsm7owqcsGBotL3ExRPhmxKrbQEKj2ZMMyMX1erN+3G6F/blXWpIPQ058kGGxwUlcR/p3h1l6HgKWBcbXZcZNV4k/RZLd+7lAzIqDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PvFmgdnjdU3BP0WrsM9TlI8gRDi28nihHN5TDGwKHo=;
 b=pw60t8A4Zqf60fmtXVOPXPBEPY+hmujg6LWvcsxGKcVOrd/FZ9VtsWe7I7LdHlXmeE6fzFw6/BE0d/sIzyp994SVj4aiOb9KalwPaLWZrvpwDt112J2K2jVVXebaI8ydaJ6S9Fvn2IoxcKpz/aPfTlg6elSjxBy/78zTUB7tHd4cnXhDTQG9GQCEygSeL5xCRra+FOJmpg4T1SuW2MVupSC3QPqeoDaB20B+OqKr+Z5y789i0EcHFUko/NTsTUNKPdQngOqcSXnTbJr4fx1e8zJdHb2BO7RBHyMKBPJkybX/jYQ3GrQoS4bYVpmMHVrId+nYyRBNdRQf/pOIXH17mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPF8B755DBFD.namprd11.prod.outlook.com (2603:10b6:518:1::d36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 21:21:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:21 +0000
Date: Wed, 18 Feb 2026 16:21:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 04/10] drm/xe/pf: Allow to change VFs VRAM quota using
 sysfs
Message-ID: <aZYtTV5WyU27j8PW@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
 <20260218205553.3561-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260218205553.3561-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPF8B755DBFD:EE_
X-MS-Office365-Filtering-Correlation-Id: c85de72f-ef9a-4aa5-0206-08de6f33a966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzYyRjRPemdBcHBVKzZxNlF4RnpjaVRRQkpvT1RUaFZ1OG0yN0tPeWw5bXF5?=
 =?utf-8?B?b0NxMTVBWnBQOEh3YjU5cEhVeFdYQWhxSWl2RWQ1MjJIUllUbk1ENFNrbmhs?=
 =?utf-8?B?R0pTczhSSCtvdGoyejRqMmV5UkhESW4xeEFUTlFyZWdmU1pZczZRSWZyMW92?=
 =?utf-8?B?Yk9ILzlyckFvdkhPa0h4SncxTWkwd1BWQ2lBNTE0bDlaL21HNURNVDNYRmwr?=
 =?utf-8?B?SUZFUWFaOXE1MmVaSEhKU2tSSlpPdWYyL0NvL2Ria0M5Uk84VEZwdk9LaVFM?=
 =?utf-8?B?RmRRMmlzRERXekk3NmVkQkVIVFhINHJ3a0IrbTM2MXFXN2RtZTRUQjV4b2ln?=
 =?utf-8?B?ZjltdGpudW5oMCtDYXBmbHhWZFQ0NC9YTmZPcmdTUXVFNFU0dkh0Rmt2OHkx?=
 =?utf-8?B?WW9STS9VOU5PWksvMzJGU1B0Qkx2a0ZGRXpoTFQxeEJxdTc4cmdLcklqM3VB?=
 =?utf-8?B?MUxZYndqRDYxT1ZiOGhkM2VuRE9mancvWWZxMlhaSmF2NXVMVGVDcFZtN0xN?=
 =?utf-8?B?amwybFRxa0RHaUdHOHIwR1Nqd0pqY0FSUEYwV0EwZ0ZjYUtMd0ZCUFR5V3pG?=
 =?utf-8?B?ekk1dmZYOE5GV1dkcEU0MklneXhIRWdnalJCc2JRSnI1US82MGpaajFDNWg1?=
 =?utf-8?B?OVJXcDZpRGV1SHkvakplMlE3Z1NQeHZZQ2NlcHRiQVpGTXpOdk5MdmJSM0hY?=
 =?utf-8?B?S0E1d1k4L21lZUNJR1Q3SWdIbHFpenJjZ29KUzF3MWxmbW9nSmNPZndyVVlW?=
 =?utf-8?B?Uk5sWi9UY01JR1V4cm9GZVNMREFTUDVycjFjMlVLMnZNcFdidnREWmdPTU1m?=
 =?utf-8?B?YWFkWnQzbk9rM214K3Zpc3VyNHFGYm9EYVlqb0VlQ0YycGpoaTdYeGFLMFRj?=
 =?utf-8?B?akVRZ0YzWTNJQmd6SlVGYjFoWDhjYmRmYnhFc3RLWklPT21LcnYyYzJYNXBq?=
 =?utf-8?B?UEphb1pjd2hVT1B3YjV4akJ5RjhjeThaMVhocEpvZVVKRmo0S2N1alkrUng2?=
 =?utf-8?B?R0diMGcyMHM4eC9LLzg0Y2NzQm1rVEhJUnk2cy85dDhEbXFadFBIcGxMS1ZI?=
 =?utf-8?B?ZVBhNGlSd3owOTVkRm40cnpWb2dsSlFjSDFmUnc0MXNYLzJXUWFwTFRKL09W?=
 =?utf-8?B?Y1huMnlsRGtlTlpFN0hHNzNVbWluR3Bvei8ybGtVU2dlOHRQRmxwQ3NGNzMy?=
 =?utf-8?B?Y2JURTVjNG4yL2JNa0R2NWxYb1p0cVZHMmo4R3hJeEU0MUFCbmxQVlFnTEV5?=
 =?utf-8?B?cGNxTW43aTlWSThXczZTcjRlZ2FwWVE1WnpiU2Y2TzJMc2tRRzg0L2dBM2JU?=
 =?utf-8?B?L1A1cm5BMDZjMlNjNm1udnI0ZnJrUWdWTEVMWDExWWZmRjhIRFZkajBQdHZF?=
 =?utf-8?B?UGhBaUJ1YStPZm1leHRmL0JkYWxpTWl5eEVhQVJFQ2U1bUJqeDRodE1HaHZw?=
 =?utf-8?B?czkrWWNPTTdNM01lWjBjcDJ6ck9INnZUT3FET0R0MFQwL3Fwb1dsVXlScEFO?=
 =?utf-8?B?WlpCMjF0RUtJOGtDNWJ4cXhnVHJNNXlkeHgxWFVqV2QzUEREbG8yclhTcFha?=
 =?utf-8?B?TUNKbis4czBsVjNUSXB6TjA3M08rVjg1YzB2a3BodzNsRktMcGp3T3F6OHBs?=
 =?utf-8?B?ZHFVbmRrSXVueFUrWUF3NDhYL0FIRk1zeGY1bmgzTklaT3RmK1BjdDJMcm9n?=
 =?utf-8?B?OFFQTGVObFRzWFI3WDRaNDkvdENuaWlld3VHOFB2Z05PTk9jL2VaOW05N21y?=
 =?utf-8?B?bFF6R09vMTlzY2E3WXMvdzU0MTJBSFNyMGtrNnB5VjVIdEdhL0ZGR1g4aHFI?=
 =?utf-8?B?QWpSakxTemZNenByakU2dXErV1RlcnFFcmFaNGlEUHAzRXZPNElEZ0lZYlZm?=
 =?utf-8?B?LzBZYlZ6blhPV25pQk5LNHdudUpJOVFqNmQzMVJQdGkwMzdGS0haQTFFaVFH?=
 =?utf-8?B?YVZoVnpGVnpXdDcwUENTUnF5TCtUQUVWUjV1WlY0cGdueU1iQTlkd1dwaEJU?=
 =?utf-8?B?ci9kb1locE9oQWNaOXR1cVk4NGtPZ1lMbEorbzhFeStNQW1JU1ZKRVJjeW1O?=
 =?utf-8?B?emY5aUNzRFpmRHlDcnhHcElSaEFnNkZoMXRsdVM3eDJCeG8ycDFPT2o1SU9Y?=
 =?utf-8?Q?iLgI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDZqSytQSjZDdThzMy8vcUJQaldYQjJBMzdQYWJZWjlDclhlU3kyeFdGeUJU?=
 =?utf-8?B?UmRwUE5XbU81TkRzcklIbTlLTmhMdVNJMUVjUFd1YzJPbVoyRVZFd0xpTWtO?=
 =?utf-8?B?Y1VIaEo2TjJkcDBIWWF5TE9BN2pOUUJMYTZNbDQ0bVd5VnBqMmM0V2VrNU1i?=
 =?utf-8?B?ZFhKSnI2UkVHalpyWVBULzdXY0xjUXN0a2lkVUVpV0RpenZpY1Z1anZVeW0x?=
 =?utf-8?B?QnZIL2VhVlljLzlYSUlMeUROUmg3NTNhc2NuR0Nic3lIQUhpaUNiRXJQZGpC?=
 =?utf-8?B?bkYwcC9ad2RiWEFEa0RyOW5RRUpVR1ROczlZeHQrZHpYTGdrV1lUdmE0L3lx?=
 =?utf-8?B?dDZibHBZMUk3ckY1TjNjQXp5UVVrZCt1VnRralJUcy9zOEVmNEFWelFVWXAr?=
 =?utf-8?B?a1VrWjBtNzJ3NTZGQjZPRGQxaWFWR3paNTJXdkJTRWdIdGljaHNKM1I5T0xk?=
 =?utf-8?B?OXVUR0Jod3lMSXg2OUJ5YVFia0pnenJjOERoZUdqNE5ZRUkwMFZJZkllMlB0?=
 =?utf-8?B?aS9Kb0NaYnVYSUEwcnpNNGdqYjV5eUxaRmhrd2VJYlZmcGI2VUFldjZiR2xX?=
 =?utf-8?B?cTNSWmpIRDhLR3Fvc2tEVEloek9RWFBvVlpTY2J6NFNJSklub3dsQThWOUhx?=
 =?utf-8?B?cUZDV1hzMDllM1BJMXZ2SzFmb2tneXlqWUx4UTZKeE9UdFI1VzBCQi95NEJx?=
 =?utf-8?B?alRFZmVtVTEyWnI5cDRFdVBQZHE5WndUQVUxRzNNdUhtY0ZrZWRoc1JBTVN3?=
 =?utf-8?B?SFE3UFlJc0tGOGdLazZtYzl4WVROTXpyeFJXZGJzQWt4eThCS2JrZi9tVWFZ?=
 =?utf-8?B?WEJNbG0zWXZMcW9HNSs2MVhNOVFycXBzSDJ3Mzl5dElCVTdFU1lobm44SnNT?=
 =?utf-8?B?ZGJkOFozd1V3K25MSDljbHRHd3dlbGxuYkJMOG1UMnJ3a1ZXN3JVMmFOWVlQ?=
 =?utf-8?B?RDI0Qmwwc3ZMK3ZIUmRQTHA1RjZydmVackl4UlBEMzE0VnFpYmxUSGd4ZEVN?=
 =?utf-8?B?RU8xaFdwSTlyOTNBUjZzTmdhcWxaaHhFUE1hSlNBYWhPeEJWZDhZQlBtc01U?=
 =?utf-8?B?aDZrSFFZcmxXSTRTeDYvZkxYQXphMmYwbkhGeTNIak5admwwaDQ1VjJqY1F3?=
 =?utf-8?B?Qmt5L2M3aHRHN3g1R3ordm5UckIvUmF5bzVUTjEwY0MxOXNNRmc3UEZkVzM4?=
 =?utf-8?B?NEpudHdpQ3hVd1V1bElxQ3dpUDNFQnlkYjV2MWhBelZrd3NycXh2TmZQTlNZ?=
 =?utf-8?B?Uk1VMGF3QndpanJSNkcrSmtOUm0wSUh1eWc3Mjk5WHhvTlJWcjQ2QUVZV3Z4?=
 =?utf-8?B?UTBGMEdaRDNieWR2RjlwYlMxaENveUxYb0tnK20vWkVSeU1kbmNWcVR1Z2FS?=
 =?utf-8?B?NU9rV1I1bFJJSzRZRUMzVmk3MmM5K0Z5Ry9idmNVMlBYOHhlQ0tNdTBHVFR4?=
 =?utf-8?B?WGRtNkxVdG1oTmtrVXpjb0FMWkZta1RtOEFJQmNQWUEvbGFZL2tGNWZLSHht?=
 =?utf-8?B?bHA4QTA4ZXB4a0VqVmI2UjdMWHZ6ek9NSjU3c0VNUmhqUEFCS3F4cVF5OTcx?=
 =?utf-8?B?cy9lc0xLc29NZUYrdGxMM0xtZ0sxMXZXaGVyN3VNVlRtS3V4MytheVdXNkR4?=
 =?utf-8?B?UHkzTllhdmtzZnEyZnBldkNMUUptYUN5MFNGUTA0M2p6dGxsbUEwd2NDL3l4?=
 =?utf-8?B?QlZIR1ZoUUVsVEZpUzEyeTFYZ1BIbFFFRDI1bUJrdDVRZWF2am9NNDdvV2Vu?=
 =?utf-8?B?UGVVSWlEZ3RyQUZYdk1EYkRYY05kWUdVbFMwdFl0SWVOMi9BTmlYSEphVmdN?=
 =?utf-8?B?b2kzWjJvL01TdWFad3I1ZGZhc3hYZ2FOZzdTUFgxS1RKZHRVaSs2ZUZUdVlq?=
 =?utf-8?B?Ulk2U2VQS01qQ1NxZHJsU3JNa2xQUklXejJMa25IYWpLL0tNTUpRb1JiK3Vj?=
 =?utf-8?B?QXZucmhEUldTcU9nZnkyVkhIcjZEVS9TZFFiQVRKNG1FdDR2ZGltV2ZvUXkx?=
 =?utf-8?B?NFptOFdrT29icURBQXBlYm0raGxzMThPaXN6QTI0eHl3NU5WRUY4WFFkNWFr?=
 =?utf-8?B?SmFDTzhiMkswTytlU1N2Z2xrNzhvODRScmM0dTRpc3YzeHJUSXNpZ2l4TVpD?=
 =?utf-8?B?a0JlYWdNOHBtdk9SVS9YcGNWeGZZNkh2aUp5dC82VUZ0bnMyZ3NqWTNzNk5M?=
 =?utf-8?B?M0orTzNqV2RBVXg2MzdPMWlyb29QMzVyUGdVUmtFY3RvSGZmb0NuUy9BQVJz?=
 =?utf-8?B?RDBpbkl1ZkVFa1Z1Qm5FdnNuYmt0ODJKLzdwRkEzbmY1Uy8zZ3FHaEJtUlBD?=
 =?utf-8?B?NG5jY2RVS21ValI2dVQ0dnR4MWlpdmRJVVB4WnloS0xNbU9VNFAxZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c85de72f-ef9a-4aa5-0206-08de6f33a966
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:21.1462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP2BorwbDzMAcHb8S2MbjwYYGm6gzeCOBm1tzTvFWzhb1qDVumOTJ3giQZQGUEJy6Dcep49Ju8w6LVN5KL6iXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8B755DBFD
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

On Wed, Feb 18, 2026 at 09:55:46PM +0100, Michal Wajdeczko wrote:
> On current discrete platforms, PF will provision all VFs with a fair
> amount of the VRAM (LMEM) during VFs enabling. However, in some cases
> this automatic VRAM provisioning might be either non-reproducible or
> sub-optimal. This could break VF's migration or impact performance.
> 
> Expose per-VF VRAM quota read-write sysfs attributes to allow admin
> change default VRAM provisioning performed by the PF.
> 
>  /sys/bus/pci/drivers/xe/BDF/
>  ├── sriov_admin/
>      ├── .bulk_profile
>      │   └── vram_quota                 [RW] unsigned integer
>      ├── vf1/
>      │   └── profile
>      │       └── vram_quota             [RW] unsigned integer
>      ├── vf2/
>      │   └── profile
>      │       └── vram_quota             [RW] unsigned integer
> 
> Above values represent total provisioned VRAM from all tiles where
> VFs were assigned, and currently it's from all tiles always.
> 
> Note that changing VRAM provisioning is only possible when VF is
> not running, otherwise GuC will complain. To make sure that given
> VF is idle, triggering VF FLR might be needed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: allow VRAM change only if LMTT (Piotr)

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 31 ++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index 82a1055985ba..aa05c143a4d6 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "xe_assert.h"
> +#include "xe_device.h"
>  #include "xe_pci_sriov.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> @@ -44,7 +45,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>   *     ├── .bulk_profile
>   *     │   ├── exec_quantum_ms
>   *     │   ├── preempt_timeout_us
> - *     │   └── sched_priority
> + *     │   ├── sched_priority
> + *     │   └── vram_quota
>   *     ├── pf/
>   *     │   ├── ...
>   *     │   ├── device -> ../../../BDF
> @@ -59,7 +61,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>   *     │   └── profile
>   *     │       ├── exec_quantum_ms
>   *     │       ├── preempt_timeout_us
> - *     │       └── sched_priority
> + *     │       ├── sched_priority
> + *     │       └── vram_quota
>   *     ├── vf2/
>   *     :
>   *     └── vfN/
> @@ -132,6 +135,7 @@ static XE_SRIOV_DEV_ATTR_WO(NAME)
>  
>  DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
>  DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
> +DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(vram_quota, vram, u64);
>  
>  static const char * const sched_priority_names[] = {
>  	[GUC_SCHED_PRIORITY_LOW] = "low",
> @@ -181,12 +185,26 @@ static struct attribute *bulk_profile_dev_attrs[] = {
>  	&xe_sriov_dev_attr_exec_quantum_ms.attr,
>  	&xe_sriov_dev_attr_preempt_timeout_us.attr,
>  	&xe_sriov_dev_attr_sched_priority.attr,
> +	&xe_sriov_dev_attr_vram_quota.attr,
>  	NULL
>  };
>  
> +static umode_t profile_dev_attr_is_visible(struct kobject *kobj,
> +					   struct attribute *attr, int index)
> +{
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +
> +	if (attr == &xe_sriov_dev_attr_vram_quota.attr &&
> +	    !xe_device_has_lmtt(vkobj->xe))
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
>  static const struct attribute_group bulk_profile_dev_attr_group = {
>  	.name = ".bulk_profile",
>  	.attrs = bulk_profile_dev_attrs,
> +	.is_visible = profile_dev_attr_is_visible,
>  };
>  
>  static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
> @@ -228,6 +246,7 @@ static XE_SRIOV_VF_ATTR(NAME)
>  
>  DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
>  DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
> +DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(vram_quota, vram, u64, "%llu\n");
>  
>  static ssize_t xe_sriov_vf_attr_sched_priority_show(struct xe_device *xe, unsigned int vfid,
>  						    char *buf)
> @@ -274,6 +293,7 @@ static struct attribute *profile_vf_attrs[] = {
>  	&xe_sriov_vf_attr_exec_quantum_ms.attr,
>  	&xe_sriov_vf_attr_preempt_timeout_us.attr,
>  	&xe_sriov_vf_attr_sched_priority.attr,
> +	&xe_sriov_vf_attr_vram_quota.attr,
>  	NULL
>  };
>  
> @@ -286,6 +306,13 @@ static umode_t profile_vf_attr_is_visible(struct kobject *kobj,
>  	    !sched_priority_change_allowed(vkobj->vfid))
>  		return attr->mode & 0444;
>  
> +	if (attr == &xe_sriov_vf_attr_vram_quota.attr) {
> +		if (!IS_DGFX(vkobj->xe) || vkobj->vfid == PFID)
> +			return 0;
> +		if (!xe_device_has_lmtt(vkobj->xe))
> +			return attr->mode & 0444;
> +	}
> +
>  	return attr->mode;
>  }
>  
> -- 
> 2.47.1
> 
