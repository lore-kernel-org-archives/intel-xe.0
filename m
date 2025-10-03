Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA41CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 13:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA00010E10C;
	Fri,  3 Oct 2025 13:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G70hvXeq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CD510E10C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759497448; x=1791033448;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=gv1hDaiz9NBNZNiM/u3tazOcbWp6punO1c/Xe0Il3Zw=;
 b=G70hvXeqCc9nBzCQkiD3SQKX9RCp241z0M0GyY/ycv65opbatklwCbfh
 JwVWKXdd/U2EqowCYYVD19ZVAG15/eQ+9vUEHxy90CcmRs4vqgAGZyXbG
 RmA2VT3cm/r2V+AFETcD+YSSRW2p+8gphbE2o0mRpLvzSUzMW8LNc6Dwi
 Fx/WbfNDYaxMOG1Jrco8rGkgo1MG1IcpQFEC5nFfdgWctV4HcwY4Dc0Ts
 FlIiGNRv1sld/hTjFkZDYsGiPOUubS5xM1TVKZDuHVMFdNehRCpaoygyU
 E8Dn3OT+EH5uORICw1Z0YlBg7JJMX4AaGgNx1c9DMtTfHxpP+VVWA0VoQ A==;
X-CSE-ConnectionGUID: ZKEfpCO0RlazT4XqGIbmCQ==
X-CSE-MsgGUID: 7qltJsxZQLeIt6CcGdeMqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="60816365"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="60816365"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:17:28 -0700
X-CSE-ConnectionGUID: uqNrJ9pmTAqm54O5tjGZvw==
X-CSE-MsgGUID: BLYBE+rPTKGMfN0MNZyt5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183307122"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:17:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:17:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 06:17:27 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3a9Eb1bdWnXbX9ovh9NHq/qTaLMJBAH8pKQ7g+7FGX82eSnBWBA35Kja1uIhztpOGDefxGd/gDpIRl47Pzk0T89GWQc/HNeD5o+NtxgVxuuAIQgmnLUzl+FOMjXHS67QNeBD7bFubBzl6IVig5k5MdIgxhoyIZc8OEpzVpINeuyVQGgF8sGWSwhRk5JOMkx84AiNnxkq9BpIAtcWgGn5UEa2yu1v70jb660z9hUFzH9SLcSegzqVqghTCQK0pR0SNXy46/GECeykd3Md4T4vfHR4SAO3gVi7cJo5iEFVz3AXWoupnkTVlsbedSDc3TEvft+7PjUMSLJ4zPMaLRBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2S2blVMgW460a1b0an1XP+StDMwFJ1vLYrfijJ8N/U=;
 b=ZvDi8AmNdoCNaAC00DRQynjPGOXNu55HMtNPp7TTaEmT8DmGasl+qdy0m/VNLaZ+xpmVzY8AQws9eERgiw3WMVu/BZ4ZZBZjwv222J1ZJXH5oHGZoDrM9fM+zXZ/0u2rkAICV1X4iYae5tDVPyMS0oam3u4UEHl7b6zck5V7wNVYePUIHgpvihxtkqkGKSvQUbY5duIP50UxHbYTQ/rsAgX1Sfdq++zx/o8UZT5NgcRi18r3kUZb5XoL0I2dM7ZQdVLvBRyKf3BpGw2wj/kztnEh5bCCOAxK4SS0vVSQWn729h2kNxz/6Q7WlsSsZIq0rwczcV02C4SUUOnzdo3wjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 13:17:19 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Fri, 3 Oct 2025
 13:17:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-45-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-45-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 20/23] drm/xe: Don't check BIOS-disabled FlatCCS if
 primary GT is disabled
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Oct 2025 10:17:13 -0300
Message-ID: <175949743378.1952.4700588572035057209@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN0PR11MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 646f7fe0-fead-4691-be30-08de027f2dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L21hVHBab3lSSVRScFY5K2ZoK0piM1U3bisrNStNMnk1V2NWdkJqVzhSK0R1?=
 =?utf-8?B?U3lLQWNuV0hidTIvMUpJK2IyMU9YOWpyOStYUElvVStnQmJEZ1FMbThIV2xl?=
 =?utf-8?B?WjNmWlhTRkxSVHVJVUhqVVJ5WEQrSUh4ZEt6bmhad1piSEtIYzVBRlozekM0?=
 =?utf-8?B?UDJ2NGkxbmFOYkFvWFAza1JwdXNTd3B5MGtGVWN2NUc1cDJVWndXMDhGNmht?=
 =?utf-8?B?RUd3aEwyUGsxMTNaazF2ZzYzMktzYlJ2M2YyN3pSWWZXWUZjSzZ5T1NnREln?=
 =?utf-8?B?a3ZHUm9GeE9KREF4eUNZWkF4eXJuSkxsV2F6ZGZHdkZIZG5KR3ZGaC81NEdx?=
 =?utf-8?B?YmtSSGM3dWh4VUFSWVVRbFVCTXJLWnBGdDhXdHM3RzJ2cC9lOC9jNzBjbE1P?=
 =?utf-8?B?eVBVOTVRVDEwY1BXUXVDQW9lQXIza0wrZW4wQk9FY3pVaVZnTWFGT0pHQnVB?=
 =?utf-8?B?VWxoTzB4U1Y3cVBNTW1HRnMvWEdManNhSmowSGYzMisxOEtoT21LNkU2QnJP?=
 =?utf-8?B?OUp5NTd3aFF2OHRwNlR3QnVJYjRVS0JDck0rZFM1bDBSd3R2dXdWU09HQ2NO?=
 =?utf-8?B?dkxMSFJWMUo1TEUxWjNTaW5kT1dZNmx1U0t6U1M3MlowY1NZMUVCY2dnV2hS?=
 =?utf-8?B?azhFeit1RHZsbkppTXNESjdjejlJZzFLSW9UbXlVS1pKbmpUNTlZT3hPODBx?=
 =?utf-8?B?RTUyTnQ3MmhsMXdkS09Fcjk1OGpURWpNRSs1WXo3Z3Urc0FCb1RCZUxJbFhS?=
 =?utf-8?B?cFRySUxGMCtZQ1FBNEdNYVJvMTFvaiszL2xoNm1MWTNTamxOYUh2MWNGZlEr?=
 =?utf-8?B?UUxzZStzRWJkYnk0RTRUcDdFa2EveEMrN0FOMkdPWFVNempWZU4wOWM5Q0xW?=
 =?utf-8?B?elBBdmVZeWs3clMrL0p5eFVxckh4SENubFROdi8zR0ZMRWErQWltM2pnSmhs?=
 =?utf-8?B?U0ZZUFYwWk03b0xpZWw3cFVsVTZwVHJvRnhGWkxZYzZaYUY3bHhjVS9Kd0V6?=
 =?utf-8?B?eXpseGN5Vk5aN3E0b2FmL0hYWFlqa0tVUEQ0d2hQVjllY2dpOEIxQnhvTk1Q?=
 =?utf-8?B?czZCcHVTTTFicm1VNEpjUGM2b05DZXVxem0xRkgyYkNwbi9DUGJYYVN5QTR5?=
 =?utf-8?B?MklZeTdwM2RIS0RCb2N5QWkrZ2M4eEIxZHMxTkR6NEduNmdlRU9MRmo2Q05R?=
 =?utf-8?B?Zk9WNUVwcTAvU29rNHRTRGdHMTgwWjRqVVhTRCs0VjUrVFNEMU1GeEFBNm1a?=
 =?utf-8?B?TXd0Rjk1dDNmNWhjS1pUbmZ2bmIwMlN3bkYyS2F3VmdVUGJjRXkrR2Foa0hK?=
 =?utf-8?B?cDJGOTd1MFIxbkdwMVBJNHdZSmpsTVoyalREVkFsK2J3TGtJVFUwVFowQ3hr?=
 =?utf-8?B?T0NUbEF2d1JEbWt6VGFiT1VINUJ6ZzJJWGFUOU1YaW1DS2p0MWdGMnNqaDNz?=
 =?utf-8?B?NDNGWTdjQmZoTUJuRHB2a20zQ0NRS2RncHFQdmduVms3K09YeWVSR2JHM3Fa?=
 =?utf-8?B?N1ZHMHEzb3pxNXVjZExTbzVuSHlsUFlGZUlSVFNUczh5NSthMTByVmRIY3Vs?=
 =?utf-8?B?NUdxY3NjUjdFRENqTi81Y1lLVjlZcUN0NXFjanlodUhOandhUW5MaUkzTlFW?=
 =?utf-8?B?MlJGZk1Dd0NlSlpYVStaajRTYTU2Z3pBWmFPU3l0N0IzUzdIV291S1dGRHU0?=
 =?utf-8?B?V29TRWpKNjNlb1ZML0xzMHZXOXRLckRMUW5ZbFowNlVoa2NwM0dRZ0tlMVlt?=
 =?utf-8?B?dXd4RmxWS2FpMDBCeFpHQXJsTERkY0N3amp4WHJMcmxVZ3Q2VFpXanZpTU1l?=
 =?utf-8?B?NVNJOVZ3UUNVSFlhTEZ4VEJSdlVJc1l0MUszcXFnQmoxN0NOUWY2dGtqMitN?=
 =?utf-8?B?MkZpZCtHdVovckJYblpPU0pibi83ZTd4ejlhQ0kyQkVxcnlFS3VGTHV0WXhv?=
 =?utf-8?Q?vBgCGzMjEu/4pnpTr4J/DNyG22C9fHId?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmZGaGg2bUdlTm9BcHVYQVVkbnd1bnpwQW9yN2J2cUNwZGY2NXFYcnh5OE1u?=
 =?utf-8?B?cnVFM0lodWtVcTZqU1hKYWU4UkRMYVRoQXUxcHZ3dmFkWkZvV2lzUU16aDBI?=
 =?utf-8?B?enpnMDk5RG80bzJuY2ZMSEJoVFFkRk9QTzlFK1JvY0dtSENtdU80Wjloa21H?=
 =?utf-8?B?S0FmQldjNzJ0eldKeHVBMEF3d1NlQkVuZGJCZlV2ZUtLb3JHY1dLSDBmUU0z?=
 =?utf-8?B?Mmd6ZUthdFZwV1g1Q1R0V0tHL3dWZUhLSkIzMTJRR3kyL01uT2hMbWJxK2t5?=
 =?utf-8?B?YUk0U1NuL1FiRXBWR3pBVHZXbkdsVHVOdEJyK3FkUWsxaStTZ0F1dmtENXZB?=
 =?utf-8?B?U0lteHhGb1RxbDhJN3VZQ3RWcEVGME5lazFvY3JZWkhVeCs1L2J1RTdBWDUw?=
 =?utf-8?B?VlE3OWV4ZUFtL1VxWC9VSmZReUZ4bWo5Qkx1cWYwTUt4d1lwUHNQN1I1N0hT?=
 =?utf-8?B?bnpSZGpkWktQWEFhazhtWXJ6blBXY01TSUlYWkczT1h1cjltSEloVFZYQisx?=
 =?utf-8?B?ZmhHZ1d5cEtCeFNFMURIWEF2Wk12TTJDeHVvQ29ha2hDNnNOZTArNXFwZ0VP?=
 =?utf-8?B?UFhydnNiVXRKMEZhVXByNlZ3ZUxUMVgxaGx3dmNpa3lGeGhoOGJtL2NNWXc5?=
 =?utf-8?B?N214Ym9iNGc1N0I2M2dsVjNGdmh0WUV1ZGRFUk0wTjV0NUJnUzM2WjY2Ri9G?=
 =?utf-8?B?SEJJb2NFV0tTbVBoYmUxOW1XYk9KTytEeDZYYUJYanR0QktyT3NWOFVyZ0NT?=
 =?utf-8?B?elM5L0NZQmdIdW90QkRXWWNYa0w1Mm9lWkpMUUtERlk5RXB1K25XUVFrNWll?=
 =?utf-8?B?L3U3Sk5UcmRZZ3B0cjVJbDE0NmJSQVBHbXppS0F0TnZhd3RUS0hkUkROemV3?=
 =?utf-8?B?TDUrbFdrSVhBL2FuS1RsNXBiMVYrT3J6R1VhVnQ2b29YQjRNOHpJVFM2V1Nv?=
 =?utf-8?B?dDhldU5tVmR6WEI4VFIyNXpLUjRodzFDclpPWFBaT245UVFTTndva0pxVDZi?=
 =?utf-8?B?Sjd5Z0t1VjIxNS81U2RNYy82U1lXYmY1TEszS0VrdTNXa2tOVU4yWUsvKy82?=
 =?utf-8?B?bVAwTlBEU0lBZ0VDUDg3OU51Ujl3ZG44RzZHUm1xZWZ0U1A1TVhROWhFdDMz?=
 =?utf-8?B?WW43TnViQlpLa0FRWUZGbWxBMk1KSDVmcnIvT1JXRHVLaDc2Ni9ubnJCRldi?=
 =?utf-8?B?OVlZNWQ5VkRuNG83dXh1blpWbjlWOTlVejkrZ1Y4K0dIUGlUNUl4NjQ1TXFF?=
 =?utf-8?B?QXM2K2ZaWUJHVm5oY041Nk1IeXhsTW5ZbGtQMU1HMXdCTi9rRk4rTjlLTzZo?=
 =?utf-8?B?NWk2NjFjdUlMSlNxQndMcUtoVXNxU2M3UFNTeXBtRzhkRlN1anFBbHE1V2FS?=
 =?utf-8?B?OFVYOHBpMDVNLzRTZ25tQStZRDgxWmlkRU9uNEdKeDk3K3ByU1VWOWo3SW9x?=
 =?utf-8?B?bktlTHN5T3MzSmMvVzdDT1E4U0VMcDJMV1EwRWFKMHJaRnJmMzlXWHllWXV6?=
 =?utf-8?B?S3p6NmRJNE40eWlScUhJdjJqZWlKU01HNHhGUTZYMVlJdjhVaXJtWG40ZG9S?=
 =?utf-8?B?bzMwQStaRnRsTTV4QmIydjM5Rnd2dE1UalpHY1ZXaEltNHhCRC92V08vOG9l?=
 =?utf-8?B?UTlmYzdudGxONDJsOTRMUzNYSEFKck9BdXMxRldRbGJnY1FzalBKeXJGNDdu?=
 =?utf-8?B?akJaMmx5QTNwSS9CZms3bVAwYUJWaTEwMmhBZC82UzRJVHNmVC9KVnlOUU1k?=
 =?utf-8?B?eUlDakNoTmhZSlo3b2JSY1RzcVVzejNSVnBPbUlaQnJEMVpLTkgwdmhIUzl5?=
 =?utf-8?B?SlZaNmtUdXRRckFyTEUzVndpRjVHVVRyQVFGenRmbFR4TW9WeXNhU1IxQkJk?=
 =?utf-8?B?ckx6eUhEbWM1NXIwMmlNaUxkYUk5MzR2ck96T2hGSGh5VHQrUFVvYXNwaFRo?=
 =?utf-8?B?dk0wbG5id3RDRWV2MFdONzRJWjRLc1d0Sm5EUngyWTc0d1lTNmRWRmpBT3Mr?=
 =?utf-8?B?ek0xcXl3TlMyWkRveDVYRnhadHFkbVlOLzF6dWhEV2hVS0Q0K3VXM0lIczFF?=
 =?utf-8?B?NDFncXBSWmxNcm1Rb0VVclNFeWY2WW9LMVBEeFcrVmRYRk5ERVVuckpsU2VU?=
 =?utf-8?B?UmY2ZldaSE9JSFZiMDgrNXFGQkhiMnhMT3RzNHgxamtWVndERmFHWlNrRjJC?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 646f7fe0-fead-4691-be30-08de027f2dd9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 13:17:18.8206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAX2yO9aBfZlOWkTFUaBCaCRmrJ4n6ObdoRpf4FAjWGmaAHlUYzrnUH0C5R/RpLmG9u+1wUbwvQIo+Rl7aGzdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6278
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

Quoting Matt Roper (2025-09-30 19:56:37-03:00)
>If the primary is GT is disabled via configfs, we can't read the GT
>registers that would tell us whether the BIOS has disabled FlatCCS on a
>platform that would otherwise have it; we'll just proceed as if the
>FlatCCS is still enabled.  This is similar to the situation seen by
>SRIOV VFs and doesn't cause any functional problems since the hardware
>will simply drop writes to the CCS region and reads will always come
>back as 0 (indicating uncompressed data).  We'll simply miss out on the
>chance to avoid some unnecessary overhead during BO creation and
>migration.

It appears that media also has this register, right? I wonder if we
could have a function that returns any available gt for this type of
case.

That said, the patch itsel looks right to me, so

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device=
.c
>index d42d03b8ab3a..82921d72ebfa 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -782,6 +782,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>                 return 0;
>=20
>         gt =3D xe_root_mmio_gt(xe);
>+        if (!gt)
>+                return 0;
>=20
>         fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>         if (!fw_ref)
>--=20
>2.51.0
>
