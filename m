Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA779CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 11:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0DE10E79F;
	Wed, 29 Oct 2025 11:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7BMCl+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B945110E79F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761735658; x=1793271658;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TYtGTr/EocizxArl7eqHx1Yk/e+A8k87g/Kjo88jFDQ=;
 b=A7BMCl+vIAupM2VLbDZlRay1UT3tsLb0dic7MI/mcmwvwV0bGIxGvvgX
 4JuGRW/SqakWK4ZShtp3lzX0JqBtUcDfkoRgPOFZ5dbkG3u3T8/wjZckI
 B1EeFnSwpMf9ZTItAQJmGRzusuyhfRnOq6vfRMReU5Y/P87RVg2MRjiSf
 nq+jKoFN3YhASateaVy0Xp4AnBwMArMYluw77feJnvywAhcPs2CVvOTpe
 ujiJWs7j11VtLkIhqDk7piusvCoSvPxeHeaureuC9jJkoztZLw/vI5YFa
 nqzUyX2RCUoMeQNskKdMS0HbMWG6hVRMemrht7W/rqXyPLercHPVlIcDA A==;
X-CSE-ConnectionGUID: BFAhNdAyQ+yPUx0m2QqY+w==
X-CSE-MsgGUID: Kt6WfUe6QhqsfewT1HCu9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63782440"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63782440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:00:56 -0700
X-CSE-ConnectionGUID: eXYQOixaRzSnD2354niL3A==
X-CSE-MsgGUID: +HeuAGF4QdKR6iZo48Jq0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="222838981"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:00:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 04:00:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 04:00:54 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 04:00:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi9NSnBFxW84OuMnBSY1K65rUMdPaC07VU4Za6kHHfZEdrLIT5Qvnl6rk2iiq5MnFIOFgIkAJsoQk7thASqOZlHu/tGsJuQ/JbA72vZCQ2RlGhYaKhN7zeGwRRxKUiFmXQPGUimFk3orWK28LbnpKh6UoG6PBNdg5Rr+hZgD+RZh2Q/ttM5QIebCrjhGW4U06RptQIZknHukJIp1N5QqEaUugY52n956Bj6VZ69WDfmXMAP4VWeqH8Rc3gxjrMfbhoEC4SaXjuRorrPi9ea7xsV7YA/mJeAcYl2dxjxuAKeo53j+VIBez/dxBA1Emb3WMIZPOwPrfqzDyoi3yLy9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fi+NipQa0ZstGQrF8dZBPZSaWFjUPU+OXOBR7whxE0Q=;
 b=CsKCgiOJBSSdaWJEU74GUqntyXAZN6HyGyxtW6S2ZRyAeB1qP4/eVc1fFSjuCK/VUGXT9UlcaOl88DJTdv7olpcMVLzgbUfPgNezqT2Y88AuVY5dODVFGqIFIWcxeKbA7L8GUAUSR58sELK78uYrG95h+YmxFjD7xSYIfqhD1Yw0pCAVskHQiuB4f/pczUus/I2qNwdCSbcg1/tKE5iagCQNXakMT5Lu2VVis1cmw1SR+EDjRdW6rfsll2IH+MRjUFWcSANq4xupPhybTLZusQykBAZH66UVm9iNX+OUfJiOxyK8f5ZI+YnD9sWegjqFo3M1RsS70PeqqyCokhW1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB8135.namprd11.prod.outlook.com (2603:10b6:8:155::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 11:00:47 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 11:00:47 +0000
Date: Wed, 29 Oct 2025 12:00:44 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 04/17] drm/xe/pf: Add _locked variants of the VF PT
 config functions
Message-ID: <20251029110044.epmrvxfw2sh2bjwd@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU6P191CA0054.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::21) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 640e472d-1ad0-48eb-e10b-08de16da6a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L054YWFqS0xtRUhqKzAvMWFhR3RxcU5PTDNSYUU4ckw2L2JhMHJmcUlPVjZk?=
 =?utf-8?B?M1p1V3REVlpWZ2NMSnUrNys0RTA2Z2FjaHR5bHNNQXlQOEVlRlVlSTBjSG01?=
 =?utf-8?B?dVZPeGtrUU5pVVRqK1JEQ2lRUHNjVkpsdWNsNTFnTGZacTdadFJDNnk1V3Zn?=
 =?utf-8?B?T242eHV3YUlVQVhDZUhaOTlyQkRvSjkzaWppM1JRODRZWVdMSFc5V2FwK1lJ?=
 =?utf-8?B?K0VZR1EzNXExZE1aZUg4SFkrY1ZST0czWHpIR1ZyRXFTSy9UOSt3am1RLzB6?=
 =?utf-8?B?aEFJVmZvSERhVFVxNTNzcGpUTXlIYWdrRHZHZGRhSi9oUVNSQll0UDJkM1RN?=
 =?utf-8?B?aHdyRVpqbWs4RW9oSER3M2lzWFpOb3BwVWlwUk5zNVFCUjlUSnlYMHhrYlE0?=
 =?utf-8?B?UUtJcXI2RExjNmxOVHFSVWUxN3pVdEhBZzhQcisvUlRDQm5yeFFUaFdNTEM1?=
 =?utf-8?B?TmpRUnJzTnZVZENUYVJxYVVOdVpZd2c3a2M5aFF5QnJ1UmkwamxoRGMvWDg4?=
 =?utf-8?B?UkxDcXRzamx0QkdCNUNoMWFVQ21zM1ZIWmE3cFlzL2s2ZVJ0MGdYblVmemxn?=
 =?utf-8?B?c1NtSzlLaHZ0aGxKS080VEpwREJJdjlHNkhOZU5CeXdGajJIZnJvZ2hkQ1g2?=
 =?utf-8?B?N2xLeDF4NDVNdytlOUQ2M0tkZXhBakp5aE1BV0Y3VUpxZGVYM0IxTEhqeWJ2?=
 =?utf-8?B?aUtjclpvdktManBLSlYxVTR5QzQ4V3hoVUExb29MK09iK2lWdjBiQUxoenlo?=
 =?utf-8?B?dC8rRHQ0L1A0R3gzMytCUG5Nd2kyKzNBc0RxVEdQQmxwL2Vjc2ZUellTT1RW?=
 =?utf-8?B?Z083ZWN5RHFTK2RxYml5TVk1WWZST0R2cytUb2hobnEvQWtmTjFmZmg1Vkd6?=
 =?utf-8?B?QW9WNnBQZXV2SXBNMnJoNWNxajVXUjRtVTFDRGMyN2tLcnp5a1hidUsreU5u?=
 =?utf-8?B?TW9zeG9VRFlnWXExV0lTMHVLNWNDbXQxSGlkbUFiNWJRNjA1U3hxbnRGZzUz?=
 =?utf-8?B?NElZVDl4TGZNK2IvSTd4ZGV3OUlGNzJCbWR6K2NIUHpHQUxKWXdXUG9rb1Ri?=
 =?utf-8?B?V0NaQk9SZmh1ZWwwQ1NJUUtieDRGT0FyZDZad3lOQngrVGlVVFlEWTVpdVZN?=
 =?utf-8?B?dUVHUTgvMmp5aHhkMUxJYTFYN2hta1N5WS9PTFpQaCtMS01xdG40bkJWVFVK?=
 =?utf-8?B?S3BrdnhMTzNRdk1raFVtNFpnMldZS0ljbzZ2alBxUnF3NzFybXlaM0plaS84?=
 =?utf-8?B?Sk5OLzRyVW9oQWphUG1GRGdkTUNoNlpGTUdxUHRYenhnN1FOM2RkYWFGbEwr?=
 =?utf-8?B?Nk1qSEM4WUpqUmFsWEpqbzdzZzUxOHg4dXBUS2grYXFMNDg5M2JwUk9pd2Vz?=
 =?utf-8?B?cDlzS3g1OWhnTkRsRWk1ZnNrTzZmeDM3TWZkWDZ5d1FzSFNVQzhkYVVDUm0v?=
 =?utf-8?B?ZFB0NGdYQmtadXowUDlJUlpOVk5ueFBmZjJNM2xRTEhjeDkwcTBoQkIrTzZN?=
 =?utf-8?B?ejhyNWtUTGZmcnZ2K0g2SGZuRWpOMlB4cjRacml2dlpYbVYyUmhBRkYvY3N1?=
 =?utf-8?B?RWRLcmFTdWxKK2dyTGZQQnUxQm1wempodGd5VnNwZU1pMEJmNG43RHVaNTNh?=
 =?utf-8?B?eXVOSnNGcUxIOEZHKzJSU3YyNkhjNmorS0FkeFBIU005eVZxbGluMlFNOXZ4?=
 =?utf-8?B?cmpyZTZQOGIwMzI0R3FqVmh2clVDaFVSZ25uWXp0QXJsNUhWSVA4VFVsUS9r?=
 =?utf-8?B?Z3dmeWtLNjFWWHUxc1pzTjNrems0UEJjT3F3UkY3Q0VnRmpDWndQWnpFVEt2?=
 =?utf-8?B?dnJQT29rNFF1d2pVWVN2UlhGQ1o0S2d6L3lCTC8rK25TR1BYQWxjQVNzeWFJ?=
 =?utf-8?B?LytsN3BlNFI2azdscmtYVE9MNU1oMlMrYzN5NW9ra05mVlJrOTQ3ZmdMcG02?=
 =?utf-8?Q?zAzqaKGlNejHxAFrh/m00G71zU97tOaM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm5QakdYWk9MTzA5U2lzSFBZVXJ6Q0VmbFUxYzBIcW90T0cxY2pSTDIzemFM?=
 =?utf-8?B?a1Rkc05EaFdVWXRoQWNhNjgyM0pSVGx1QmhITnZNM2FYWi9nYkNQc1lBQmFy?=
 =?utf-8?B?ZmVCU3dSeWpYZ3BrcVJ2RUdGaVRwL3kyQ2hSUkswUzdpSEIzNjQvVklZekxB?=
 =?utf-8?B?MXY3aXUwT0JXUm9MQ0hnTkwzTW8wK0ZGajRxZkZzN2pJblJIK2lEQmQwS0xx?=
 =?utf-8?B?VDBiZm4zZGlHbEN3NE45WE5zRDA3WXFoc1hFL2xmeWFIbE1KZTk4dVlqeFRY?=
 =?utf-8?B?N1NOQ0tEZVNoSVJaQ1dpZ29SNHpPR3RlNnI2STdyUmw4VjJZSnF0TndZbSt6?=
 =?utf-8?B?MTVSUEM5ZkdKWENrNzEyV25kb3VFSHRCMm1pek9PTGt3eUxwL083RnJ6L01E?=
 =?utf-8?B?U0d3bnE1S1B0eHV0Tkl4OWVwWHkxYW5YT05OdnJBd2ZScytQd05XQjhVQm9v?=
 =?utf-8?B?dDRrL1kvZEVNVTlQdUNZeHZxRlRxWVQ3ZXdrNUpGWlhiazFySXUvdllWZ0tt?=
 =?utf-8?B?M0hzdVFKdE5nWkIyZTJqMEdKdkJKdm8vNkhYMTlIc05rSzZreEo3bmtuUW5F?=
 =?utf-8?B?R1pZZENlMEVLS0d0djNqNFYvR2h4RHVQWGxDblpabTV2eG11ZjdiK1VINXdk?=
 =?utf-8?B?eUl4MGNObTVCcmhNeitzMEg2WE80KzJiMmJGSHF6U0hibEpYcXVxZUI1YTJU?=
 =?utf-8?B?dmU0eTZNR2lLL0RvMnZNZzg4N1VLK3orZ0xOSXk4YTMvb0NGakZSZmpMbWJj?=
 =?utf-8?B?eldwVkVPTFEvN29pQnowRVpabDdTS1duOTVwYVBIb29XS0FjOEs3ck1oK3JU?=
 =?utf-8?B?anR1blExTTZWN3hZNlV0aTdjRU44Rld6aStRUGlwdEU4YndZb2Z2ZEUxZ3dk?=
 =?utf-8?B?c0h3eHZsNEJCSjRuUFNZc2tkaGU2MGp3K013UXdRM0ZXNG56ZWgzQUFqVjlX?=
 =?utf-8?B?K0lrVnBGbHpUL3VzRStLRU5NaHJzQkEvQzNndGk1YjlMNDdZQkhDWWZkYUU1?=
 =?utf-8?B?eFEydzg0VnNhOStsMEx3QzNZQVFDY2RjSCt3ZUU1VTlEUC94di9pOFpQdXFn?=
 =?utf-8?B?dnhvUXc3aTdVelJWOFJqTVoreVgxWXVvVVd1RCtKbWlGa0N1cVQxdUZzaDRw?=
 =?utf-8?B?NWlxWW1xRVdjRWgwQTVQNlVOVjc0cVAxS2hNbEVNYmU0TFdYTXpoejJrSlU0?=
 =?utf-8?B?TEptdkdLallmTm5scExpVnYvZXZvYnQzK0dxY3RoanB6QVJHRGtjN2FCKzJF?=
 =?utf-8?B?MkR1VStaVkQ1VWx3akE4dHp1M1F0WlFDam9kcS94d3BvY1hOR2MxSXZEVGZh?=
 =?utf-8?B?NkNnSmhQVWtXZyt5Z2hLaHhWYW9WMXEwS2w5elRWdEIxTjJNUVNiUllkck5J?=
 =?utf-8?B?RUdwZTVEd3Z4aGxwKzVqdXc2bVNXTFVoYmlmNGpjQmd4VmJCUXc0cEhyVVh6?=
 =?utf-8?B?Vll2V0hFVmdUTTk4SzFVUEVpamcvazhaWnY1YjlUUlZ3dEVMOXhzZTh1QmV3?=
 =?utf-8?B?OUt3MDMrcmVqbENFamx1a1UzU2I5MlJxNVM3aDhkSk9ZTXFOdm5wTlc5cUg1?=
 =?utf-8?B?dW9PMUUxYXVxL0tENStyL1NYZXFzYkNVcGxwT2UxS3JuRmxyUE9SS2xpY3d1?=
 =?utf-8?B?RktkeVpnS2VJQmdsRWVTRzVJbTA0elZHU0E0a283elJsd3IwMFpkdFNoZE5H?=
 =?utf-8?B?YjZKSk84UDlEcW1vUU9pWmdLSFVFalpEcEttZFNWMEtVb3Z3TmJic3owLzlv?=
 =?utf-8?B?MmZGU1FKdFpqWndMeE8wMW1UWkY5M0kwcTVVTnliblE0eGdOSkcrYVJ0L2w0?=
 =?utf-8?B?REl3WmdLVmRYQWZsZXlUTGwrSWttS2xHM3NGNkhXejU3NTFmTTNpdHVpWEt1?=
 =?utf-8?B?dXIraGxjanZkZmZ4YjhzQmZBUWI3TmVsU2E0NHF4WXJ0L1J6MyszVFBBZUtl?=
 =?utf-8?B?SGlFMDkwbXZ5dk5YU1B1N1NJTUk1ZjlUVnFMcnBtWXdPbTI2SzdON2MrQ2wz?=
 =?utf-8?B?dFhtWUIwbjVacG9mUjJJVGU5MkRTbDl3bXBxcTAySTRHRkc0KzNlSWdGS21a?=
 =?utf-8?B?aDBJeGErNG9Bem1IR24wUkdHVEhWeXZFdjBGWUdldzBMR2NQeVQ4SjkzaE9B?=
 =?utf-8?B?dU8rcjhoTWF4YWpCMTRjeldNdGlBSGNQMCtCWmJLWjhRK1Vmb2xoWVFnNEpQ?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640e472d-1ad0-48eb-e10b-08de16da6a17
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 11:00:47.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXTdt156QeFL9W65Neqqxw6XBUkvnCg11ptlBJt+TqkJah+wkwHf9xMCkH4ieLAgHYs1IgKR+uq+WSyY4FhR4o9xj+Bmej2Wp8ccBnm+Ehk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8135
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-paź-28 18:58:18 +0100]:
> In upcoming patches we will want to configure VF's preemption
> timeout (PT) on all GTs under single lock to avoid potential
> races due to parallel GT configuration attempts.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 59 +++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
>  2 files changed, 49 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 717f81e76b8c..e48457bd7d12 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1835,31 +1835,66 @@ static int pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
>  }
>  
>  /**
> - * xe_gt_sriov_pf_config_set_preempt_timeout - Configure preemption timeout for the VF.
> + * xe_gt_sriov_pf_config_set_preempt_timeout_locked() - Configure preemption timeout of the VF.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier
>   * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
>   *
> - * This function can only be called on PF.
> + * This function can only be called on PF with the master mutex hold.
> + * It will log the provisioned value or an error in case of the failure.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
> -					      u32 preempt_timeout)
> +int xe_gt_sriov_pf_config_set_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid,
> +						     u32 preempt_timeout)
>  {
>  	int err;
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
>  	err = pf_provision_preempt_timeout(gt, vfid, preempt_timeout);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	return pf_config_set_u32_done(gt, vfid, preempt_timeout,
> -				      xe_gt_sriov_pf_config_get_preempt_timeout(gt, vfid),
> +				      pf_get_preempt_timeout(gt, vfid),
>  				      "preemption timeout", preempt_timeout_unit, err);
>  }
>  
>  /**
> - * xe_gt_sriov_pf_config_get_preempt_timeout - Get VF's preemption timeout.
> + * xe_gt_sriov_pf_config_set_preempt_timeout() - Configure preemption timeout of the VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
> +					      u32 preempt_timeout)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_set_preempt_timeout_locked(gt, vfid, preempt_timeout);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_preempt_timeout_locked() - Get VF's preemption timeout.

NIT: I'm wondering, since you write in the return section that this also applies to PF,
and here you write about "VF's preemption...", maybe it would be worth using some universal
phrase:
at first I'm I thought of “function,” but without mentioning that this is about “PCI function,”
it might confuse things even more.
I don't know, I'm just mentioning it so that you might consider changing
"VF's” to something else.
But you can just as well ignore it

> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF with the master mutex hold.
> + *
> + * Return: VF's (or PF's) preemption timeout in microseconds.
> + */
> +u32 xe_gt_sriov_pf_config_get_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid)
> +{
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_get_preempt_timeout(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_preempt_timeout() - Get VF's preemption timeout.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier
>   *
> @@ -1869,13 +1904,9 @@ int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfi
>   */
>  u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
>  {
> -	u32 preempt_timeout;
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> -	preempt_timeout = pf_get_preempt_timeout(gt, vfid);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> -
> -	return preempt_timeout;
> +	return pf_get_preempt_timeout(gt, vfid);

NIT: I mentioned this in the review of previous patch:
     Perhaps it would have been better to be consistent and call it the locked version here.

>  }
>  
>  static const char *sched_priority_unit(u32 priority)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index b4beb5a97031..6bab5ad6c849 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -48,6 +48,10 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
>  int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>  					      u32 preempt_timeout);
>  
> +u32 xe_gt_sriov_pf_config_get_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_set_preempt_timeout_locked(struct xe_gt *gt, unsigned int vfid,
> +						     u32 preempt_timeout);
> +
>  u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
>  

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
