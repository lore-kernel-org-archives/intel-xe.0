Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774C0C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 19:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779AA10E16F;
	Fri, 23 May 2025 19:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcA6bVyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3429610E16F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 19:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748028751; x=1779564751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hCooQujRi1HwEu190RM3WHjLcgoHkOTEbihaDn/SJaQ=;
 b=HcA6bVyd21XufTPbcqsCEpzS2L6kvDNEIUGQQMvGQmS/VouiHTVEbihg
 R1YYJPTnNBWZBQIt3FG4d7n2joeC0CCvIhqZuGmRQEG0fZUXQsPXsAApO
 RnZ47AZ80QEMCoSjtw3L6/96rtNpm21VZfytTGm7A2pZFw99cItWpcAVr
 fDcyzaFoLi56jJoOUvc/ahLiMyUaTEZMFA502UcoBBA8+K/soH1BSMCVw
 318cfSOMuxIb0qR1IHEzj2UBP+SwgzGZtNVizZbogwbU1gvgSPWYTsh76
 Q8UM/2tRMv4mm4pMttv4FIo6nH4KMLKpIXynOANqowkMCmOTy6Rw5SsN4 g==;
X-CSE-ConnectionGUID: rCZJKrSeSSeF0dHlLplkLA==
X-CSE-MsgGUID: LDBK2w2dSFu+hrOAiClRaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60730042"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="60730042"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 12:32:29 -0700
X-CSE-ConnectionGUID: RnsbmjdJQrWVBABkDtroTg==
X-CSE-MsgGUID: ewjhFYVWSO68o8uW43qQRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="146129765"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 12:32:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 12:32:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 12:32:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.57)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 12:32:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S87GQrxKCwYN3AvF2ALYKt6WW0/gudatTCl8I/LWvZv5/P5jrSPqmrfYyoF+/PrsIUzu8MDbHQL/knoVOHZtzndj2y4DwWvpEDSdvyD26l1Zk1Qy8AUPGYPyzHNsQbQRgu0P2MgtV8Qiu9ZNLN3IqqSAavuuwhOiM3oMFbPShX6cf7T01zMRx6147UiFY3tlQburrCO2A3LHm8ENZl4LnHauJYZoKFrvTl82uF9xKERb5oI8MC0mtr9iuhEMO/c3P1Xy4SQdNsCXJjo2Z389G4QkC1UwyI2rq4lFnyP6yVhVwOLcstCcMoSb/Ph0/x7ihfDhd+Hd7NYbVOMAW4MSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR1FdhOh/Kw/PHQTR63GQCecp/4wkpxMP4gtOdKMdk0=;
 b=cXPLB8GQshbl8RS1v0G6LvU2XfMxYS7h0JfFkLldlpnqHmVpAcjzkztUUU9P9yVhEM130oh3GoTzbQZQeUsUKa47ehiYW6E74Bv7gSFZ0r6otepoYdeYMfNwyuWEzC0ZqFQ/uvjkJ5Qt9csUUPvx7OD8sC97k3S5p4Hge8OIiSjiZ3oqvXXG2jUKWadGxNRY7VOuOqGwLUMKPrgtLYC9T/SRxQPZNt1017N7EIMqUBQ7O7HGLkf7gAc4eB2kOy7S7Rmb5q7+wxLOJJgUsV20QT5FyjCdqsG6OlfiKv5Z2/W0ngz0+fasFSETo7CYiAOQHlxH3jDgVmXzTkOz/ANHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 23 May
 2025 19:32:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 19:32:12 +0000
Date: Fri, 23 May 2025 12:32:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>
Subject: Re: [PATCH 2/5] drm/xe/lrc: Extract post context restore function
Message-ID: <aDDNOq2ygKL6a5es@unerlige-desk.amr.corp.intel.com>
References: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
 <20250523-wa-bb-cmds-v1-2-40b337f71bcd@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250523-wa-bb-cmds-v1-2-40b337f71bcd@intel.com>
X-ClientProxiedBy: MW4PR04CA0321.namprd04.prod.outlook.com
 (2603:10b6:303:82::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: c76d462b-d6b2-475c-3f47-08dd9a308469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck43YURPNi92UWlyaDArQUU3dkVqR1dWaFJCSVRJUzIvVFJrM2VpNWRpb3ln?=
 =?utf-8?B?bUdTTTlOajdzR09JWkthd0thazM1bVRXU3orcGVnZ2NRWHBhRFBNY0ZDeXE1?=
 =?utf-8?B?V2R2ZWpydHdoL2xpVzdvMVBXdXVLSGk3S3ZUQXBIODlyZ1B0ZTJUUVN0L01F?=
 =?utf-8?B?WEhEeTNJNEFOSmhlNXY5ZUQxcnVuRDJpZERCc0Q0SnBVNzJjeXdCL2tuUkc4?=
 =?utf-8?B?MkZlQnZEMDM3TzNWWjR6b2F5TVZUMWEvaHlGVjJqb0FLejJQU0syb2szQzhs?=
 =?utf-8?B?aEpadVc5czFYY0xPT0dIWUF1S1dadlFoa3FVK2hGYTFIdlR3U01Gd1E5bVJQ?=
 =?utf-8?B?d1JjeG5qZFVMN2RvNDN3dGlMZDFFNTkyR3QxUDJ2ODdvcWN0ajBuNzF6dHla?=
 =?utf-8?B?OUljbGVRS0F3NElWQVo3bDh0Y2FabEx2alVweWRWMjlmN2IxK3Mzd3BIS3BZ?=
 =?utf-8?B?eG5MQVBXeTdkZXIzK01Oa1BJUllEcndBMmJmQy83WXkrdmE2bjA1c2Rydy9L?=
 =?utf-8?B?aU54ZnpqQndFcy81b2puazdUd2xUUnlKZnhWSXdGYjhmSklaZkR2M1Z5RHd6?=
 =?utf-8?B?RHdCWVFrYy9QRDJHSXFsemFxeXB2dVczVHFJb0FpRVdaZSs0Z1RORjRhR3V3?=
 =?utf-8?B?UkVtTTZ6RU4vaGo1bFFpWXZNbWc5dy9DczBESndSZkRsR1R4QldKaXMybGsx?=
 =?utf-8?B?b3BkZExRM0FRYk5pdkZ2ckhNMEpnL0RxV0pTZXZPcUhKVU1GQis2VXIwb3Jn?=
 =?utf-8?B?dld3QXdicVFTU1dLeWF1dVZGNm95QysyeG4xa1p4V3djOW5ndisvRFhKVzgw?=
 =?utf-8?B?aTY1ZmtETjBtRGpyd2FyVWJFR3FTOXlEZVhvckhrdkxxemREVmxLNlN0cjdJ?=
 =?utf-8?B?SEdsaFdRWmhJL2hTVWVJK2tzWEJTa0VUWlIrVEFwR2RYNURNTnFwRXZJcWt2?=
 =?utf-8?B?aFpvb201MFRON1JOZ1p2c0J4OVZkbnNHeURzZm44N1FlVzdtNEg1VGIyTHh5?=
 =?utf-8?B?T1FSdGFwUVAxOEg5dEhQRWNKVVd0Rm8wWllSOTBlZis3TkJpZjIwUVpwN3Fu?=
 =?utf-8?B?NnI2Tk9jSXlwMVFlajNHeDUxcjlYS3B4STJjT1ZCR28waVFrZHlpRjY4UWNu?=
 =?utf-8?B?RXBVdGNpUlZjMy9oRDE1TXlGS3Mxb2RHczlrR3BKS2h5ZUlsVXljL1laYm5t?=
 =?utf-8?B?Rk80MHIzblpQNy83OFg3SGJjL0tGK3RzOUVPT05pNkNMN1J5MGNkU2ZEMDd4?=
 =?utf-8?B?aXBwV0xrUFd5LzlyZ2JUYndzU0hTbUpiNGR2UEw1VGtRTFI5UEV1bTNGMFJF?=
 =?utf-8?B?cWtyU0Vacy9ib3gxc3BwTkF6SzNTTTY1R0dGUzFQb00rWWg2c0VTbDVCczkx?=
 =?utf-8?B?MTAra0JobWNDWFpXa3NQSGVVSEs0TitLR25ZWGhRQ25pZThnWmtkRkJGNUVq?=
 =?utf-8?B?MmY3K2R1dG9ra0lydXVQR1F4UlpXTXpRY1pDRmFyeTJ2UE9WQmwzUUYrUHh1?=
 =?utf-8?B?ZU1DTzYwT0tmQkdmMHhNeElYeEtHOStGd3NKUDVYcVpSenh1T2NxUDI4WXJC?=
 =?utf-8?B?RmxGcThHRXN6NitwQ0dMU2Q3M1hPQ2hyS3JWT0xjWkRVZWNJQ2lQSU9hNlpZ?=
 =?utf-8?B?TnVxWXY5aU0yS0xhcTlIQzVPQnZrWHRYcHNwWTh1enRENVo3RVJ1NktwUVJX?=
 =?utf-8?B?V1pmQm1VNXg3Yk5KYWtRcFZUVzVzQUpmYzRtRUU3MytUQUd5eUc1RWRwZ3Vz?=
 =?utf-8?B?aWNjN2M0ckZHODhTT1VENVRDdi80YmtsUXJFWFd2dXVlK25xRGpCc0pwTkRl?=
 =?utf-8?B?Y0dKbUw4c3dhZnYrMzNLamY5dTM5N2tqZW1YYWdyak4rVmhTOXN3M2hoM3h4?=
 =?utf-8?B?VWtBbE1iak15NGtjRmVZclpOVnFNb0pHQXdkTGxSOTU3Tk5ybTIzTGF0Ynhj?=
 =?utf-8?Q?wba3liUjv+I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1YwanQvSTM1LzV6cnR3RmhXK3ZnQ20wSnpoaVdQN2x2MzlPTzNUTGxKbW5j?=
 =?utf-8?B?d2lnL0tMdmducnJENFdBc0E0anRBMmptc0lnbElzbFc2aXFia0ZmT3FlYllR?=
 =?utf-8?B?NUpvS0l2c2ZuOVVsL04zby9jY1VERkFUbEJ2TVpjNDQ5SkowRFA2ZFBSdWlG?=
 =?utf-8?B?cXh6em5Vb2JLTmVsemhBWWtTVWRKWXFQZTN3NGdWamw3am1leWdSbmFZK3FB?=
 =?utf-8?B?blJoOEIzeHF5MmlUTGl1ZDRIVnNydXVUay9MZkpwT3NtaGxkWUh1RnhSZlJy?=
 =?utf-8?B?a3Z5QmRaejF6Qmh6Y2JkdDVrTlgwcFJXdHY5RHJKZjdmWDRJd2crRXg2NDJI?=
 =?utf-8?B?eUV6bk16cmRBWHF3d2N1Y2o0TUVmbWdFTmVwcWVXWFJCekttWHhsdWl1UjJZ?=
 =?utf-8?B?S2lmN2JiSE1kVUZNNlB0ZTlDMi84S3RCRjFvZzlBWFRhWUdLRjdUclFDTWxE?=
 =?utf-8?B?enl3a253aG1WNWhhQ2lpN3JuZCtuM3NxNFpGMHJsRERZcHZDSFpLWE5KN1l6?=
 =?utf-8?B?ZDRWT2J2blNOV29WMU0yb01HV1I1NDdXMFpVMnRnbHB2YThITjUyNmlHOWZt?=
 =?utf-8?B?dGZVSmNUYm1BbjR3aFhUK3IxMFdaRUtUUEhOK0ZMOEpsUzEzLzQ1dFdsMXIw?=
 =?utf-8?B?SjYyYWlITFg3NENrT05hNzZkVGJMQjNqVElMNjNWVDBhdGN4UFp2aGxaQ05w?=
 =?utf-8?B?cWIxeHIwN2pxUm1aekZnL0RLNFpYQkdNVUNFZjRERTZ1RGNjZ3dLS1h0OUtX?=
 =?utf-8?B?dVY1SG5pT3Z1SzA2ZkpTTElrYis2MnVtSjkyamZOQWgyQU5rTy96OGJNVG9a?=
 =?utf-8?B?Wkx5RDJaZzk3RXMvdE5kNnZuaWkxSGdmaC9Vdk14MFl5enhjeFR6dHA1VThl?=
 =?utf-8?B?U1FBaGkwZGxRVlMyTk93TmY5OHFFSVJuT3U2UGZFcklINDRLTndmSi9KbDc5?=
 =?utf-8?B?V1hkK29JblZRWUNaaGtzSTg2bU5jQXg3ODNOaEZEdzkwa3RsVVgyd0lOZWly?=
 =?utf-8?B?dVFZT1BpaTljRXRiTitxd0dHZXNvNUphM25RSk45dnNTbGNaTnk0cnBLUVNr?=
 =?utf-8?B?ZTJDVFY5QmZQSXlkZWlEampuVjRSWjNoSlJHdzNhYk5mbGpHUWY2TzRWMHo2?=
 =?utf-8?B?VWJZMTNpbW1HeFJvdG5yVndjaHR5cVZvZStuVjhSLy9qS0FsNDNvRTNtUGZp?=
 =?utf-8?B?dUVCTDcwdUJBV2lYVVpmeWpzZ2lpVWRKWWxWWklBZ3BaaUdDdU5Oc205REdC?=
 =?utf-8?B?SC9tQ1E4ajhKbUhzcmFsVUgvV3F1elVOMnhaNTFrRDJOSjRPOHNBQllNQUhE?=
 =?utf-8?B?b2E0amRHcmFOanpZaWhEMUZQZ0VETmEwZXMvUDRaTkhuQldLZ2N4ZWZwUnFX?=
 =?utf-8?B?SmZoZTdRM3dqcUlJRzBGRExYVkZFZE1UWWlQbGNQTTBMWWtCcTRBWm1kUFlO?=
 =?utf-8?B?Vm0vQ285N0orSnFFY1pDQi83bUllalhRdkU1ZU5SbFVDWFBhbkFKbEhTSEV5?=
 =?utf-8?B?K1JBQ0NTSjg1djZGcDUwL3hzRnJQRG50L1pmQnljWWhRcEdqRzRUcy92VGIy?=
 =?utf-8?B?TEVDZ3FtbG9UdUNkUXVjdnQzK0xsanNjMGs4Z3UrRVA4LzlBUHVDQnpzd1pU?=
 =?utf-8?B?ZTJ6UlUzblBSWVFqd0g2OU5UZ0pSV2M4aUNIYkhHcWpYc2NiM2J6K2NkdEUw?=
 =?utf-8?B?aHh3OWcrLzVpaE9QOUgyMFZtSEZiTUZhdnBTTFJqd05yeCtrb3Q2ekZ2VFR4?=
 =?utf-8?B?cW0zcGpRQTliczlaV2RyUWVpWWJMb1ljT1k1R2phT3dUS1VpdDZmL0RMQ3FJ?=
 =?utf-8?B?SElHeFQybmVCc2lVZElBZmNOZVpYY3B1NC8wL2VZeW9lMGR5UHBGRFlrcTBv?=
 =?utf-8?B?U2FzYkNuRkVOc0JPTE1lTTJnYjlPTHE0VHorKzNUeHkyQkNUbzJpbWJWMm9O?=
 =?utf-8?B?TFVrZE1FV2VoOWhYM1NzaDlHL1BtRmF3YUFva0pPRU5yOWt5dms2MzR0bC85?=
 =?utf-8?B?bUtyc2pOdkNYMmlhZGt4LzJZRTdJcGpaWlhRVVkyOUk4Z2IzZDhTNmtFTmYz?=
 =?utf-8?B?ZjRHbXZjVDRHOFZndWt0MjFoSVdJaFFUVHpDSlNRdHA0RFh2OGtMdmppNGtD?=
 =?utf-8?B?K25FbHp5TTV3cDRmS09FazFYak1uR21vMHdiMHoySWNXcUhUK0R6WmJDS0RQ?=
 =?utf-8?Q?AdLAhPet9ar55pYd/09mKNo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76d462b-d6b2-475c-3f47-08dd9a308469
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:32:12.8729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7xOCf2Ab7uU58F5d7MWICZ5Uy6xQ5HT4VOMa/5Qss7Wi3OoxzfyCfc0I+gVc93JtxXhK8HEAjKSSnPnwaqCCVwuLQpcIkVfBbdpDnOVlEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
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

On Fri, May 23, 2025 at 11:54:36AM -0700, Lucas De Marchi wrote:
>The post context restore is a mechanism in HW that may be used for
>things other than the utilization setup. Create a new function called
>setup_post_context_restore_bb() that wraps any function writing useful
>commands in the buffer.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 25 +++++++++++++++++--------
> 1 file changed, 17 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 61a2e87990a9d..4562049a23fb1 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -917,9 +917,10 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> }
>
> /*
>- * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
>- * context run ticks.
>+ * wa_bb_write_utilization_state() - Write commands to wa bb to assist
>+ * in calculating active context run ticks.
>  * @lrc: Pointer to the lrc.
>+ * @cmd0: Pointer to the batch buffer location.
>  *
>  * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks of the
>  * context, but only gets updated when the context switches out. In order to
>@@ -944,11 +945,9 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  * store it in the PPHSWP.
>  */
> #define CONTEXT_ACTIVE 1ULL
>-static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>+static size_t wa_bb_write_utilization_state(struct xe_lrc *lrc, u32 *cmd0)
> {
>-	u32 *cmd;
>-
>-	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>+	u32 *cmd = cmd0;
>
> 	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> 	*cmd++ = ENGINE_ID(0).addr;
>@@ -967,11 +966,21 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> 		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
> 	}
>
>+	return cmd - cmd0;
>+}
>+
>+static void setup_wa_bb(struct xe_lrc *lrc)
>+{
>+	u32 *cmd, *cmd0;
>+
>+	cmd0 = lrc->bb_per_ctx_bo->vmap.vaddr;
>+	cmd = cmd0;
>+
>+	cmd += wa_bb_write_utilization_state(lrc, cmd);
> 	*cmd++ = MI_BATCH_BUFFER_END;

Why not just assert right here for cmd - cmd0 instead of putting it into 
the next patch?

Thanks,
Umesh
>
> 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>-
> }
>
> #define PVC_CTX_ASID		(0x2e + 1)
>@@ -1128,7 +1137,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	map = __xe_lrc_start_seqno_map(lrc);
> 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>
>-	xe_lrc_setup_utilization(lrc);
>+	setup_wa_bb(lrc);
>
> 	return 0;
>
>
>-- 
>2.49.0
>
