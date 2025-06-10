Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE163C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 05:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C0A10E471;
	Tue, 10 Jun 2025 05:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaO9BaN7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEE510E471
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 05:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749532352; x=1781068352;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7vXJ6MNAJO+PVfxRrzd/4KT0kU6y90sYQksfSJCcMSU=;
 b=kaO9BaN71uYm4sUIkpoMndbmRfV6IsulMudYf5ik5bBnGvejC/m+LU4A
 Hzl6E9hJc3YXMMTvPrOdrhoQUmkGRHRUDGvNUs389YZSRtjOTG/c2BmXF
 y90Kgi967/NzQYj+UBvhnw57CKIN3p1WU+UgjYAi9xJ1pQK6sXB3hal86
 GbghU76wURx/XccuyWFTmOa4MINq7q1rzObWK56mNn75GOd0Prsth+xSm
 Y3P6W3xHCDmVyIObGqd3DmSmk+YauectMJV5sjZH0rPuASd1BhD5HVsXG
 aayxFjc3d0jXg0bRaFqKZuhaBlXNaR+R8V2kTlHlFX+PmY1/W0KBy2M59 A==;
X-CSE-ConnectionGUID: oiITamKyRwKiZHABMccHeg==
X-CSE-MsgGUID: 3N5aRGkgTZi+104ASYTCEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="54256831"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="54256831"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 22:12:24 -0700
X-CSE-ConnectionGUID: 1WynA+gTTGGjcdKFCP9cQg==
X-CSE-MsgGUID: LmHH/98qQJe3KK5QRhZU0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="151600434"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 22:12:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 22:12:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 22:12:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.80)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 22:12:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdGeak782ifXVMOQPRLRIppgnJK+UroiXPzvKQMjnDUgFFRe8SFztRZQ4Xb7WnE8uC9WSouJzgump01txN2eViWQFyhHxgnLnIvkRA/7S4mSex665/VyBkOhvTFq4oaiqCtT7vsOEJF1QVvtZICnpv3/k4IK24mMNiufCSnDkWpplXij7G8GCDXz4xc/1X0sxjK+cGc4Dvr3D/HVpYAvD1osRd7rVXtdlOzCEr2ZIncHg/2sPyc4kaLIb8VcaPqBTMgRMjqICcG1MhdsjlLJvhRp8ZePSIL8a8eNFLGvHBjSgX+gIwCocj6itDlWlVt89VohXIVNek4SnhPNIZ3y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKWesF4tHE/7NYnbxkQjlkPUFecvvog4DXouxajRK2Q=;
 b=uoy+4xujTJ1eFluYRoH5hUfWNe3MExEQude5LFCTGo9PWWYRT7UK2oZNbLbsSt4DUa8KtlmDWZiFLoFpmgIe+RJFUUQTeRbUHhbrsIu/rgWX2+ETnhZiasG8HeGzpk/AFmwAHdEoEAV83OCqRPDJ/gzlikqsfssJf19J6Kn1+fYeuKQYiW/aicny8rLEjX2FDgWDqilxr3aw0YuD+0DD0F9EVAAGy2lsOCyRyRMDehAINEanTbfSP31i3RqdPpZ2KOHbNcaA1KaKn9Xs35/RCLGTGHBopzty5s6AYolAhLgRdzfuxEzrt1u0QOvn00z5v8ZGVL00YdSi1917j/t4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB8812.namprd11.prod.outlook.com (2603:10b6:806:469::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 05:12:20 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8813.022; Tue, 10 Jun 2025
 05:12:20 +0000
Date: Mon, 9 Jun 2025 22:13:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 10/19] drm/xe: Implement madvise ioctl for xe
Message-ID: <aEe/E5mYH7zXAVa3@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-11-himal.prasad.ghimiray@intel.com>
 <aDokTWyn942CBVXh@lstrano-desk.jf.intel.com>
 <405470cd-db73-4380-9a68-78c607d10003@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <405470cd-db73-4380-9a68-78c607d10003@intel.com>
X-ClientProxiedBy: MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 237ee695-2e6a-4d4d-8c19-08dda7dd6055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDdkRHFhck5DckM2dS9ZL0JyVzB6NGJXV3YySCt2a1pRWnNJZEFSOEk4WVMx?=
 =?utf-8?B?RTAyMnd0TzIzR0VWcDBCUTRiTHRvN0dJM3Z4a0xyaExRUGxFSHlHOWdBNXJD?=
 =?utf-8?B?SFhNdUM2ZG1pdHk2Y1FDTlZucmU2WHlmbzE5SFNORytteUtHSGdlWWZTUTV6?=
 =?utf-8?B?WXFwTDNaNml4UzZRMGh5bHIyZW1SWjB0WVVRVS95Z0kxTEZyemFSakRUVEs3?=
 =?utf-8?B?UWhoa2RkMGxoRkVJem93ZnFtQ2VhS0psZmN3S3Mzd3M0dkx4NW5KS1A5SDM4?=
 =?utf-8?B?V3liT2NhSnpxVU9wKzhzYy9kY2FVQ3UrWS83U2dVVUVuaVpWcm5lcjhXMFFC?=
 =?utf-8?B?Zm9hb3BBc1ZNM1cxMmxzVGo4VlpYTFN5TUZzUFB5cjI0Q0RyZlBqUEcwMnpa?=
 =?utf-8?B?UFJSczNpRnNkeW13VmxYckd5em9qLzRyZDZvUTZ2UFlXampxT1JUUGk5THZZ?=
 =?utf-8?B?cVptbG04SzhBUWpRVEVnS2dmMjJidlJtK1FKaUhUaVdsMlBSUFBRWFEzRzVQ?=
 =?utf-8?B?eGg3ellHdVYrTzNPaHkyVVl3NDIxOU5ZWkRwS0g2VisyeXFKUG5vOE5WKzQ1?=
 =?utf-8?B?cVZKVHN6cW1yVitDK28zaVIrNlRQTEpWblZSSy8xajEvck96bGE3bzhKNnM1?=
 =?utf-8?B?cjhVVDN0TUQvUmFUbTg1ajA4cm9rcFEzTm9ZS0RPLzc3dGo0WXFwLzBHTURP?=
 =?utf-8?B?dytTUkpNbm5SVTFEWFJrYmhYVDYrVGRNL09qdDU5NnA2M0xZK3RhME9IM25z?=
 =?utf-8?B?U1JuK0U3bkhsaGV3MzBGaGFVb09MVVZ6WEpmRUluTFJxbTlMNHBCbndxelh2?=
 =?utf-8?B?U29RSFBOdFJoZk1md2RKb0x6czhTTEYzRm42N21zU1lvRTliN2g5QkJSWkxU?=
 =?utf-8?B?RGVGNkJ3L2hKS1NiWnNxcGYyQnFkeWdONVBwMnRtSUdicU9RUnUxOFJ1L3Fi?=
 =?utf-8?B?a0Z4RnJ6TmthSTMzN1pJMURUMVBqUThOTm80THRMZ04rY0hSckdKenBVUHB3?=
 =?utf-8?B?YTZJbkxEaWFVbWJ6cnZKaFhlaXl2clZqaUdydU5zRU1HLzFYT3VoL0pDMkVO?=
 =?utf-8?B?UlptZW16eGNoWkpIS04wWWd2dWVlYmpRZ3VTL1pXak5QVUtTbnJiR3d2WlhN?=
 =?utf-8?B?MDB1alR5djM5djMwUlh6M3dUTnU2V0ZhNTVFRFNuT1QyUnloZmpMaVBUdWRJ?=
 =?utf-8?B?ckpVM3RLb3RSenRaRWFadDM3UTRmQWR3UjZZeVFtazlMSlBDdHRIREwrVTJG?=
 =?utf-8?B?MlVxb0pITTZhSGRyeVpSRmNvZEg5ZW8yTU9vTktqR0tuY3I4YVZ5UzF4bXlD?=
 =?utf-8?B?SkhMaTFCSlZ1NnkvZTZHUWhFVXZ1Q0o5cUQ2VFlNNlFEc01nYVQ5cXpvQ2VC?=
 =?utf-8?B?K3ErZkdhUUNoUndId2E3WENLWkY5NkFjc1FLOVNuUEIzcGxPMlFYOE9zQmxp?=
 =?utf-8?B?U2xzUDNWdk92L3doaEtDUWo5KzlpTHp2b2pMWi9pSW1mNG04eVgxd3ZwemFM?=
 =?utf-8?B?RnlHeFhVOHB6WjgxbjdCM2FMalFnbk1rejFTRFN4VUduVG83aGplNmFIckRq?=
 =?utf-8?B?MUl2bUpXSkNFdjVBcFhnN2s5b3ZjcW1FNWZ5TytnOVNoTUlJdjFWQ1VxZTho?=
 =?utf-8?B?bjZjb0Zqdk5nd3BBdlUvV2tyOFNwWkpmcHpTNjB0YXpiK2o5Z01nYnVPQzBY?=
 =?utf-8?B?VFp1N2haWUdZT1dKVmhuWmJCZXNnVEVVYkR4elpNMDJ3ZXRhQVZtWnVrZG90?=
 =?utf-8?B?bHF4OUcrTUkyOFhGNUxlMGJPODFzN2FTTFdpZDRtYkpBcEg1ak5HUWFXTzE4?=
 =?utf-8?B?Um9hclBTbUxNd0xBL1hlN3B0QnlMZ3VHRFIyZ0ZJZG12anoyZlZhZ0VFZDdz?=
 =?utf-8?B?QVlpN1piTnpXS1NiYlFQVStCT3JRakx1NEJNRnlOSitTQk12bWVSbDZpN1J5?=
 =?utf-8?Q?t5pQI3atZgU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXFYYXI0Zklmd2NkTk1tQVM4YlBXK0c1dEJXSiswRHYxaGRlVkVOc1gyWGlG?=
 =?utf-8?B?azh4eGVKaHZRVGVjZFRlMi9RTEJENnV0VnpEa0o5SjlsL1NUMVpzK1pCZm83?=
 =?utf-8?B?TWlVcWhMWDNENkc5eGsvNFE4VmZPSkVMbFNlMUkrMGZiS3ZtSTdWeHh0WEc2?=
 =?utf-8?B?L1JON1ExT0pNYXJiYzJxb0ZTR0szTnIxTy96MUYwM2tGbjhIaUtSN1hFbGZH?=
 =?utf-8?B?cktrNVBUa0ZMcFMvSWp4aXVUQys5bUNiWFdLRkRWMUxKZFBZRDlvR1VQbkZV?=
 =?utf-8?B?VVpRK1lZUUk1Smh1WVJNSDRFZGhNWGgzLzlsSUFEOXVTTW4zRnduMGRZdHp5?=
 =?utf-8?B?S2h2K3p6Qjh6WTk1RWViQWZkTHdrWGZXTEhTSkZXUjltc1gxWnRwQ0xvZGdK?=
 =?utf-8?B?bTk3N1o4RGE3TkRpOW0zNm5BRkxVSmRSWGVXN1ZTS2pEeERpcWVKWVljZ2po?=
 =?utf-8?B?bzZiWUJQV1dKalllSXN5Wm5hMURNUDdma0x6emV1ZDR0UWpjODY0MWNVeHdy?=
 =?utf-8?B?MDlseHkvU1FUMnh1RkpQazFzcmw4Ump0ejh6aDhJNFl2ekhVOVdiN1RCdjhs?=
 =?utf-8?B?T1J6WE9EWW9OOVl0Znl2Lzh1ZllXWEJXYlQxckhhcDFCcFh3TVh5cmlBeFRZ?=
 =?utf-8?B?bkFRR0hTcjg5S0VhUTZoOW1WcktBbjJtZkMzTktBRzBJTHBGQjhVbjRLcWlk?=
 =?utf-8?B?MFhSazVyL2NIQ0hrdHZDOUI4Y2MwYlRzNnZFQVYrdVpBenFwdFphZ25vTlJ6?=
 =?utf-8?B?VmZuMU1KaXIyLytxOEFhTEt0UllMR0EwSGtGR0RGMFJDU1VnRk9YYUJlSlhD?=
 =?utf-8?B?ZG9kVmg3RjFJR2FzZDgyQnE1NWF3UC93RThnVGhwQ2pPVFZEUHV1MlUvYzhK?=
 =?utf-8?B?NDQrUkFXcmFLMVR6QnFiNWZFSzc0TkZKcHdnQnpRTUNCRlNVQXJuWWVxVWVw?=
 =?utf-8?B?YWxLa3Z5cHdPMnZFSTZ1b2NoaEVmQVlCUGUyVGhaeC9QOWhHNFd4MGxCQ1hy?=
 =?utf-8?B?Y1M3QWVuSXR0NXFzbHhSVXdKL1c4dkx4bUhua2V4b0pPSVovLzFYNmVZUWVV?=
 =?utf-8?B?cGxvckZKK1hQUXl3RFRhOGU0aXFPWFk5bTU2VjhOQ3BXQU1IazRLZXZ0ZExa?=
 =?utf-8?B?TGw2dHV1L3V3aExwNndNbUFVRXY2STlqd09MampIdENlOWUwOWE2b2wrM2lL?=
 =?utf-8?B?RlVneUoveFhsSUNueGNNRWJ2UGNFdVVDcENCU1FPM2xDMGZzbWpZZHVpSURP?=
 =?utf-8?B?ZFhabEpZeEF6VGV6RDZmdWk1REQ4YTVIeWFacTlqU2krWkdLZGhqbnhmY0h2?=
 =?utf-8?B?UlRFQkVMYnBCblh5bmJsL2tVcTFCZ0NqcnlhS0JjZmduVTNodzU4bVRVM2Mw?=
 =?utf-8?B?djcxbmxRRExhb2FEWFhtbXJ1VmFTRzdKK0Rid2x2MW5yZTlnb2dtZFIveDZ0?=
 =?utf-8?B?eW13bGxaeHlIVUMyMFVQQVNQR3dPSzJFL1NSelJNM2NFcEZ1dmdMUi9BbUFv?=
 =?utf-8?B?YlNFcTBTTmtHQjlhdnpkU2JWV2g5WmljbVlJa2lqVkdwdVNER2JkT1UwVkQw?=
 =?utf-8?B?aVhnMnBYNTBuMXA4OFdCS1krSmhQSzZnNlpPcHRvU3BXbkNEZjlRdFdTTUdp?=
 =?utf-8?B?Y2FYNXl3S2pBQ0R1cHBNUTkwak8zb21oNlE0L3Nud3JBWXJFWkJXUFV0RTh3?=
 =?utf-8?B?Y1RSTElack1rQVZCSGRvVS9tWFR2dDVxdHJuZ3U0YjNTSFVqQmtHZTdwWllT?=
 =?utf-8?B?a2RmVVZwWmZZUmFRRTI1V0VIUVZ6bU96ay9uVmQydVhCd2l1c0VabytNT3Nq?=
 =?utf-8?B?RFpuNE9FNXRNc1oyQkZKdlpOY010RUM1TFRjQzVtRVdiUjVHR25rQkRpMEYw?=
 =?utf-8?B?bEV0aFlOWjZ3RXN4Rm0zWC9sQVVhTytOSnFEeHNTdnRDdEFkb3FXRmtrU2M1?=
 =?utf-8?B?Mi85VFphQW9CU1k3SzA2OU5XSEZ6VDZQQTl2Z1gyUVhOYWlpemhQZHhVL05X?=
 =?utf-8?B?b3NteGVWZVVqOVptRktHbGUrZHg0YlduNnF2TWxmbzRKNGZVMmxFT3llWmpp?=
 =?utf-8?B?Q2JERVI2RThIZVBTNFBsdUEzRm9UWk0rTUtPaEQ0eXU3Y2Y2ZTE2VUd1WFNR?=
 =?utf-8?B?L1VuTUtoRjI4VmtVTVFHV3ozTVh5OXZEVHo2YjVpL3JaYlNra2ppd3cybGFD?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 237ee695-2e6a-4d4d-8c19-08dda7dd6055
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 05:12:20.3980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PEtXKqBUN1nutkX5wwgHGe3SeVTBg4ohiOAQ+Ak88D23+E8GsDy9t+tjX8j4e6A0oC6liPsJ68s/ENJCXaPUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8812
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

On Tue, Jun 10, 2025 at 10:22:42AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 31-05-2025 03:04, Matthew Brost wrote:
> > On Tue, May 27, 2025 at 10:09:54PM +0530, Himal Prasad Ghimiray wrote:
> > > This driver-specific ioctl enables UMDs to control the memory attributes
> > > for GPU VMAs within a specified input range. If the start or end
> > > addresses fall within an existing VMA, the VMA is split accordingly. The
> > > attributes of the VMA are modified as provided by the users. The old
> > > mappings of the VMAs are invalidated, and TLB invalidation is performed
> > > if necessary.
> > > 
> > > v2(Matthew brost)
> > > - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
> > > fault mode too
> > > - fix tlb invalidation skip for same ranges in multiple op
> > > - use helper for tlb invalidation
> > > - use xe_svm_notifier_lock/unlock helper
> > > - s/lockdep_assert_held/lockdep_assert_held_write
> > > - Add kernel-doc
> > > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Makefile        |   1 +
> > >   drivers/gpu/drm/xe/xe_device.c     |   2 +
> > >   drivers/gpu/drm/xe/xe_vm_madvise.c | 264 +++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
> > >   4 files changed, 282 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index c5d6681645ed..dc64bdcddfdc 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
> > >   	xe_uc.o \
> > >   	xe_uc_fw.o \
> > >   	xe_vm.o \
> > > +	xe_vm_madvise.o \
> > >   	xe_vram.o \
> > >   	xe_vram_freq.o \
> > >   	xe_vsec.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index d4b6e623aa48..b9791c614749 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -61,6 +61,7 @@
> > >   #include "xe_ttm_stolen_mgr.h"
> > >   #include "xe_ttm_sys_mgr.h"
> > >   #include "xe_vm.h"
> > > +#include "xe_vm_madvise.h"
> > >   #include "xe_vram.h"
> > >   #include "xe_vsec.h"
> > >   #include "xe_wait_user_fence.h"
> > > @@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> > >   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
> > >   			  DRM_RENDER_ALLOW),
> > >   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> > > +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> > >   };
> > >   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > new file mode 100644
> > > index 000000000000..f7edefe5f6cf
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > @@ -0,0 +1,264 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#include "xe_vm_madvise.h"
> > > +
> > > +#include <linux/nospec.h>
> > > +#include <drm/ttm/ttm_tt.h>
> > > +#include <drm/xe_drm.h>
> > > +
> > > +#include "xe_bo.h"
> > > +#include "xe_gt_tlb_invalidation.h"
> > > +#include "xe_pt.h"
> > > +#include "xe_svm.h"
> > > +
> > > +static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
> > > +				u64 addr, u64 range)
> > > +{
> > > +	struct xe_vma **vmas, **__vmas;
> > > +	struct drm_gpuva *gpuva;
> > > +	int max_vmas = 8;
> > > +
> > > +	lockdep_assert_held(&vm->lock);
> > > +
> > > +	*num_vmas = 0;
> > > +	vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
> > > +	if (!vmas)
> > > +		return NULL;
> > > +
> > > +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
> > > +
> > > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
> > > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > > +
> > > +		if (*num_vmas == max_vmas) {
> > > +			max_vmas <<= 1;
> > > +			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas), GFP_KERNEL);
> > > +			if (!__vmas) {
> > > +				kfree(vmas);
> > > +				return NULL;
> > > +			}
> > > +			vmas = __vmas;
> > > +		}
> > > +
> > > +		vmas[*num_vmas] = vma;
> > > +		(*num_vmas)++;
> > > +	}
> > > +
> > > +	vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
> > > +
> > > +	if (!*num_vmas) {
> > > +		kfree(vmas);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	return vmas;
> > > +}
> > > +
> > > +static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
> > > +				     struct xe_vma **vmas, int num_vmas,
> > > +				     struct drm_xe_madvise_ops ops)
> > > +{
> > > +	/* Implementation pending */
> > > +	return 0;
> > > +}
> > > +
> > > +static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> > > +			  struct xe_vma **vmas, int num_vmas,
> > > +			  struct drm_xe_madvise_ops ops)
> > > +{
> > > +	/* Implementation pending */
> > > +	return 0;
> > > +}
> > > +
> > > +static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> > > +			     struct xe_vma **vmas, int num_vmas,
> > > +			     struct drm_xe_madvise_ops ops)
> > > +{
> > > +	/* Implementation pending */
> > > +	return 0;
> > > +}
> > > +
> > > +static int madvise_purgeable_state(struct xe_device *xe, struct xe_vm *vm,
> > > +				   struct xe_vma **vmas, int num_vmas,
> > > +				   struct drm_xe_madvise_ops ops)
> > > +{
> > > +	/* Implementation pending */
> > > +	return 0;
> > > +}
> > > +
> > > +typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> > > +			    struct xe_vma **vmas, int num_vmas, struct drm_xe_madvise_ops ops);
> > > +
> > > +static const madvise_func madvise_funcs[] = {
> > > +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> > > +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
> > > +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
> > > +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
> > > +};
> > > +
> > > +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)
> > > +{
> > > +	struct drm_gpuva *gpuva;
> > > +	struct xe_tile *tile;
> > > +	u8 id;
> > > +
> > > +	lockdep_assert_held_write(&vm->lock);
> > > +
> > > +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
> > > +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> > > +		XE_WARN_ON(1);
> > > +
> > > +	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> > > +
> > > +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> > > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > > +
> > > +		if (xe_vma_is_cpu_addr_mirror(vma))
> > > +			continue;
> > > +
> > > +		if (xe_vma_is_userptr(vma)) {
> > > +			WARN_ON_ONCE(!mmu_interval_check_retry
> > > +				    (&to_userptr_vma(vma)->userptr.notifier,
> > > +				     to_userptr_vma(vma)->userptr.notifier_seq));
> > > +
> > > +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> > > +							     DMA_RESV_USAGE_BOOKKEEP));
> > > +		}
> > > +
> > > +		if (xe_vma_bo(vma))
> > > +			xe_bo_lock(xe_vma_bo(vma), false);
> > > +
> > > +		for_each_tile(tile, vm->xe, id) {
> > > +			if (xe_pt_zap_ptes(tile, vma))
> > > +				*tile_mask |= BIT(id);
> > > +		}
> > > +
> > > +		if (xe_vma_bo(vma))
> > > +			xe_bo_unlock(xe_vma_bo(vma));
> > > +	}
> > > +}
> > > +
> > > +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> > > +{
> > > +	u8 tile_mask = 0;
> > > +
> > > +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
> > > +	if (!tile_mask)
> > > +		return 0;
> > > +
> > > +	xe_device_wmb(vm->xe);
> > > +
> > > +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
> > > +}
> > > +
> > > +static int input_ranges_same(struct drm_xe_madvise_ops *old,
> > > +			     struct drm_xe_madvise_ops *new)
> > > +{
> > > +	return (new->start == old->start && new->range == old->range);
> > > +}
> > > +
> > > +/**
> > > + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> > > + * @dev: DRM device pointer
> > > + * @data: Pointer to ioctl data (drm_xe_madvise*)
> > > + * @file: DRM file pointer
> > > + *
> > > + * Handles the MADVISE ioctl to provide memory advice for vma's within
> > > + * input range.
> > > + *
> > > + * Return: 0 on success or a negative error code on failure.
> > > + */
> > > +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > +{
> > > +	struct xe_device *xe = to_xe_device(dev);
> > > +	struct xe_file *xef = to_xe_file(file);
> > > +	struct drm_xe_madvise_ops *advs_ops;
> > > +	struct drm_xe_madvise *args = data;
> > > +	struct xe_vm *vm;
> > > +	struct xe_vma **vmas = NULL;
> > > +	int num_vmas, err = 0;
> > > +	int i, j, attr_type;
> > > +	bool needs_invalidation;
> > > +
> > > +	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
> > > +		return -EINVAL;
> > > +
> > > +	vm = xe_vm_lookup(xef, args->vm_id);
> > > +	if (XE_IOCTL_DBG(xe, !vm))
> > > +		return -EINVAL;
> > > +
> > > +	down_write(&vm->lock);
> > > +
> > > +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> > > +		err = -ENOENT;
> > > +		goto unlock_vm;
> > > +	}
> > > +
> > > +	if (args->num_ops > 1) {
> > > +		u64 __user *madvise_user = u64_to_user_ptr(args->vector_of_ops);
> > > +
> > > +		advs_ops = kvmalloc_array(args->num_ops, sizeof(struct drm_xe_madvise_ops),
> > > +					  GFP_KERNEL | __GFP_ACCOUNT |
> > > +					  __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > > +		if (!advs_ops) {
> > > +			err =  args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
> > > +			goto unlock_vm;
> > > +		}
> > > +
> > > +		err = __copy_from_user(advs_ops, madvise_user,
> > > +				       sizeof(struct drm_xe_madvise_ops) *
> > > +				       args->num_ops);
> > > +		if (XE_IOCTL_DBG(xe, err)) {
> > > +			err = -EFAULT;
> > > +			goto free_advs_ops;
> > > +		}
> > > +	} else {
> > > +		advs_ops = &args->ops;
> > > +	}
> > > +
> > > +	for (i = 0; i < args->num_ops; i++) {
> > > +		xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
> > > +
> > > +		vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
> > > +		if (!vmas) {
> > > +			err = -ENOMEM;
> > > +			goto free_advs_ops;
> > > +		}
> > > +
> > > +		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
> > > +		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
> > > +
> > > +		kfree(vmas);
> > > +		vmas = NULL;
> > > +
> > > +		if (err)
> > > +			goto free_advs_ops;
> > > +	}
> > > +
> > > +	for (i = 0; i < args->num_ops; i++) {
> > > +		needs_invalidation = true;
> > > +		for (j = i + 1; j < args->num_ops; ++j) {
> > > +			if (input_ranges_same(&advs_ops[j], &advs_ops[i])) {
> > > +				needs_invalidation = false;
> > > +				break;
> > > +			}
> > > +		}
> > > +		if (needs_invalidation) {
> > > +			err = xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
> > > +							     advs_ops[i].start + advs_ops[i].range);
> > > +			if (err)
> > > +				goto free_advs_ops;
> > 
> > In additional to all the other comments around invalidations - you don't
> > always need to issue TLB invalidations.
> > 
> > - For pat_index, only if the VMAs pat_index changed + valid page tables
> > - For atomic, only if the VMAs atomic mode changed + valid page tables +
> >    current placement would cause issues
> > - Purgeable - never
> > - Preferred placement - valid page tables + current placement != desired
> >    placement
> > 
> > We likley can set a temp bit in the vfuncs in either the VMA (BO,
> > userptr based) or the SVM range(s) which the invalidation func can parse
> > / clear indicating an invalidation is required.
> 
> In the current implementation, I’m zapping PTEs for SVM ranges and
> BO/Userptr-based VMAs within the madvise range, and issuing a TLB
> invalidation for the entire madvise range. Should we instead issue TLB
> invalidations at the granularity of the SVM range or the individual VMA (BO
> or Userptr)? I don’t see how we can avoid TLB invalidation if some VMAs
> require it and others don’t, given that we’re currently invalidating the
> entire range.
> 

I guess we could skip the zap on per range / VMA basis and then issue
still issue a single TLB invalidation - I don't think we want to issue
multiple TLB invalidations as those have been profiled to be quite slow
- at least 100us. If we skipped the zap, we wouldn't get a fault rather
just a TLB miss. I think that is a fair tradeoff.

Matt

> > 
> > Matt
> > 
> > > +		}
> > > +	}
> > > +
> > > +free_advs_ops:
> > > +	if (args->num_ops > 1)
> > > +		kvfree(advs_ops);
> > > +unlock_vm:
> > > +	up_write(&vm->lock);
> > > +	xe_vm_put(vm);
> > > +	return err;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > new file mode 100644
> > > index 000000000000..c5cdd058c322
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> > > @@ -0,0 +1,15 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2024 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_VM_MADVISE_H_
> > > +#define _XE_VM_MADVISE_H_
> > > +
> > > +struct drm_device;
> > > +struct drm_file;
> > > +
> > > +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> > > +			struct drm_file *file);
> > > +
> > > +#endif
> > > -- 
> > > 2.34.1
> > > 
> 
