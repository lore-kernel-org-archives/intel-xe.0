Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B0C87FD2
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 06:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8BD10E033;
	Thu,  7 Aug 2025 06:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+cV/avT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC46210E033
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754547791; x=1786083791;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+KxieAhZk+IzcBoSzAn7Oy5zKpGctoMnsKuPoAIVNrI=;
 b=P+cV/avT380/x51/rWZtO6TtuhJC8FOr6a0iB9nxrdsK9fQbwb1y6kt1
 QOpDughun/mtzqHKJ4nCQTitukenmkY74gF7UxMFLoh1VMlHpOruk0S+2
 pVHr0M3jawwBqWvig8Jlj3KnGVy+EKv74W7NULKhuISPN/fowg4VUr3Y0
 AFuMMElGDJxYkLVrcIuYS7oFjylKaKmyUdVpsPOyBegzaw8mxbtimY6dA
 ZuoSQFJPSxP8upZcYyRNbu7Y2eTKBUH4u7CY663QubdqyoxZJPvBuYgIv
 D53CvhJMUghJsCoF93V5TQFbUojrphJ5/fcU/gMl0kBjSHUu1y+KhYxqK w==;
X-CSE-ConnectionGUID: J42rSYuHRWaLxjIeV8Bd8A==
X-CSE-MsgGUID: d17TZ2V2QUKlaWFxzY/tvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67463708"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="67463708"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 23:23:11 -0700
X-CSE-ConnectionGUID: pqoTCX8aRZuFL4g5pSOgpA==
X-CSE-MsgGUID: eSMPXlwzRc6O88nDL9qJ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164874566"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 23:23:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 23:23:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 23:23:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.74)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 23:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlXP1cN7lY+L64I4bcpE+scOKjaTHjlgP1ShftFIkI35mUhRxsBq0uyP5UN4bxnREhET9/RlgPhO+jVK4htQStR8zlq1LRxTHxFDiertnLjzR5URz3wBTZEJEfNxZcK6LUAuw4d5RQueb8/+fId8VADhwCGv5XZEhhzTRUeUPKcWfs0sd04LYZ24C9Yo8E99ECpkUVNW3j6eEXM/ktTTquEJqoGmbqG3/7qEb2u1/m4k9GlXQwtGVPFObGL+j5/pz9IBlnKNSjvjh1btRNWZVo50Vlndzf1EuyHk5Ji85WfYsYawBcq0S8qTB80TSCWN7qto08NVEXieLMXfD4Bxsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQSSRwFy2o8PV0uoXtUvQNjetGcOq6UZPNxWMpAciMY=;
 b=VLF7b0OM0b7tACrcsb0wvLJzySPblun2nf4Vdq83aCggEkdbo7YWQhtNbY0up1Uzowu8MqigZF+XLXrNwzMQgLbLmYTsBuBaqvnFo7RAVByIS2n7O/eaJY6BW2LY7Lw2MS5VPnx8dXNE1V85eUeDxss+brNwGtFFlcMmVnfh+gi+AFYt+TOkz9XGbZBDLzI7Kdb/esZsLERzk1KDQB3ol319/NKSSXyv3grGnihYu1UoDNleVAz9bCY2/J6J2WOjNnzY7CODj7GoLztlESLIOSarm9G+PQuuEfSm/qgMBOztYZ4rOZuk5AzWG+IsIafDdFNld/V/4OjJaZgMYY9MRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Thu, 7 Aug
 2025 06:23:04 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 06:23:04 +0000
Message-ID: <44f84375-a8da-4d9d-84f7-3e0029356204@intel.com>
Date: Thu, 7 Aug 2025 11:52:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Scale mmio send/recv timeout for CCS
 save/restore with smem size
To: John Harrison <john.c.harrison@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
 <20250806082910.15845-3-satyanarayana.k.v.p@intel.com>
 <aJOCoZMciuSkCYgg@lstrano-desk.jf.intel.com>
 <f2c26f5f-5033-4604-b355-05c234bd62fd@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <f2c26f5f-5033-4604-b355-05c234bd62fd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::11) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 871880c0-8515-4e36-6bec-08ddd57add94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWlkd0gvZEYrdWt0SW42c3FWQ2ZFT2V3Y2pOWk00U0M2d2FXY0pBZlBEeUxN?=
 =?utf-8?B?YkJDZi9OQ1hrTFFjYnVjZU1DV2xmUm5mdG1jclY4RmZWOTB1Q296MWxjRXMv?=
 =?utf-8?B?VmJQUllKQ3JrSzg2bjZRVTY4SWgvMDd1ZUEvNzgzY1h5eFhseEp0ZEFFdWw4?=
 =?utf-8?B?RUhseUhuSEVrQUlOZHowcWkyTWZGSWdOcUdBVHNwNm4rSTB2ekpoN0RvN1Bx?=
 =?utf-8?B?MW9BS2VjTEx6ODBpOE9tSTdhb3Zna0NMeGN2Wm01OXNFaWFWNU5aZm0wY1Jl?=
 =?utf-8?B?WlZrYSsrUWlDRnVqZWpyV1FWdXExZllobWptMUJ5UjJDelhyUU1QbjBvUUdB?=
 =?utf-8?B?cDRJM01lcUpIbkNYL3B3bXhuZWw0ODB5b1dWazN5WEh0aHJTaVQ1bEJ5czFz?=
 =?utf-8?B?d1FpelJlYklucElhSSt0RjJPTnh4cDArNUppc0YwVUVDSE9LRkxoZ3AreUVK?=
 =?utf-8?B?MTdTWm5uSy9RU0ZPa0xhdDR4T3ZYZkhRVSsxWC9DQ3R4dG9YclROSkVneFk1?=
 =?utf-8?B?b21XVm5wbnNsM3ExZVZlaG8wUVYvWWkwODZ1eVdZd1B3eGM1QWdBOFRXd3FH?=
 =?utf-8?B?MkcydVlxZHNqcnVWS2R1bjJGdU00T3dkQ0xNWTlxVXlIaDdPNmpna1o5QWxz?=
 =?utf-8?B?U2UxdFY4RlFEYnQza1Q3cnJYQ216ZFZBalZ5MW41NGhwRk5RY2ZDSzJQYXdK?=
 =?utf-8?B?d0dHSFVCTUc1RTJDcVBuL2I0T0lybGhqZDRRSDJycVJOVXpJRUcvUXBQSC9R?=
 =?utf-8?B?Um02TTlmQVprb2QxRDY2ZEhscDZOQnh2WkM0SXBybWtwN0VuRm9CVFZnQUZw?=
 =?utf-8?B?TGdMb21seC9oUUVyV2s2bUFUMGsrNUV5Rmd3ZklzQTZTaFo4THd4bGNWVXln?=
 =?utf-8?B?cDQxbldoVWR2Y09oZnFMYThMV1lqK0l6ZXRoMzdOUXh5YjZtcDlxSnVuTnNj?=
 =?utf-8?B?aUtHZFdaTGRVN3YrU2hXWndYeUE5dVJwbFZ0WTlRdnprWUVoTm9MMVVicmF2?=
 =?utf-8?B?NGNZYjBEUUVuZC8vQ0I3RlNzeG1CWUpZM3NIYTlNWlMxNklDTERTTHNvb1VK?=
 =?utf-8?B?WElYQkNVbTRLTGZHSlRqQmU1bHljRmtob1Q0dm43LzJla3BKQjNTVm80VTho?=
 =?utf-8?B?SUk4ajhDcllxaWtHNnU0NnRiK3ZuTFI3eDg1Qzk3N3lpRFVSU0ExOUFpUFMv?=
 =?utf-8?B?Sjc3OFFQMXZkcU1ITTk3dXlkRkJDU01Jak5QdU1vOW92cjgrbC8wU0RjYjRt?=
 =?utf-8?B?UEVDVEtMamlxeGZ1ejB4VUFzZmxwbTgyUFJrU2p0Q05Wa2c1NHA2OGtybjda?=
 =?utf-8?B?RkdodGpNMUJWbjZONEpnek1IdjFRNGNjV241RDlwMnNiTnR1Z0dsT0daL2l5?=
 =?utf-8?B?Y0JVdUhhbllmc2pFVTZSSGRBVGxYc2NXc3JJcTE2SGpKYVNhQ2NZTTV4OHIy?=
 =?utf-8?B?VGc2TW1JK2NpMUk0MHhLalJSYTNSUjMxMFhPeE1pWlhNNXRheGNvMGx2WmZj?=
 =?utf-8?B?dFJVcFp3Qm92Y1NQVko0aWV4Wk9QSElqQ25QRGQyTE5TVnhIdWZVNEl1WkJZ?=
 =?utf-8?B?U0xqaExObjlHOHpsbnE2ZmxocmxCbjJuZlREU0VJMWk5ZmJaOEdRZDhacnFt?=
 =?utf-8?B?L3NMMG1ONWJlUDdNZDhwUlZVa09LQ0JLQVZzUHZKeUR3Wm4yWklwWW5ucEVG?=
 =?utf-8?B?d1JGSDZYbjNFSUJ1NFVvYVMrM204OE5ydjZIVC9JUEhVaUQyT3FzeHV4bnR0?=
 =?utf-8?B?RG9kNlpXNUJtV1lQcXNaSy9jWkM5a1QrQlhjZW1ySXNYcE92UFo4UXJ3dE1u?=
 =?utf-8?B?K0xPRDY3OTNpMXFGUzZMeGFieGxqYzlzZXVhM1AzU2x3RHBsQS9ObCsyVm9Y?=
 =?utf-8?B?dVBtT01xT29yMzJ1TmhKeUl2OSttYzlsSFJkS2t2V1dlN1VPSUUrTDRKcGhW?=
 =?utf-8?Q?HeOxT0XJH5A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFo0VmVna0RncGhJVWVFV0Zoa3NDOFVacEdqMzNoZThxMmcrRW94dkNQYTFU?=
 =?utf-8?B?V2tObWpHd2drTzYxMW5UU3JJWjUrM2pNS1VVU250dWpRNFpPVVA3NjNUQ0h2?=
 =?utf-8?B?RlRJUmx6Y2NnUUQwVFhLb1ZVWmx0VDJmaVB5c09RRm9zSHNGQTV6MW90WDly?=
 =?utf-8?B?T0VZNjNUZmlGLy85ZXRrd2MxaGRiYm9wRGM2YlAwMHpnZXplRmIwYi8xREdt?=
 =?utf-8?B?UGE1MWVWWFZQdkdXODh6bXNLTTNpRE51ZFlvaUx6NnVuaGtQV1BiRE5aQ3ZZ?=
 =?utf-8?B?ZThVY09qU0dGOUNzNzQybnRscUN2bjJkM3RKN0x3MjZtQ2ozMGNjNXhIdVYw?=
 =?utf-8?B?eExlVkpYc05iMDhwem9DeGhXdkV3TVhpNjVSZXAvaWJhdGR0eUZIOXQ1aGFN?=
 =?utf-8?B?ajVyWTVMS05KcWhqUDZCa1l3WEJ3S0l5WTFNMWJGL2xKUkoxVzRTVHBMN1kr?=
 =?utf-8?B?dldjc3JpZ3dLUFB5RmxoWjhUQWF0WFdIV1M1OHYrWXZjUlVJQW1VTEF3ZU9J?=
 =?utf-8?B?VzJwWEphZitVQWJObjgvYzJGSkFUanF6T3JFeGVNbS9VNm1iYndXWFdBTnFo?=
 =?utf-8?B?YVc3MzQzOTR5UE5xNWNab2dUWjAyZGJHY1dGRTJjeWtPanR4WlVVQkdzUzBl?=
 =?utf-8?B?aVJXQnJ4S0pnaTViZlp4Q3d2VjYyTUxUQVZ3aXQ3VW0rNXZGdEM0TjJUd2xp?=
 =?utf-8?B?M0RxZ2hjaFppYkpPMDA1UFpRczVSNjlXNHplTHpEcDJYc21HNis0dzZKZlpL?=
 =?utf-8?B?WG00aUs5QzVabFRqdWlVaTRJaHhGOEQ0Q21aOVJxSXUreC92NTZKTzhmOUlG?=
 =?utf-8?B?cU1RaWxqYmZsNTRoS0Q4aTlXcUNsTlo5eEViSzJTUHEwWkt3UUJJUFhxTEkr?=
 =?utf-8?B?ZWorZ2xDak1QaWtORlVsWXdwYjVIcDBhcVYyWnJDalJwcFNXQS8vVTNjSmhh?=
 =?utf-8?B?cUVlUFJKQ2pzVkpySE1zd3QwYXQ5TXJxVFQrWEFUQnQ2VFlPSmJYSC8veGVF?=
 =?utf-8?B?T2p2NnpOMlg4VzNaYXB5c0x0OFZLZmxtOFdiSTB6eThZMm05TndIYWFxbVlP?=
 =?utf-8?B?NFU5UTdUZ1F2bEtJaElzQURwcTlmbE5VUlpUbVBJQ1ZsQisrTTVBRlhwdVZ5?=
 =?utf-8?B?bGtrNUwzdnNmNnpJME1lWHZ0L3lXNitzbkJubWpRVHNJM1FzOGJqc2ZNWWJk?=
 =?utf-8?B?TGFxVERhS0UrQ09lTzlCdVpkcHE0NktBRE9vRjZkbUxSMFM3YlZCcklabHRS?=
 =?utf-8?B?aEwyREMybnJucTVNMHhySzh3NVNuWG5Fa3J0UkxIbjNiZVZxZGFiUVFMWFdW?=
 =?utf-8?B?NHArK1dKZTQzb3RzUUZyUGJYNnR6TmVCdTRzTDF6TFlRVUxOZCt3RDhEWWtQ?=
 =?utf-8?B?SVBhMnFLZWkxd01iaEMzTDRqOVVINjh1SU9OczY3MUlKZzVKaUhOVVluZHBm?=
 =?utf-8?B?eGpEYWJyOWRzUXgzWTNZOEFUelBKKzZDTVdHN2pUNTBvb0ZhdzJQaWU3WnV1?=
 =?utf-8?B?Y0IxNHJDMUJONVR5cHM0L0FCdkVjSDFxREhLOGlMUnhNUDFOYVJmR2s4NUdx?=
 =?utf-8?B?YS9vU3FxZWxKOExJdVRuam1Kb2lmMHBjc3lJRlJsbXJzZFk1b1hCRGlhcTJk?=
 =?utf-8?B?cFBCZU5BWENNSUcwWm1CUVlJaHFMY20rZWtHOXFXSEFMVk1jQ0g5NUJrbzlL?=
 =?utf-8?B?UzhrUzMySDhoQ1puSmxSN21jY3VGT3JaVWsyMkdvQ3pMamI1aVY4aUt6b2Nn?=
 =?utf-8?B?YllDbkFyeUhWT0d1Q2FGMXBGKzBGaXpzUTdiTkt2RjRSN0s3VXhnUzM5YVFY?=
 =?utf-8?B?VWtoNy9uTXEzTGN0dHBBbWVBMlVtc1VieFh0TmNic2F1WnA5QVZiMjVtcnFY?=
 =?utf-8?B?aUFaVkNQS21QR0d4cjRmUUFML1RVUkxJMVR1VUg4Uk56ejFaSzRJUzZNZ3M4?=
 =?utf-8?B?R1publU2czBnak9La0N4MTM2a25CTENIdWZmNHpyKys2TVBDYVQwRXh4bGUr?=
 =?utf-8?B?bHlMYm5pMlZ1V0hUWW1PV0o5WTl6enJPNWRFUzNVWWVTemg5MnJmZGFwUFVM?=
 =?utf-8?B?eTJHWGR3eHRIckhraldKMHlMWFNpaDZHTWQzaEJ6RkNYcDUzTXVKUmdhZ0dK?=
 =?utf-8?B?eFpKRXFiaFlWVnA2ZzdBQTZpNUpNVlQxdlNKNHlqR3JIdXdaMEIxODJFdjJS?=
 =?utf-8?Q?4WVWXrvrvojyh1ifYyQlyHc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 871880c0-8515-4e36-6bec-08ddd57add94
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 06:23:04.1235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuHeqpgQ+00QakYHVy72PfONbaF6QO8Nyq9gNN79CgzThHqRRq0QwNUJywp5PN4mhjWOc5MEsD6Ivb8nqRV7rSCfIsZ0g/cQ9gL/FcPL5Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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



On 07-08-2025 01:27, John Harrison wrote:
> On 8/6/2025 9:28 AM, Matthew Brost wrote:
>> On Wed, Aug 06, 2025 at 01:59:10PM +0530, Satyanarayana K V P wrote:
>>> After VF migration, GUC restores CCS metadata scaled to system memory 
>>> size.
>>> The default timeout (50ms) is calibrated for 4GB memory capacity per
>>> specification. Timeouts for other memory sizes are proportionally 
>>> derived
>>> from this baseline.
>>>
>>> This ensures adequate restoration time for CCS metadata across
>>> different hardware configurations while maintaining spec compliance.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc.c | 33 ++++++++++++++++++++++++++++++++-
>>>   1 file changed, 32 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 9e34401e4489..d836ded83491 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -10,6 +10,7 @@
>>>   #include <generated/xe_wa_oob.h>
>>>   #include "abi/guc_actions_abi.h"
>>> +#include "abi/guc_actions_sriov_abi.h"
>>>   #include "abi/guc_errors_abi.h"
>>>   #include "regs/xe_gt_regs.h"
>>>   #include "regs/xe_gtt_defs.h"
>>> @@ -1397,6 +1398,36 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 
>>> rsa_addr)
>>>       return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>   }
>>> +/*
>>> + * After VF migration, GUC restores CCS metadata scaled to system 
>>> memory size.
>>> + * Default timeout (50ms) is calibrated for 4GB memory capacity per
>>> + * specification. Timeouts for other memory sizes are proportionally 
>>> derived
>>> + * from this baseline.
>>> + */
>>> +static u32 guc_mmio_send_recv_timeout(struct xe_guc *guc, const u32 
>>> *request)
>>> +{
>>> +    struct xe_device *xe = guc_to_xe(guc);
>>> +    u32 timeout = 50000;
>> Is this really the upper bound? It seems like if could be signicantly
>> higher if multiple VFs are trying to do things all at the same time.
> That is really a problem with the wait function itself rather than the 
> timeout. The timeout is meant to be the maximum expectation for how long 
> the operation will take once started. Unfortunately, we currently have 
> no checks on whether GuC has actually read the message itself before 
> starting that timer.
> 
> There is also the opposite concern - what happens to any other VF (or 
> PF) that is trying to get work done while the GPU is tied up migrating 
> this VF? A stall of multiple seconds will cause all sorts of timeouts to 
> trip.
> 
> I think the expectation is that migration is a deliberate act and the 
> system is not going to be doing anything else at the time. It is not 
> something that just randomly occurs in the middle of a heavily loaded 
> system. But I may be wrong on that?
> 
>>
>> Scaling the timeout itself, does make sense though.
>>
>> Matt
>>
>>> +    u32 action, factor;
>>> +    struct sysinfo si;
>>> +    u64 sys_mem_size;
>>> +
>>> +    action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]);
>>> +    if (action != GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE || 
>>> IS_DGFX(xe) ||
>>> +        !xe_device_has_flat_ccs(xe))
>>> +        return timeout;
>>> +
>>> +    si_meminfo(&si);
>>> +    sys_mem_size = si.totalram * si.mem_unit;
> Do we have to worry about Linux supporting >64bit addressing any time 
> soon? I assume that is the reason for having separated units here is 
> that the total might be over 64bits? Or are there no plans for 6-level 
> page tables yet?
> 
> John.
> 
I do not think we need to worry about >64 bit for now. As per lwn.net, 
we may get OS supporting 128 bit by 2035 which is long way to go.
-Satya. >>> +
>>> +    if (sys_mem_size <= SZ_4G)
>>> +        return timeout;
>>> +
>>> +    factor = (sys_mem_size + SZ_4G) / SZ_4G;
>>> +    timeout *= factor;
>>> +
>>> +    return timeout;
>>> +}
>>>   int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>>                 u32 len, u32 *response_buf)
>>>   {
>>> @@ -1439,7 +1470,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, 
>>> const u32 *request,
>>>       ret = xe_mmio_wait32(mmio, reply_reg, GUC_HXG_MSG_0_ORIGIN,
>>>                    FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
>>> -                 50000, &reply, false);
>>> +                 guc_mmio_send_recv_timeout(guc, request), &reply, 
>>> false);
>>>       if (ret) {
>>>           /* scratch registers might be cleared during FLR, try once 
>>> more */
>>>           if (!reply && !lost) {
>>> -- 
>>> 2.43.0
>>>
> 

