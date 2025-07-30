Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7564BC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 13:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299C910E0C5;
	Wed, 30 Jul 2025 13:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxBsY2DF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B0E10E0C5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 13:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753883084; x=1785419084;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NLelUb3SoolYyiLVr9QP+cmMAvh2gxgguAMJjzXODiA=;
 b=KxBsY2DFloEdAF5nNhrRM2fVVD1ifRz7DOX5mETNcZ7NWso2ASDQMQP3
 1ENCOoPfkjFnxWL8wqSbprmfgvW8k0iHf2fEuCXplDfa3cHHohoChbwbk
 weiFwfgRCntvFm5NF9WflV0vpzlN8SrIPvAhwuvi/ETd5ktt2v9IRqmxZ
 2D4ggv0xSjcD/gevuNYawYPbehEjrr7WIGcqECdWQrF5hkG4g+AhqoncS
 +nkoj14u5MY5HPBmWc7ElTl4TujXv+JdnMAhSbxTqRchPQ9P+i+Xprkxb
 0HM17Of5fCdf+0wAaQQx77vMTlOOpqtjnZKOnLBzna/dYP3sSBN3zn8r+ Q==;
X-CSE-ConnectionGUID: bzW4eKDfTNqVTrsgegHKIg==
X-CSE-MsgGUID: MH5yFhTfRweWeQGSPJU5eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="73638946"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="73638946"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:44:30 -0700
X-CSE-ConnectionGUID: n9z5DK9mRFOJnrde2Rnsaw==
X-CSE-MsgGUID: eQlxLgugQsmTChO1IrQZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="168402854"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:44:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 06:44:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 06:44:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 06:44:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dukdcn61vlHgdpMr5v1Gd4fIC3VGSHkcUbH3rfKXKCSdj3upYtXZUtMPaYwNkg1gdEY2QdCpeWSl4LQ+jW5ut87KNHg5TvCdJOrcdcowkMHGmrvnpQUQ9GJcGx231Zc90jU/hFgE2C1Gp7RyMSLe0F3y678MYV2+LI/2y0x2WNBUquPRNvSRjdqIxgx1Qthu/hL19hCM+7WJjEJQILw24wa21nY4LD5Herb3dnM+aWi8nMOg4TQGz1oii9nsjfKfBtGZCGZ6MbH6FgzS4qEISdyx/O5lAJZIGL/U/F+wbirim88HM822wCMhZP2hw8g+Sp83lZXk13g8Wl6Kggp+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XG4/dPApep+8m9yxCr3CCViXG9LL8cZoFeCoYpLZCI=;
 b=maUSu7eDbu9xdHbC6gY4o6LHwI1bZWfoMrBwN2X765Uq3zE1qOX31eYFGibL5x3Aq+h37BdKt5eFSedZlLyjWNOXUIvbgo+A9dcssIO0wHmKRpN7kfxer5k8MRDZZN/RggLKDzXfgyXo+XoZeR+yL3Lks1Y8ci2+u218BYghk+fW0qvwOiKGrufkNK2pKZMA7KbkBBdH1fMxQG+9l9YrEB4m00EhFL0mkGZTzeZpya3z/iiZ/uR1TLWienwzQb8arsGBSb8wlf8Cy/EKlOgKjRj80H4RTGa+u35w8wMhM1Ncyg+Jtjd6zGyATgvHaFrOoOZ7dInsfZK8x2QC6QKm1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 13:44:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 13:44:23 +0000
Date: Wed, 30 Jul 2025 09:44:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Winiarski, Michal" <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pm: Enable RPM via PCIe PM capability
Message-ID: <aIohs20Sn3iYAs9b@intel.com>
References: <20250730123254.11088-1-satyanarayana.k.v.p@intel.com>
 <CY5PR11MB621179438DADC9C621456E3C9524A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY5PR11MB621179438DADC9C621456E3C9524A@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4e724e-0ac3-449c-3280-08ddcf6f317e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2szRTdzeGJHV1NsbnFFUEVxTUxaUlRsV2N4T2xrZGNIMk81OVRucnFhelph?=
 =?utf-8?B?cWRFdThpaFZzRldwV0ZhQzZjWDBPVGpsOXczTHlwamtUOHMrcll3d1RrVjYw?=
 =?utf-8?B?R3FuVzhCMzI5dUR0T1ZhRzZmT1F1Z1l6TDRodEtFaUZ6d1hhQWE0VkFIdW1r?=
 =?utf-8?B?NkRVWUttQXNPdWdwTHZudWg2ZjNyR3NIWDFLc0JiS0IvcTRrTEkvSEg1SHVn?=
 =?utf-8?B?OWxWNWQ5Njd4YUZQYmVRUkhnRVRWajFSODBoSzVWamk3RUVVZlpWOEJkQ29q?=
 =?utf-8?B?eFhzZmNaT1VnL0d2dytVUmc1TlgvNm8xWGlSWjd1aVMwZERjU3lRRjhvSyti?=
 =?utf-8?B?dDYrVmZzWGJsOGcrNVkyeEM3RkhEUUltK1pacE4yQmZsbElPKzBrSGU4amlW?=
 =?utf-8?B?MzVrbkF2ajVvcEx0MnE3bWZYMEIyVkUwVHpzYVJBekp1aHVHb0FDeUUzeVc4?=
 =?utf-8?B?alhiakRvUTcwWDF6TkpZTVIreXN0VjJLTDV0a2pWMFZMNzNoVVFTYTI1WHFu?=
 =?utf-8?B?VmMxc3dPdXRscHVrMUZjUzFEbzNmdnJ3U0FjTEg4QU9vbm1yNjhrL21kbGUr?=
 =?utf-8?B?RERHY1BGRnpwYmFXQzkyS0I1TWp1VVZ0V1VvOW10aHd2WlQrb2Zoa3dBd2Ns?=
 =?utf-8?B?K2FhT0VEUDFqcllXYWpMUm1TVUVaUGU5ZGNLVTA4aE1PNUhzRVNGb1ZNMHNG?=
 =?utf-8?B?S214RWZFdWJIR25kVkRrN3ZkOVozaVZDaHhtcDdNRG04eSt1bEJYVXgwWjJ4?=
 =?utf-8?B?ZmEwZUZibndGTmlabm5NdXZ0RmlhbTNZUEFSTm9sNzhjY1oySloyVHlicCty?=
 =?utf-8?B?ckVFSXRTdVFBYWJDUWR0TzhLV1J3VzU0QzMzaEZPV0tMSkRjWGR3V1hjUkkz?=
 =?utf-8?B?Yk1xRTNobEh2WWRFWCtQNnhuZkttV3R5enlkTEtTeGNRSjRnSEY5V0JyTDBK?=
 =?utf-8?B?bEZ0bm13bno5UVZCanEyeUNvd2ZWcGhoMGtOeE16aDhRYkxGNGxLdGM3Y0Zl?=
 =?utf-8?B?S0NCaEhsUy9LTGxlcmYxZU1KdTJOR1NiOFJYczJJYmhWSmMzQllmdTk3NzV4?=
 =?utf-8?B?RnRTU0NiNVJVRnozak1YWHlXYlo4MmhBVTZESHZIYUg3VEY1LzZvY0V2aVFQ?=
 =?utf-8?B?QldXRnVIU0J1dmpuMlFDa3EwYWdacHZESndsbkZyNEJwb3ZOTGh1R1hGaG1K?=
 =?utf-8?B?MkFyZHVnU2NkL2lMRFlaN1VRWUNjRFAyR3Z2M084YSsxNTlDMFZVYjhzam4r?=
 =?utf-8?B?Ky96KzRYcEVlQ09QL2podlVsdUgyL2xLWDBaQkFOR0lJVFJuSHNQek5qdU83?=
 =?utf-8?B?N0V0UFlmU1hjb0U3ejdUTDgvaFptY3FhSmRySXdnVlp0cTFWUGNVZW8walF5?=
 =?utf-8?B?KzZZb0VvbnNRSUxrY1FoV3VwZFc0SUp1MlgybEZ4RUFmd3VGU3JGM1BVR2gy?=
 =?utf-8?B?NFM1eU5Eemd3aE5LNTQyaWwvVGdjOFVzT1JvYklxNnNzNEN5cW1Ha2dtNFpV?=
 =?utf-8?B?dld0Y1U1aURibm9salV1emppUGdqNVUwNW1temkycXp1djhmVHU3VHFVUTVI?=
 =?utf-8?B?cVM2WlUrQStqTE80VWMyWkJSb003RG9YTkhiZzN5SEVHdHBZeWViWEZwRURC?=
 =?utf-8?B?NTNhYlREaDVLK3ZjdGpGMmVsaERJTXl2RFVqazZuZWJFZjdMdmxVNk1MUTF5?=
 =?utf-8?B?OTNsbFpDVk5WSjlkY3ZWNkUrYzFhckJmOFlFWTRweEZXeHkrMnZSZlRHK2pS?=
 =?utf-8?B?RlBWbkI5SnJPRm1nYlVGZ3hXd3EvTkhhWUJMU2NiWlZCMk1kNk16dmpVQURJ?=
 =?utf-8?B?TFNJZWptUVkwUzFZaVBuTFl4alBaTEVmMnowRDlBaFRmRVA2aEd2dGJnU01t?=
 =?utf-8?B?dlFGSThIMTlQdW55R3FQRzA1UFI3MUF3Z3MxYmk2SEIvT1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QThXTDBEQW8wNzVSdUs3RlRhbVBRYWJyQi80WWh1NDQ0MmJ5WDFvM1IvbkEw?=
 =?utf-8?B?N3lHNktxaVE5a3J1dFdhZm51Tm1FUi95eFEydzlvSmt4ZW5HOVU2ZjdickIx?=
 =?utf-8?B?c3JRTTcxaFdvUzAvTjdFR2J0S2tLUGZXdGRiN0MvSjhuRCszNzZ0c0p1YzFl?=
 =?utf-8?B?VWxXR3VPS3JuK3ZKcW5zeTF3bEJ0aVd1V204TWZRTFNiM2RTMTBJa0pXUTdY?=
 =?utf-8?B?SEJvMENkOGQrT0oxWVJQWWZSVWZxbm9YcHhGMlNZTmhweGNaV09lTXBqQnA1?=
 =?utf-8?B?SUhlK21MNmVpMDlhMWFjeVFDNHc5bkF0OG0raDZiQlZvM0hpcEtLU2lNalZ4?=
 =?utf-8?B?NUN5Wmh0aU5adzQ2cGVRMzE5UnlXNGc3Z1VIbnVOOWdVR0xHVUdwd0p1S0FI?=
 =?utf-8?B?M0VrZWQvNWFSUGpYQUthaXNaZ3BHOWQvcU9qOVVRYkxJak9XNmFIRG5VV3o4?=
 =?utf-8?B?QXMveU1kT0ZBWVdLK1krYjE4ak94TFNoNGFnSEp4UmdydWJhMkdKZ0c0UzEw?=
 =?utf-8?B?TEUvNHpua1JmbkIyOFB4a0tsaHNBZzBUMnFnZ2l1YkpGNlJrOHIzL3cwcUNz?=
 =?utf-8?B?bWhiOGhHdmdvNkFVSUFETVFhanJVd1NxVU9DbDYyT2Zzdi9KQzhDbjV6MlNk?=
 =?utf-8?B?MXVLQU5XOEE1Z0xyZWpMY2R5YzlUOWY3dE0ycjU1Y3ptZWE1SkhZNngraWdW?=
 =?utf-8?B?Z1JJNzBSQzlhQ1E5RGRmcWQ4UGpzSjZhNmpDZmpPZjY3UU9VR09pZUdTN2x1?=
 =?utf-8?B?NGV3cWdtak56OXZzc0Z1RHI4RkNvQjJIeGJwVlAzOE5pbUJkejF6L1ZBdnUr?=
 =?utf-8?B?NTIzNHF4NmtLb0ZPYVM0a0EzQXRmbEpXNk1hWlBSU2RWWlJlMW00YmFma1dn?=
 =?utf-8?B?UU9UeE9sdVhLV1NvcG1MTGtiV0pwN2JaUWNEZWhWVE1FQUYzajBhZitGWEht?=
 =?utf-8?B?dG9TaklIZlJSaGZnd2psSmRpNWJFbnJTeG9ZSXlGV2tFTEZDR3NOQnlhbmRJ?=
 =?utf-8?B?bkh6cm9vdnF5UWZRbGRRblJFQ1VjZ2x0d0Q0a3M4QlJiN2FFK3drMGhHQ3BJ?=
 =?utf-8?B?WW80K1hTU1FWTWZvUUlaOGtwbGg3YlBGUXkxaGJDMFZQR0M5cDUxRHo5c1J3?=
 =?utf-8?B?QndqazlLQU1hY2ZUcUc2bzVGMmJoejJrbG5ZL2FUNGFqNzJpMi9UL2YzTldE?=
 =?utf-8?B?SkVVekFYWGpoWTJGRURPNGJ0TE5TOHkydTd4a2o3K0tYamVFQWJ1K1pGdjY2?=
 =?utf-8?B?WllMUkh2NjRBZ0x6cU5VTGk1REkwd0cvZHZxUHhtR0pIekgwZGtNek5RN1Ey?=
 =?utf-8?B?a3lYZEhyMUpPaFdhcXdaUTJvb25xZU1HdThoU1VySTFmZmRZaVI5bm00ZjFx?=
 =?utf-8?B?eVoyVTJHK0ovZjE2ODFKaTl6UXZhckZLTGVaY1l0UjQ0STRQemtjU2puViti?=
 =?utf-8?B?cUpKS1BuclhUL3p1amRxRU1tZXYwb3hMSnByc3N5UFAxYUgrNUdOWFZKQSsv?=
 =?utf-8?B?R0gyL1JMcHdEUTNHZFc0Wmk3b0VqL2tqZ2JlYXVCYk1FWitTQ3VFcnRUenhj?=
 =?utf-8?B?SklJY0E2d2lTZ0FGQnpwWG9Qd0ZxRUJpd1RLZlQ5NTlTajJhTEk0L1M5TThW?=
 =?utf-8?B?OFhNeVZ3UE4zV0pYaDBseThydXdFWkRBbGxmYS9MOHhWdm8weUw3alhIeDU1?=
 =?utf-8?B?M29HeEV6bW1CdmhEalYydU1pQlFtY1drQ080T0ptdzJLeUZIZWxaYUpoSEg0?=
 =?utf-8?B?Sm81UWI1S0VYempPeWxSejBaNnhZRm1HNkxxaFZ1UXNJUkM3T0dhejBsK1Y5?=
 =?utf-8?B?T3hLUGFnTzQ3b002QTlBb0pySWJpSlBuWUJnZGFBQ2trdTVjOEY3bjVXc2JZ?=
 =?utf-8?B?M1hCbTR2S1dDRDNjdGNRUHExUHNkQ2hTQmhaRzh6TVdCVG1GYXkvV2lidk83?=
 =?utf-8?B?MjdYS05ySUdlVEV4cTEwc2lOVDNWY24vaWxYQjQyZFhYQTlHT09LOHpoY0JC?=
 =?utf-8?B?K09lTmtqY3JNWG5mcnZxWG50ZWl4RHNxWDA0OFMvL3JFaS93Z1NMUlVCcVVJ?=
 =?utf-8?B?ZHVYUDFqOEg5dXBQMWk5NHVoTktpL0VsdEZ6c0laNWFEbVRIWERYMUpFT3pS?=
 =?utf-8?B?QlQwN3RocFQ1LzhyT3YxRTNxZGRnUHdNUFVwYTVJbDBiUzF4UFBFOVpXczNj?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4e724e-0ac3-449c-3280-08ddcf6f317e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 13:44:23.7177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3YLtfZ6NoamXH3zociUgU3ey1t0EaX+F6C1hu8U9X3sM/YYiLs/Hf0uQ64U+Wn/OtGgsT2ItJ+6VyeB8K/q/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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

On Wed, Jul 30, 2025 at 12:39:42PM +0000, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> > Sent: Wednesday, July 30, 2025 6:03 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal
> > <Michal.Wajdeczko@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> > Winiarski, Michal <michal.winiarski@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>
> > Subject: [PATCH] drm/xe/pm: Enable RPM via PCIe PM capability
> > 
> > Enable Runtime Power Management (RPM) for PCI Express devices by utilizing
> > their native Power Management (PM) capabilities.

Why?! The commit message needs to explain what it is doing, but it also
needs to tell why we are doing it.

> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
> >  drivers/gpu/drm/xe/xe_pm.c           | 9 +++++++++
> >  drivers/gpu/drm/xe/xe_pm.h           | 4 ++++
> >  3 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 38c8329b4d2c..3bbfc46044a0 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -285,6 +285,8 @@ struct xe_device {
> >  		 * pcode mailbox commands.
> >  		 */
> >  		u8 has_mbx_power_limits:1;
> > +		/** @info.has_pm_capability: Device has PCI pm capability */
> > +		u8 has_pm_capability:1;
> >  		/** @info.has_pxp: Device has PXP support */
> >  		u8 has_pxp:1;
> >  		/** @info.has_range_tlb_invalidation: Has range based TLB
> > invalidations */ diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > b/drivers/gpu/drm/xe/xe_pm.c index 44aaf154ddf7..5e6311964685 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -244,6 +244,9 @@ static void xe_pm_runtime_init(struct xe_device *xe)  {
> >  	struct device *dev = xe->drm.dev;
> > 
> > +	if (!IS_RPM_SUPPORTED(xe))
> > +		return;
> > +
> >  	/*
> >  	 * Disable the system suspend direct complete optimization.
> >  	 * We need to ensure that the regular device suspend/resume
> > functions @@ -265,6 +268,7 @@ static void xe_pm_runtime_init(struct
> > xe_device *xe)
> > 
> >  int xe_pm_init_early(struct xe_device *xe)  {
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >  	int err;
> > 
> >  	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
> > @@ -278,6 +282,8 @@ int xe_pm_init_early(struct xe_device *xe)
> >  		return err;
> > 
> >  	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> > +	xe->info.has_pm_capability = !!pdev->pm_cap;
> > +
> >  	return 0;
> >  }
> >  ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe()
> > */ @@ -364,6 +370,9 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
> > {
> >  	struct device *dev = xe->drm.dev;
> > 
> > +	if (!IS_RPM_SUPPORTED(xe))
> > +		return;
> > +
> >  	pm_runtime_get_sync(dev);
> >  	pm_runtime_forbid(dev);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h index
> > 59678b310e55..55b65728f522 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -9,6 +9,10 @@
> >  #include <linux/pm_runtime.h>
> > 
> >  #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
> > +#define IS_RPM_SUPPORTED(xe) ({ \
> > +		struct xe_device *___xe = (xe); \
> > +		___xe->info.has_pm_capability; \
> > +		})
> IMHO the correct method to let PCIe core get the permanent ref count if pdev->pm_cap is false.

that's correct, if we need to take pm_cap into account, getting the permanent
ref count would be the right way... but....

> @Vivi, Rodrigo what your thought, I think XeKMD should not take any decision based upon pdev->pm_cap.

right again... I'm seeing absolutely no driver using the pm_cap to take rpm
decisions, why would we deviate from that? Something is not right with the
whole goal here.

Thanks,
Rodrigo.

> Thanks,
> Anshuman 
> > 
> >  struct xe_device;
> > 
> > --
> > 2.43.0
> 
