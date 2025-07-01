Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEE7C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 16:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B1010E2D5;
	Tue,  1 Jul 2025 16:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhBYRSt6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97DA10E2D5
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751387123; x=1782923123;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HB6DU5WjBNuifKDPivgiovzptUAUvXcow1hWGEW+vyQ=;
 b=FhBYRSt6nNHzkfI7FJvkoTXa9mnLJaj7w2eK00JMGUmDu/IY/3eZfjUf
 B0L8DQfcCnx7vTTKGhpDlpoLwxeVfnI0QjNTb9w19wo3NVTW3NOvU0+Zb
 m6BMwjv13rtbpfieyiPzQt3R2qWXMDqlqzEqF0t/kdR5EU54lA2cQl6nR
 Wq7YmtAZx5ApPbs78AMFhR0cAThCsimDnc3bP46B35qIHUJYKHEgut3kf
 TBnElAJWYWfPkG33sLGvxZVBQRPB20TPMvkDpJc2bn2y7c5dGkO1tyPBR
 wU+N6J3F7SYVJXSjZaJV6HdjvRSgMxagoIHvgxtCLh74WU2R/kA6ZvN1/ A==;
X-CSE-ConnectionGUID: TNRLgnTdTCSt2UHWzhjTsw==
X-CSE-MsgGUID: 0gz2n3BpRnSrqqPadK3CLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57341345"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57341345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:25:23 -0700
X-CSE-ConnectionGUID: QE2/FRxVS6W8I5iwHdmETg==
X-CSE-MsgGUID: AjBcg2FFSMydk8OJGIWnWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159329240"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:25:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:25:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 09:25:21 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:25:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Em27pTaz9xWnX0SxEhNpHAe8ZqyLNl2m6MCvLU3uLcNLoUzczYojurljdSm/Ttgj3gXg4RSQpuwTXJwAqmYXM2T+HMJBncQ1am1n1sAxJvaEa4xl8CPKN6qwdT1zJrQ6OvdIDunMvDpgk5Iu8L5JSsx6cCL8501fyKcSiq7tqSDqiD8juIzB7JSnjcl++6So2d6I0Od2aiwhUuiahCD/VoaRS7doFxnZf7MyChpAjM0d9xbbG/CaqwYvEVgwf5tZ2iVeecOjQF+7wpnVJx192escyosSueiJaugdb8IETGx4W0cV5FhqXKeIW+Kaw10A22mxJeBlb6Vyt+K9Y4/hLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CosBi4vuVqrpMJOg2xKB6YGs2bX1MyYq20nSbFzL3Y=;
 b=QkOgVd5FCMulbE4YyyzcsjU0YJpWZAQRTvyiEyVMvWrsQtBPZgvuKlGPwoVs+lxquUYgJFclY9YnJZ8OJrX98nfG/h/4zdHQVllc6HyvZOh65Wht+ZxcwtKWnaxWCtFK4eGyBhkR5Tm3GMiwSrXOkI6BKquHoSU1CWho5IUT0MS7Lp7tf/f3dZ2QvaBUQINSxYT//hYWZyMksBkBitbLVx39qWUeVRFJgJY97arGfB/QKwXthxb2iXO9ZdHmxXnUEXJaXX2n5EkdfPgtrDmNVAS0jWNJjUudQ6ln6yj0PV4FoWYnxel0VdvAR1LRPRPdXE6QORT8lLZukFzJpIApgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 16:24:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 16:24:49 +0000
Date: Tue, 1 Jul 2025 09:26:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Message-ID: <aGQMNIUsz7MQ7QuY@lstrano-desk.jf.intel.com>
References: <20250625095805.1390907-1-nitin.r.gote@intel.com>
 <aFwF53I_d8OkwI3_@intel.com>
 <IA3PR11MB89873DE9E3CF21838937618AD07AA@IA3PR11MB8987.namprd11.prod.outlook.com>
 <IA3PR11MB898706D0EC2F50C11BCE2F64D045A@IA3PR11MB8987.namprd11.prod.outlook.com>
 <SJ1PR11MB6204C011AD05706EF7CCFEDF8145A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <aF7bog/C/FNcdfDe@lstrano-desk.jf.intel.com>
 <aF7frlGMm0HSQN93@lstrano-desk.jf.intel.com>
 <SJ1PR11MB620485D4BADEF5AA5B2512C08141A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <IA3PR11MB8987F9CD567E25D8694F9BDFD041A@IA3PR11MB8987.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA3PR11MB8987F9CD567E25D8694F9BDFD041A@IA3PR11MB8987.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 669b5247-6ee7-403f-f407-08ddb8bbcbcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzdrNDBmbEN5UmVqeVI1cnEyVVIva3QreUJJbFhIbkFBNzFQTDZnMUpRODcw?=
 =?utf-8?B?SnM4SVlidmFqNSttWlA3NzhTMDAvUkVPWk45d2g3Z25IYi9nQlVCVlNkczUv?=
 =?utf-8?B?akY0bmhoTFNFN2YzbDJibGo2VDZCNHhiajlEVjU4UWFsdjA0SDNqU0dRVGtk?=
 =?utf-8?B?di9YTjRTUFVNY3RmWU9TMGxRNlpHaXF1SHlHN0ZVdXhkdHF2V0pJYllaQmhi?=
 =?utf-8?B?VHFNRGhjOVhkMnZUU1Q1ek0zaHYrZ3JVVm5oZzJWNTNzQ1dnVS9PWFFUVExS?=
 =?utf-8?B?L3lxYnNpYnI1RWg2OUFJODdERmZKdGowQ2VwZWIyL1BRVkZDQ2J1REZyWkhG?=
 =?utf-8?B?ek5yZjJRTUIyQW9pcWtHa0YxUG9ySUtiVHdISFZPWmxmdkhzQ29oTVM5d1Zq?=
 =?utf-8?B?MFVGb3dBM3NSN1JPSEYxZUM4d2lQMU1BTVF2b2pxVzRwZnhVeEMyZm9PWlpT?=
 =?utf-8?B?OFAzVUxMNFhNUFhuWjhpaXl5MEo2eTg5cy80c2VBcm9DejJvUmRYRUl4K25B?=
 =?utf-8?B?NjdqTjhNZ1hHVTNDdzJ0Yi9oSUNzeWU1T2FiYURFUDJiZjB0UXpKMGNsQlZK?=
 =?utf-8?B?NkU1M3pvQ3lEdWJod1QwVmZHZ1krNEd2TTVWRjJscDcxOThRSUdsemYyWGxF?=
 =?utf-8?B?bjZEWEFwRW95YVNQRVh5VUtiZENHZlpLci9wdzJwelgvVmtWSU5lK0Y0K1FS?=
 =?utf-8?B?TGFvcWYzV0ZkMXpYZEVzbjd6SlRGbkYyVUJHbm43Y25ocmNKQndnbzVkRFZa?=
 =?utf-8?B?ZlQ3TFVvdTVtSHRuMTJLZkc2S2VPVWRURFliYVZzYXBiRWJkSXVDNC81dktD?=
 =?utf-8?B?RERseC9PRHo1aGwxL3Z1SVJiTkx4eGdQcnNLWldWeGhPTVBNYXRVNjdBQnBM?=
 =?utf-8?B?TklpeWZ6REtqaU1oVkl2RDdtOTVrOElXTFA1MXNHUzQ1UjdVZ2Y3b092amdn?=
 =?utf-8?B?b1pkcG1uM2ZId0VTUnAxRjBlTEtNU21SWkdReDNvMVpBS2t4ZmQrNVRxbTMr?=
 =?utf-8?B?VVE1SUVuRmRFbFhLcHFuTHBqeUxXUVJUY2NZNFo2M0hmNkMrVDd3SlFWSVNo?=
 =?utf-8?B?d1IwRDU0TlRESC92ZzE1c1hKYWdOL2Y2N0ExYVovcStXb1AxZER2Q0xpeGV5?=
 =?utf-8?B?ejVrWXltQ0psVVpYVTJnUjUyMTVWd0lHaGZuSDlSUUQ1UGRqcFVuV2hBdXBN?=
 =?utf-8?B?SFZoVWVtdEpXZ2k4Z0w3cG9OdnhPdUFCQ2M2dkd1RWYza0pqWGQ2a1Q5NFdp?=
 =?utf-8?B?SXJvSnBlcENPQVpnZlpMMmNhbU1NVXQwYzN4bEZ5bzEvMWdnalNRbHZqa1Zs?=
 =?utf-8?B?VlJmVnBqeUhjMFRWb3dxT0FoazQ3dXdIY0xLTjRhNWJrUFA3TTdkRTE4UkZW?=
 =?utf-8?B?elE0V05hNlo3K2c3cHBnMGNOZXU2ZHMrb2w0K0RFVkJCcWlUeThaUi9MR2FZ?=
 =?utf-8?B?Z3I5bitiSndlN1VieDBISXFGalMwUGdVbUVxbXF2bVZ1TklwbVZsUGxjMHZn?=
 =?utf-8?B?SXBVVW55eWYwT1Q3Z284eDBuNlFacUpLL0lNSnlMdFM5ZFJtNE1yOW5IbTYw?=
 =?utf-8?B?TlFla0RyUVdqd3o3bXEzc2JTaEhFUlRtOUZpOHQ2YTlPb1RnNVBZbFdIb0RQ?=
 =?utf-8?B?MzROMjI1dm5rOVpVQU5CbHlKWGwrbU1UY2x1TGVFYTlhZVVHdERoYnlyUUlh?=
 =?utf-8?B?SFpnM0FacjVwbXZwM1RYYXQrT2ZzWUhreDlDZ0hFZksxcTFsbE4wb3VzdDZ6?=
 =?utf-8?B?cHRvL3FSK0pHeEdCNGFYVE9jazdaRHZjUGN2T3BUdkh4NzNxejVBUElOM0NT?=
 =?utf-8?B?ckk3dStMcklhZGVsRUZEWUlNNlVCSFY0WW5ZZFBWYjRFc1JkNGc3aVMwa001?=
 =?utf-8?B?NnFoZ3B3Y3AxRFJkOVRlYUN6OWxOZVhvY1hjOG1PWG9UTUszVjVxc3R0OVN2?=
 =?utf-8?Q?5FO8vm96rmE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzZHdzZ3WVBCZUxLcmMyZHN2WG5weXJQcEZpc2Z4em8xbEppWkF5MUxGbUpr?=
 =?utf-8?B?Z0ZWb0dYRHVBWmlxZGZZT0p6VHFtc2NWbUppTWp1S0Ntc3BXcFJBZjRlamF6?=
 =?utf-8?B?LzE5RWllT2U3SHZROENBa0dqRURwQjJrS2gwT1JKekJWemMvNUs1ZTU4UFBw?=
 =?utf-8?B?eEZmSW43WmZkYTNoc0QzZ1dneklBcmZxRm8rT2phWEVMdmJkdUpRTUkyZ2Fh?=
 =?utf-8?B?Vm5NL2JSelJPaXR3RHkrTHRFaGRpMEEvSnVFclJnR1ptRXVFaS8vK0VEV3p4?=
 =?utf-8?B?M01TWkJGbDdTT3NDOEdTU3o0YTBzTW1IaDZzSUdUY3V2YWpmdllTRG1ocTVS?=
 =?utf-8?B?Zk9DSEdiRmU1MVFMeFI4cTZDMjdhUkxrWUNVL21VbC9PREdZLzBjQnZ1dUt5?=
 =?utf-8?B?YlEvOFRzL240aFphUkZVRVdHY3RWVi9XM05Bc2JYNUJLcVhtakRUcVBkd3M3?=
 =?utf-8?B?dFNid2kzQmE2OENoWWxnWDFTL0M2SGpBUUFJbGp2Q2dPR2U4Z3lkSkZDbmZa?=
 =?utf-8?B?YW1YbHVNTnM0YWZDNk0zYW9qUjZiT1g0aWp2WkpvMjloanJEWjdzK2tKeUdY?=
 =?utf-8?B?cmVnYS94cmdrREdya3ZPMkVTQ2szcklmdmFtZXp2OE5KQnNRUUIybnBBY1NM?=
 =?utf-8?B?VFlTbnFQNGl2K2ZvSmh4Ny9oMm9FT200TS9UQWVVQTlPaHgwQlZVMHNrVjg5?=
 =?utf-8?B?SFJka2l3S0lqc2UwNDNOTnZseG9XZ0IrUjZybnJqTmhXVGlGMkdDcjJyM3Zi?=
 =?utf-8?B?RkJYNkZEQUFrcjdBbmxLRkpQYTlEeXVQTis2S1EzYXRsb2R0djMyTUtOMlU0?=
 =?utf-8?B?NU5UQkNRWDlWM0RvT2wvaWRwN2VBWElLbHVCejRoQmZ4c1JiOXlnNVljdzl3?=
 =?utf-8?B?dTFlUDc1eUNLblJ3bEJCcXQzOUFETXBLaWs5YmdmeUZoTjVvMDhEV3hrSWpE?=
 =?utf-8?B?cXJtY3NBemFRUU5IQUFabnAzSllUckdsbVU1dGJOS1RxTDhVc0xZUWRrWHdS?=
 =?utf-8?B?cjQ2Zjk2Tmw4WjBYT0ZxRW9CMTJoSW5TTkJEKzhTUFNaVFhkL1pPM2NnUEJa?=
 =?utf-8?B?RVNQdnk4MitFYmhHR20xRXkyUkVlbnFUclBVU0Y3by9LdFpDbUxRcGdJNnR0?=
 =?utf-8?B?b0lnUUVOK2xaWUdRTzNCL294MHlzU3VXejFzT2x4RHVXYjVVYy9NQWRhMkxy?=
 =?utf-8?B?ajgwQUhZQmt1Tnh3dXUyZWlRd0Z5bXhCLzIrOGtmbFNBaGpLQlpmTURSa0NM?=
 =?utf-8?B?NzNuUXpjRWxWM0kzeXZrMFk1VzBzVjR0ZWUrN0p6VWxyNjl0R2NCeVRHOWJF?=
 =?utf-8?B?TVZFQUgvRWF6OFdkSHFSMDQwSFc3Y3JxWGlrUVpEUWdpNGwzL3VSYjBDeUZW?=
 =?utf-8?B?TmhJTHlsdm8rZFp0Wk0zSUtMYU5SZDdsQmtIT1hKZW84MGhsS3c0azJDMzMw?=
 =?utf-8?B?Yk8zenFEOU1nazlXR2V4U05zUmM1a1ZqNDh3OFhpTHk5ZTdLaElNUVhxcXpS?=
 =?utf-8?B?aVJrMUNIbU9ndkUzdG4raUJkbUhhL20xUnBxMjNybGhIaEM0eUhtYVRjQlVq?=
 =?utf-8?B?SjhrcG5HMW5LZ1cxcTB3QngyT1JVSmVtMUZyWjVzMlVKcHhDTmZINUFwRFJS?=
 =?utf-8?B?dnRzc3hkOFBBWlVpelRubnpCdmxsVVBjRnJ1dnA5a1NieUk5UkFqQzhZbjNx?=
 =?utf-8?B?a1VYT3I5S1Y4MWVrWk9sWEVha1J2SHA1MlA5djNEQVpkaVg5VDcvV2ZlTUVO?=
 =?utf-8?B?K0hhTWo1SzV5VEZoZVV6TS9sWFZwbTA1NUlBRVJQUnNXOXM3aGNYbzRaWThI?=
 =?utf-8?B?N0NsbUh2YXVPWEVkQU52V25qK01QZTc5T2ozbW5uNGtpNHl5WFhRK2d4U0Nx?=
 =?utf-8?B?cGlyTFlTaStvVXlSS0VvTTBkR3hNbWFTdE9pVEtkdlRhWEpJVU54Q1Jiayty?=
 =?utf-8?B?dmxpQ016bitLb1JyWUtZbGl3RjN1NDVFQ0pSOUEwWnRSa1RlZHhhQnFqaTRo?=
 =?utf-8?B?SGlsTGhzOHBhZDVUanhLWWd6SWNjNVBsa2crTDlMbXA3TnJYWUoxaGE0ZDJC?=
 =?utf-8?B?emwvdHg1YnFrUjJuQWdpUHUzVzZ5d3BNVTZ1aVdxK3Q3Wjg4KzRZU0ZMVEll?=
 =?utf-8?B?aU5LRWZPTzZiZWF2VUxmbU9zQSttYzF4YWZENnFTVFV4cTNrbmZTemdvZHZv?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 669b5247-6ee7-403f-f407-08ddb8bbcbcb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:24:48.7643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yNg5hZ4nUrvXaNM/YJ1C9PQq6REyOFaxzEIOqHsh2UTUPUHxxR2oucPG7BVAnNxEOwMOk/1ykxt/RnPicN1sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
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

On Tue, Jul 01, 2025 at 08:06:16AM -0600, Gote, Nitin R wrote:
> 
> > -----Original Message-----
> > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Sent: Tuesday, July 1, 2025 5:38 PM
> > To: Brost, Matthew <matthew.brost@intel.com>
> > Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> > intel-xe@lists.freedesktop.org; joonas.lahtinen@linux.intel.com; Ghimiray, Himal
> > Prasad <himal.prasad.ghimiray@intel.com>
> > Subject: RE: [PATCH] drm/xe/uapi: Add
> > DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > 
> > 
> > 
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: 27 June 2025 23:45
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Vivi, Rodrigo
> > > <rodrigo.vivi@intel.com>; intel-xe@lists.freedesktop.org;
> > > joonas.lahtinen@linux.intel.com; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>
> > > Subject: Re: [PATCH] drm/xe/uapi: Add
> > > DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > >
> > > On Fri, Jun 27, 2025 at 10:57:54AM -0700, Matthew Brost wrote:
> > >
> > > Opps, typo.
> > >
> > > > On Fri, Jun 27, 2025 at 03:37:34AM -0600, Upadhyay, Tejas wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Gote, Nitin R <nitin.r.gote@intel.com>
> > > > > > Sent: 27 June 2025 13:44
> > > > > > To: Brost, Matthew <matthew.brost@intel.com>
> > > > > > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Upadhyay, Tejas
> > > > > > <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org;
> > > > > > joonas.lahtinen@linux.intel.com; Ghimiray, Himal Prasad
> > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > Subject: RE: [PATCH] drm/xe/uapi: Add
> > > > > > DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > > > > >
> > > > > > Hi Matt,
> > > > > > >
> > > > > > > Hi Matt and Rodrigo,
> > > > > > >
> > > > > > > > On Wed, Jun 25, 2025 at 03:28:05PM +0530, Nitin Gote wrote:
> > > > > > > > > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > > device
> > > > > > > query
> > > > > > > > flag
> > > > > > > > > which indicates whether a device supports DIS_NULL_QUERY
> > > > > > > > > (Disable null anyhit shader query mechanism). The intent
> > > > > > > > > is for UMDs to use this query and opt-in
> > > > > > > > > DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag to disable null
> > > > > > > > > query mechanism for anyhit shader by setting
> > > > > > > > > DIS_NULL_QUERY bit of
> > > RT_CTRL register for Xe2.
> > > > > > > > >
> > > > > > > > > v2:
> > > > > > > > >    - Use xe_rtp_match_first_render_or_compute() api to check
> > > > > > > > >      render_or_compute. (Tejas)
> > > > > > > > >    - Validate args->flags (Tejas/Matthew)
> > > > > > > > >    - Add proper kernel-doc for both
> > > > > > > DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
> > > > > > > > >      and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
> > > > > > > >
> > > > > > > > Matt asked for full spelling of DISABLE, no?!
> > > > > > >
> > > > > > > Thank you for clarifying the uAPI naming convention.
> > > > > > > I will update it.
> > > > > > >
> > > > > > > >
> > > > > > > > Also, where are the UMD patches/merge-requests for this? And
> > > > > > > > their
> > > ack?
> > > > > > > >
> > > > > > > From the Mesa team (Palli, Tapani) is going to send the
> > > > > > > corresponding Mesa patch.
> > > > > > > Meanwhile, I floated this patch.
> > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Rodrigo.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/gpu/drm/xe/xe_exec_queue.c | 11 ++++++++++-
> > > > > > > > >  drivers/gpu/drm/xe/xe_query.c      |  3 ++-
> > > > > > > > >  include/uapi/drm/xe_drm.h          | 12 ++++++++++++
> > > > > > > > >  3 files changed, 24 insertions(+), 2 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > > > > index fee22358cc09..ef8b49d2242a 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > > > > @@ -26,6 +26,9 @@
> > > > > > > > >  #include "xe_trace.h"
> > > > > > > > >  #include "xe_vm.h"
> > > > > > > > >  #include "xe_pxp.h"
> > > > > > > > > +#include "xe_gt_mcr.h"
> > > > > > > > > +#include "regs/xe_gt_regs.h"
> > > > > > > > > +#include "xe_rtp.h"
> > > > > > > > >
> > > > > > > > >  enum xe_exec_queue_sched_prop {
> > > > > > > > >  	XE_EXEC_QUEUE_JOB_TIMEOUT = 0, @@ -597,7 +600,8 @@
> > > int
> > > > > > > > > xe_exec_queue_create_ioctl(struct drm_device
> > > > > > > > *dev, void *data,
> > > > > > > > >  	u32 len;
> > > > > > > > >  	int err;
> > > > > > > > >
> > > > > > > > > -	if (XE_IOCTL_DBG(xe, args->flags &
> > > > > > > > ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> > > > > > > > > +	if (XE_IOCTL_DBG(xe, args->flags &
> > > > > > > > > +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT |
> > > > > > > > > +DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY)) ||
> > > > > > > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > > > > > > >  		return -EINVAL;
> > > > > > > > >
> > > > > > > > > @@ -693,6 +697,11 @@ int xe_exec_queue_create_ioctl(struct
> > > > > > > > > drm_device
> > > > > > > > *dev, void *data,
> > > > > > > > >  		}
> > > > > > > > >  	}
> > > > > > > > >
> > > > > > > > > +	if (((GRAPHICS_VER(xe) >= 20) && (GRAPHICS_VER(xe) <
> > > > > > > > > +30))
> > > &&
> > > > > > > > > +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY)
> > > &&
> > > > > > > > > +	    xe_rtp_match_first_render_or_compute(q->gt, q->hwe))
> > > > > > > > > +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL,
> > > > > > DIS_NULL_QUERY);
> > > > > > > > > +
> > > > > > >
> > > > > > > Also, as per Matt's suggestion in rev1, I'm exploring the WA
> > > > > > > BB program to set this.
> > > > > > >
> > > > > >
> > > > > > If we move this implementation from the exec queue creation time
> > > > > > to the submission time and write a WW BB program, then this
> > > > > > register will be set for every exec queue submission.
> > > > > > Let's say if submission happens 3 times, then register gets
> > > > > > written 3 times, which seems unnecessary.
> > > > > >
> > > >
> > > > No, completetly unnecessary, we have been over this. See below.
> > > >
> > >
> > > s/unnecessary/necessary
> > >
> > > Matt
> > >
> > > > > > So, having implementation in the exec queue create time, the
> > > > > > register will be updated only once, and we can disable it in the
> > > > > > exec queue
> > > destroy.
> > > > > >
> > > > > > What do you think? Could you please suggest?
> > > > >
> > > > > Hi Nitin/Matt,
> > > > >
> > > > > Are we talking below cases,
> > > > >
> > > > > (if kept in WA_BB) :
> > > > > User1 --> submits on rcs0 -> register will be updated for rcs0
> > > > > (User2 will not be affected)
> > > > > User2--> submits at the same time on rcs1 -> register will be
> > > > > User2--> updated for only rcs1 (User1 will not be affected)
> > > > >
> > > > > (if kept in exec_queue_create/destroy) :
> > > > > User1 --> creates exec_queue (register is written(not sure on
> > > > > which instance of rcs?) --> submits on rcs0 (User2 will be
> > > > > impacted if used same instance as User1, which isn't possible)
> > > > > User2--> creates exec_queue (register is written(not sure on which
> > > > > User2--> instance of rcs, but for sure not the instance User1 is
> > > > > User2--> using?) -> submits at the same time on rcs1  (User1 will
> > > > > User2--> be impacted if used same instance as User2, which isn't
> > > > > User2--> possible)
> > > > >
> > > > > If above cases are true then both look same, isn't it? Unless I am
> > > > > missing
> > > something.
> > > > >
> > > >
> > > > Tejas — I'm not really following your examples, but no, writing at
> > > > exec queue creation time is not the same as writing a WA BB.
> > > >
> > > > This is a very basic process isolation concept that I would expect
> > > > all KMD developers to understand. If not, then please take the time
> > > > to learn it — this isn't something I should have to explain
> > > > repeatedly. A quick Google search or a query to ChatGPT will explain
> > > > process isolation quite well. With just four queries, I got an
> > > > explanation for this exact problem, including why this must be part
> > > > of the context state (i.e., the WA BB), since work gets switched on the
> > hardware.
> > > >
> > > > Here were my chatgpt queries:
> > > >
> > > > "what is process isolation"
> > > >
> > > > "in a computer chip why can't you set a global register wrt to
> > > > process isolation"
> > > >
> > > > "more in the context the register changes behavior of computer chip
> > > > rather than data sharing"
> > > >
> > > > "say in the context of kernel submitting work on behalf of a UMD
> > > > which changes global register before each submit, why is that a bad idea"
> > > >
> > > > Anyway, let me give an example of why the current implementation
> > > > will not work:
> > > >
> > > > Example:
> > > > User1 wants DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY set.
> > > > User2 wants DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > > cleared.
> > > >
> > > > If a global register is modified at exec queue creation time (i.e.,
> > > > it affects the entire GPU’s settings), then both users cannot have
> > > > different behaviors — and we’re now broken.
> > > >
> > > > The only way for User1 and User2 to have different settings is to
> > > > make this part of the context state (WA BB), which dynamically
> > > > modifies the registers as work from each user is scheduled on the hardware.
> > 
> > Ok, I think I missed point here, as it is engine register, When UMD submits work

It is actually a GT register but same idea.

> > any engine instance will be selected for submission at the very same time we will
> > change the reg value on that instance, so for that period that instance will be
> > exclusively configured for specific user.
> > 
> > I get it.
> > 
> > Tejas
> 
> Thank you, Tejas and Matt.
> I'm moving this to WA BB.
> 

+1

Matt

> - Nitin
> 
> > > >
> > > > Matt
> > > >
> > > > > Tejas
> > > > > >
> > > > > > Thanks,
> > > > > > Nitin
> > > > > >
> > > > > > > > >  	q->xef = xe_file_get(xef);
> > > > > > > > >
> > > > > > > > >  	/* user id alloc must always be last in ioctl to prevent
> > > > > > > > > UAF */ diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_query.c index
> > > > > > > > > e8e1743dcb1e..c5002b8c9ac0
> > > > > > > > > 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > > > > > > @@ -344,7 +344,8 @@ static int query_config(struct
> > > > > > > > > xe_device *xe, struct
> > > > > > > > drm_xe_device_query *query)
> > > > > > > > >  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > > > > > > >
> > > > > > > > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> > > > > > > > >  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > > > > > > > -
> > > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > > > > > > > +
> > > > > > 	(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY
> > > > > > > > |
> > > > > > > > > +
> > > > > > > > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
> > > > > > > > >  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> > > > > > > > >  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
> > > SZ_64K :
> > > > > > > > SZ_4K;
> > > > > > > > >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =
> > > > > > > > > xe->info.va_bits; diff --git a/include/uapi/drm/xe_drm.h
> > > > > > > > > b/include/uapi/drm/xe_drm.h index
> > > > > > > > > 8e8bbdec8c5c..7c30e707346c
> > > > > > > > > 100644
> > > > > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > > > > @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
> > > > > > > > >   *      has low latency hint support
> > > > > > > > >   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > > - Flag
> > > > > > is
> > > > > > > > set if the
> > > > > > > > >   *      device has CPU address mirroring support
> > > > > > > > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY -
> > > Flag is
> > > > > > set
> > > > > > > if
> > > > > > > > the
> > > > > > > > > + *      device has null query support for anyhit shader.
> > > > > > > > >   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal
> > > memory
> > > > > > > > alignment
> > > > > > > > >   *    required by this device, typically SZ_4K or SZ_64K
> > > > > > > > >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a
> > > > > > > > > virtual address @@ -415,6 +417,7 @@ struct
> > > > > > > > > drm_xe_query_config
> > > {
> > > > > > > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 <<
> > > 0)
> > > > > > > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY
> > > 	(1 <<
> > > > > > > > 1)
> > > > > > > > >  	#define
> > > DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > > > > > > > 	(1 << 2)
> > > > > > > > > +	#define
> > > DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > > > > > 	(1 <<
> > > > > > > > 3)
> > > > > > > > >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT
> > > 	2
> > > > > > > > >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > > > > > > > >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
> > > 	4
> > > > > > > > > @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
> > > > > > > > >  	/** @vm_id: VM to use for this exec queue */
> > > > > > > > >  	__u32 vm_id;
> > > > > > > > >
> > > > > > > > > +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> > > > > > > > > +	 *	Flag is set if the device has low latency hint support
> > > > > > > > > +	 */
> > > > > > > > >  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 <<
> > > 0)
> > > > > > > > > +
> > > > > > > > > +	/** DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY - \
> > > > > > > > > +	 *	flag is use to disable null query check for Anyhit shader
> > > > > > > > > +	 */
> > > > > > > > > +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
> > > > > > > > > +
> > > > > > > > >  	/** @flags: flags to use for this exec queue */
> > > > > > > > >  	__u32 flags;
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 2.25.1
> > > > > > > > >
