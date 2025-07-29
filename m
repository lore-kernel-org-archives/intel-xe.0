Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0F3C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 08:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A24610E1D2;
	Tue, 29 Jul 2025 08:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pwl/nbcz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10D010E1D2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753776616; x=1785312616;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6qJo/nC4ErdSuIntLqa5OLzqfPZ6u1BNl6O+dTupoOY=;
 b=Pwl/nbczl24N1qlACb/tjyEY8W+ucbgH3wh4Uk6JbjNuEBKowThMnCS1
 rd2FJ8Q70SMRwLOE6H+WaYIyk8F4M7bVpwXMtrzbj8btcLmLgdLoLOdwS
 kE+q3mlX5iqGEpg9D3I5Q2xZke3cQyFz+oTh06P49hnQXr13dk2zFTgAr
 gHYYudKYtNHqMnSqBkvvZcKMhcoI0DH9968xmeH/wdyYVOU3XM/0lrp9m
 OCkC8viiweTWsgKXZPLKMSNE8PUar5GDTKI5kxxtuWKuSgmFO+JAdln7r
 48sJbauFE/iCeREJoqCX7OPDTptckj+qAvLgrObmUA/pkJkeCNWUcL0NT w==;
X-CSE-ConnectionGUID: S2OPPDglQq6re1AYIi1iZw==
X-CSE-MsgGUID: kf/+oWGGSUy7kn0l4dnUpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55920544"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55920544"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 01:10:15 -0700
X-CSE-ConnectionGUID: yfBk5hNFRsKD7J0uyHEjhw==
X-CSE-MsgGUID: 1mNb8UnmTLeuM6IGweifKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162510905"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 01:10:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 01:10:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 01:10:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 01:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHi/Su3psamectGBERUeA26INsEk2tQxq6DTKt76oEfSs8f6Tq+OMfKuEY+attHyjbVnsVstB2Pw59bqrF4sywqBV3knvgsRMdUGZEFHJ7HEXNt1eI5k86Rxrl6gEhoSMrULa0rFwzuvYv9idzVCKbbb7+BfEkHEiJWudRz+I1sBr1amIHp2DXbOcH996uPpLyOm1OK47IzxrWqtpBPLD8NlUFP88DdW17ARrjHMbiPeZg6LN788AWQ9gQgn0sPhduUV7DQcPsgN5E2WaD8jVWGqvSx/JZBIAVAvkEhQDRO18L9ojthMKFUmByGyRWRUmzwvFjH5XpF4SWJC2M2YDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEKzcQ31wjjwAzHiPveAfWjcC3XpygwDEWzgzcEq3WY=;
 b=T02bGvONNr491Yy/c+2tyonLqGNkXGiF/WtALOwhz77HPjglDnsnH5wAbG41UU1QgoFMgPicpkDVKh0AICj75z1eBuPqSsHX4xR/tl2fJ5ZhpJaGbld7SS5tx0UGN/Wsfk/6oh9ZFh4C5BYNpGW4HDQpoIIyke6RjYZsldwZKD6l9c2PEXrfpC7vEflqVRvM91gZVcvRgObKZHv0AxRLi1xhUOKdakII2WPCWPUkRfKt7n1TilnLCRIMe38XLBh6D9+R4Jz/9jYqAwYL9DPlFieuuNOZDkYEHaUEXEKZmp4xjDNQCOqdMj9uYB+JxrwFQYUZmPvh+6msm2Sj02Sy0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20)
 by MN0PR11MB5986.namprd11.prod.outlook.com (2603:10b6:208:371::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 08:09:24 +0000
Received: from MW4PR11MB6981.namprd11.prod.outlook.com
 ([fe80::de2:52c9:1981:e39e]) by MW4PR11MB6981.namprd11.prod.outlook.com
 ([fe80::de2:52c9:1981:e39e%3]) with mapi id 15.20.8964.024; Tue, 29 Jul 2025
 08:09:24 +0000
Date: Tue, 29 Jul 2025 13:39:18 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Message-ID: <aIiBrqrmcs8eXB2-@bvivekan-mob1>
References: <20250728084751.4057124-1-balasubramani.vivekanandan@intel.com>
 <8ca6af6970ef166f66b6786f55156af876133ddd.camel@intel.com>
 <aIfJAvs2OZ5oS2ce@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIfJAvs2OZ5oS2ce@intel.com>
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To MW4PR11MB6981.namprd11.prod.outlook.com
 (2603:10b6:303:229::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6981:EE_|MN0PR11MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3abdb4-6602-4990-5df3-08ddce773b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG8xaFJtbURxSU1URmtoY1BDZ3pIMFE0Y2dTT3ZZMzhzTVBheU02TWtNVGVx?=
 =?utf-8?B?eXJSMm1CTWl0aHpNRTJCc2JVeHNpM2xUSHZzMFlhSU9pWTNLMDdrYzlYbUhP?=
 =?utf-8?B?TVdDZjJtK1BBczEyZWI0RnVmSk9yVHpoU0ZnazZXbk53WVdoK0dnTTQxZFVB?=
 =?utf-8?B?V1JOOTNXeEptZHJBa3cvMWxMaUhLc3YxY2RMTkhjSTJzMEpLZXh6R3NIQzh3?=
 =?utf-8?B?WWpPdUFyTldjQ1c0RDhNdjFqdEZKbTA0bTF0OWhJWGtCZVZkcTEvOVBaVWhv?=
 =?utf-8?B?VjBiaXdIMlZ3S1BBdGhTaUs1WWk5YWhXYStIaUIrcnVrOGZhWXh6Q0J3amtm?=
 =?utf-8?B?OTdzNURNVmROUm05MUdycFZ0Z01Qc010U25PTmtmMG5KNWxFdUNNRy9pOEYw?=
 =?utf-8?B?Y2tVbnpmanlVLy9hVDUwS01Ncys4YzlUYTFRejN0cWViU1NrdFJNNUFhUmNj?=
 =?utf-8?B?TEpDTlNXZE9ZM3RoVDQzOStKd1NkTHVjMUc0d3NIUThxQ1psQjI2ZlRCOUxC?=
 =?utf-8?B?c2UweEo2ZURGbitaYnhDOVRHUGJDbnNpa25mZzhJREo0UllrTXpUNEM0V2ha?=
 =?utf-8?B?M0gzaHkyUGVUTWxrdUlDeEkzRXlWVWR6SjRLcGlSVnBHQ2UvSm5sREdkS0Y1?=
 =?utf-8?B?N01lWE9kWEszdUN0cHhXTTg4c1kvOFVJK20wUmZEbHpBVnJQOWRhSGU5STBB?=
 =?utf-8?B?R0VTUmVpRTgySThLQmxkemZnK1JzYkFhRDlxdEpkNTZabnhtNSt4YnREQ2VD?=
 =?utf-8?B?RDlCdk5INEd3L0tjTE9LQUw0SE0xdkV0TTR1UFk4Z0hUdkM4WEtwN2ZzeC9B?=
 =?utf-8?B?NC9TdHU0bWtKRnhTZjNwSEk0QXYxVVdkNlBNUDZncElySlgxWGNsbnhubTg0?=
 =?utf-8?B?Wi9TUkd6aVZoZnNrOHorNVFLNFg1ODNRcDIxOHJmdFVXYjVaODc1dFU0Z04v?=
 =?utf-8?B?UzZYcW9GaCt3Q291NndmVWdrcVpNUUR0bWNYSFZSMUlyKytkbzJqbnhFbk9w?=
 =?utf-8?B?bVdhYTRKSmZ4dnR3b3liL3ByZVlhTmRIY1FaOVduZTNQWEdQcXhTVDdjbCtZ?=
 =?utf-8?B?eE16UEJZMzdNQTZFcFpHTHZtOWNpRm9VMGxBZWVTUVVIUFVjZFVYK1M0K1pi?=
 =?utf-8?B?S1NILzlCMEkxdFN1eGxzd3FIZDdIb0grZWFjaVd1ZzkrcXlJbUNsRmdGRlRt?=
 =?utf-8?B?VDBZMEYxQnN0OWVLcFBZakZmVENZVTBvVXdXNER2TUsxYkR3OGQwdklERERa?=
 =?utf-8?B?K3doa0hRZDk5ZzlJVDY3Rm5pazljcDdRMDFGV2pXakt2NU80Y2RjZXU1ZVhY?=
 =?utf-8?B?L1dVT1FHQWlxUUMycWZVdktIUDJKd0VseW02UTl3MWtqV0xHdVIyOUdJMmUy?=
 =?utf-8?B?Ynl5OC9rWkZ6c2dYOG82MktBTktmUDh6R2ZvbDlHV2o2K3dtUmNyb2FRQno0?=
 =?utf-8?B?Z2JzcDQvaHlXUlQ4YVJIWjVjdGNNU1c5L09GVXdGVHVtVmxSSmdWQ3FxRjhC?=
 =?utf-8?B?aWdxdjcxaFVBcmRYYTEzdHZDMWd6RTE5UlJSWEU1dnlqVXZkZ1l6SndpM3B6?=
 =?utf-8?B?VTNiYUk3M1dXa1dJcjFJY1Btc09XS2VnMzBiZTltUkVUcHNWUHA4dFBYMzRl?=
 =?utf-8?B?KzVyQmNpb01NZFk5bVBoMkVCNXEzWmtldmNKcFdoSlFmTXdDOXkxWHBjY1pl?=
 =?utf-8?B?NTZncWsydmhhQWdkZUk3WjhyVTljbjFxeTFWQjJ3bnVzeWw1UzBlOXlMdW5O?=
 =?utf-8?B?aE01Qm9MVTdiZjEvaVBzL2kyNStqbll1VVA4OFF4cjhacXgwUkpzenJtYlhx?=
 =?utf-8?B?cmY5amNsU0pjMGlHRmVQcWpvNDA4VUZKb2s3ay9FWTRrdUNsMjhkaHp1Tzdp?=
 =?utf-8?B?QW1uK3pBKzVjTVIxS216ajliMDZFMkdjMCtRTHd3MEszczhENGo0cGV5Ymdh?=
 =?utf-8?Q?VSEpOS4Hi5M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXpPZVZEQ1A0bCs0eEd1NE5wVVZxemlVb3l0QlBvYURXbVQzdTFoWHcwMEpW?=
 =?utf-8?B?UlZHR0xFZUowQVFoUXIvSmtGaEcwcGRBeFg1SnNhRDZNcDgrTFcvM1VmcEpN?=
 =?utf-8?B?MGxXSlduOUpLOU9HaGllL0ZGV1UvQTU3SUJGUCtSTHZ6a3JTSXNzc3hvUmU2?=
 =?utf-8?B?R3JNK1c2NDluWlBGaDZxVXNSUUNJaE0vSEt6UEMySEdtSzgxcytjOWhwVnds?=
 =?utf-8?B?dlNhclQwSnNQcHdrb0R0M1JVY2NqeThEV1lhWHRkdHJWcHcyWFdWV3NRcHJY?=
 =?utf-8?B?RGowZ1lad0FBL1pObExEUi9nTXM2UE9NVkFvRWxmNEdRSUhzeFNhd3ZqVFVD?=
 =?utf-8?B?NDlXUGtnYzVnNHRpNVFxcmZvbkxFdW1wTVlDWE52TnJUNldzOC9LMzYxNlRi?=
 =?utf-8?B?a1JGYTU1eGZuTmRWRWVZZHJzUmV1SG1oWlk3Z1ZsSTQzVlgwb1NoQi9rcE5m?=
 =?utf-8?B?amhNbHVCUHMwSktCQTkyak1BSnV2WG94cWZOSXg2WnU5SXZ5OWZXNXF6Mjlx?=
 =?utf-8?B?bFl6enFhU1haUlBySmVBYlcveUd5WGpvYk9RQWZhWWlqMEVhWWpQZXBOTEt5?=
 =?utf-8?B?NWVEdDFyWmJ2Qm9vN0VmSTUzaDhCWVZNY2pMS3JzYm12WTg4TU5ONU54U3Fi?=
 =?utf-8?B?SGtDeTVNc3c0L1dwRDRpMXhqVm1CVzJYem42aDZ2dGdFd2RjOGJnSTYvWXJQ?=
 =?utf-8?B?eDZXR1NQT3JuZWtudGFmbmRmdC9qSTI4dkF5NzFDaXF6RlVtVWNuYzVLd1BG?=
 =?utf-8?B?MjVkRC9xd0xFbmg4cjJlMGpTUXNRUUF0ZVVyZ3kyV0pLNG9VdlNWeEpLVERP?=
 =?utf-8?B?ZFNhYmJyOG8xRC9UZmtLQXB2TVlZSWgwbW9oaTdPdUVZdmd0V05IekFldGtT?=
 =?utf-8?B?Zy8ydmxnZDJsM1l4N0txOXp3TGZTd1l2M1FtZHJHZGIxdVBVamppVXhVcmxl?=
 =?utf-8?B?NEc5R1NTd1BJUTFaRWZvOWJEdTJLOUY3NVkvMUJSZGgyOFpueVpubExUbW9v?=
 =?utf-8?B?RG5tMnV2cUlMcUNlaVAzaEd3SHczZWo1V3ROWlYzKy8xQjBmS29Kb3grTHZk?=
 =?utf-8?B?b1lDcXMxZXJkaXV6NEU5YWJnZzc4SmIyTjZySFpMZnV2SjA5OEovVjVaWXVV?=
 =?utf-8?B?dFUyT0VCdk55NnB2cFIvY3FrcHd3aTZVZXc1RVZONkRrSWVRZzJKeFoxbGIv?=
 =?utf-8?B?ZjdYbEY4RDFBZXVRWnR4U1paaXV5RXkzVjc3TEM5ejUzK3B3VWs4RFhrVHVT?=
 =?utf-8?B?MUFSNERSZVRuREo3dXpwbGdINHQ5bFBYWFI1WkZ5UzFDTjgxV1BMd29ITzNI?=
 =?utf-8?B?enVBdGsvVWkvYkI1aXkwTkMvTzJ3Q0dRME92aExrQWhDTnFQV0tsaXIyUmZl?=
 =?utf-8?B?N0RDL0pMRTZ3NmVyTFB0dXZ0eWJadXF0WHE2d1REYS9rcnl2Rk5tNTRKYjlY?=
 =?utf-8?B?ei96THVmaFEwK2xDNzZvWVNEKytYalQ2WjM3c2l3WTZzYVVXVmFsb2lSa21O?=
 =?utf-8?B?eHdHVVJMeGwzUVlaTmp3YlZnbDl2bFdFQ2k4dU1jdmNzZkdjL2svWmpsZmVT?=
 =?utf-8?B?SUZBd09LRVVjZk5QTmNqOUw1QjFENjE5ZFVkRDJsWnVPeklaQ1dOc245WUtH?=
 =?utf-8?B?ek0zYWY3RzlpVmtneXFJQ1Z0WUVQV1RkL2NSNzJ4YVRYeGFDeVRTYmx4b05v?=
 =?utf-8?B?dXRIaEpOVjBXdjVaeWlFU1NldGwvNnZRa0FFZG5FWG1RREs5MldCaEFJazhT?=
 =?utf-8?B?R0tHY2xxcno0d0pGNnNLT3M0M0Q3NDNyWWs4QjkwVE5CTEFJY25JWUFVdTFq?=
 =?utf-8?B?VjdNQXZEWmUzSUtzM1JFK2JKTy9MU0sxZVU1OXltcTFrKzhobzR5ZEx6TGFG?=
 =?utf-8?B?WWpUa1ZzcHlhNTB0RDErK05VSDRaWTFJMGN5Nkhma3VqZEEwejRBS2JwTS9t?=
 =?utf-8?B?ekl0elVRWjNVaUpTZnIzWjlqdkFweWM5d0FYV2dQODBWbnQxMUlwZFhnSnEz?=
 =?utf-8?B?QkxDSXozTytmeTNpTWFhcGVYSjA2amxaRmUyY1UvVUdHNWJ1dFY2bDIxRlR1?=
 =?utf-8?B?S09UZUE1UU1SK3NkRFBreXhoTTRabTNXSmZnK1ZxdDZPaTQvQ0dvVDBpMkkz?=
 =?utf-8?B?akZVczIreFZSM0o1R0FKbFhlZ2dDd2FXWHpQbE1INkx4V0JXS1Z2N29WOEhy?=
 =?utf-8?Q?7gnl0JRasry58MVVqmYp5gA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3abdb4-6602-4990-5df3-08ddce773b06
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 08:09:24.6295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rDbyH9C+3Hdd8ELRQedt4stkwQnIuBvbixeKZBsQrogyepiXJms+E1fo3Odx+4qEpQ7xy0pq9JBQ3NQfXGoHgfFMmY0HZhY70mAqaL2iT0DW4IF/VeWBxZWiDoxbvVT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5986
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

On 28.07.2025 15:01, Rodrigo Vivi wrote:
> On Mon, Jul 28, 2025 at 01:56:07PM -0400, Summers, Stuart wrote:
> > On Mon, 2025-07-28 at 14:17 +0530, Balasubramani Vivekanandan wrote:
> > > Doing devcoredump initializing before GT though look harmless, it
> > > leads
> > > to problem during driver unbind. Because of this order, GT/Engine
> > > release functions will be called before xe devcoredump release
> > > function
> > > (xe_driver_devcoredump_fini) leading to the following kernel crash[1]
> > > because the devcoredump functions might still use GT/Engine
> > > datastructures after those are freed.
> > > 
> > > The following crash is observed while running the IGT
> > > xe_wedged@wedged-at-any-timeout. The test forces a wedged state by
> > > submitting a worload which hangs. Then does a unbind/rebind of the
> > > driver to recover from the wedged state.
> > > The hanged worload leads to a devcoredump. The following crash is
> > > noticed when the devcoredump capture races with the driver unbind.
> > > During driver unbind, the release function hw_engine_fini() will be
> > > called which assigns NULL to hwe->gt. But the same data structure is
> > > accessed during the coredump capture in the function
> > > xe_engine_snapshot_print by reading snapshot->hwe->gt.
> > > 
> > > With this patch, we make sure the devcoredump is stopped before
> > > deinitializing the core driver functions.
> > > 
> > > [1]:
> > > BUG: kernel NULL pointer dereference, address: 0000000000000000
> > > Workqueue: events_unbound xe_devcoredump_deferred_snap_work [xe]
> > > RIP: 0010:xe_engine_snapshot_print+0x47/0x420 [xe]
> > > Call Trace:
> > >  <TASK>
> > >  ? drm_printf+0x64/0x90
> > >  __xe_devcoredump_read+0x23f/0x2d0 [xe]
> > >  ? __pfx___drm_printfn_coredump+0x10/0x10
> > >  ? __pfx___drm_puts_coredump+0x10/0x10
> > >  xe_devcoredump_deferred_snap_work+0x17a/0x190 [xe]
> > >  process_one_work+0x22e/0x6f0
> > >  worker_thread+0x1e8/0x3d0
> > >  ? __pfx_worker_thread+0x10/0x10
> > >  kthread+0x11f/0x250
> > >  ? __pfx_kthread+0x10/0x10
> > >  ret_from_fork+0x47/0x70
> > >  ? __pfx_kthread+0x10/0x10
> > >  ret_from_fork_asm+0x1a/0x30
> > > 
> > > v2: Detailed commit description (Rodrigo)
> 
> Thanks for that, now I could see the path, but now I agree with
> Stuart below...
> 
> > > 
> > > Fixes: 4209d635a823 ("drm/xe: Remove devcoredump during driver
> > > release")
> > > Signed-off-by: Balasubramani Vivekanandan
> > > <balasubramani.vivekanandan@intel.com>
> > 
> > So I can see how this fixes the problem from your description and
> > looking over the code. I thought generally though we were trying to
> > decouple the devcoredump from the underlying structures.
> > xe_engine_snapshot_print() is grabbing a lot of information from the GT
> > at the time of the print rather than purely as a snapshot which doesn't
> > seem right to me - we should be taking the snapshot at the time of the
> > error and the print should just be relaying that info.
> > 
> > So not that your change is bad, but I think it masks a problem we have
> > in the implementation of that engine print. If we call
> > xe_guc_capture_get_reg_desc_list() at the time of failure rather than
> > from the print itself, do we still see the same problem?
> 
> Indeed the real fix is to entirely decouple the capture from the read.
> capture should be done at the snapshot time.
> Read should not depend on the gt. Although this might not be the only
> case and we probably need some quick fix for now.
> 
> Perhaps we go with this patch, but mark as a FIXME comment and ensure
> we have a gitlab/issue + VLK opened for this work...

I have created a VLK to track the requested change. I didn't have
permission to create a gitlab issue. I have applied for access.

I believe we should have this patch to fix the order of
initialization/release of the devcoredump. Looking for r-b if there are
no other comments.

Regards,
Bala

> 
> > 
> > Thanks,
> > Stuart
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c
> > > index d04a0ae018e6..ae48cd3c7bf0 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -821,10 +821,6 @@ int xe_device_probe(struct xe_device *xe)
> > >                         return err;
> > >         }
> > >  
> > > -       err = xe_devcoredump_init(xe);
> > > -       if (err)
> > > -               return err;
> > > -
> > >         /*
> > >          * From here on, if a step fails, make sure a Driver-FLR is
> > > triggereed
> > >          */
> > > @@ -889,6 +885,10 @@ int xe_device_probe(struct xe_device *xe)
> > >             XE_WA(xe->tiles->media_gt, 15015404425_disable))
> > >                 XE_DEVICE_WA_DISABLE(xe, 15015404425);
> > >  
> > > +       err = xe_devcoredump_init(xe);
> > > +       if (err)
> > > +               return err;
> > > +
> > >         xe_nvm_init(xe);
> > >  
> > >         err = xe_heci_gsc_init(xe);
> > 
