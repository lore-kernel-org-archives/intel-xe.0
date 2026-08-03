Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D0EC55184
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 22:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9636E10E0E5;
	Mon,  3 Aug 2026 22:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCRFXXXT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EF010E0E5
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 22:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785796849; x=1817332849;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/p1atbLvsm8Wf8um8b+cI7ZGcABssTcnQlkuz99E5i4=;
 b=lCRFXXXTXrw+SQrFYs2W3oDokRgC5tVbjJ+5GTjkuU921FfjDOykZRU6
 4Soy3aTksdn/tS8G4/baxpnzNe2+qMv0hRTPfsq/lnWnYd/wyifDRlzeI
 4GiMiN/133P3jFY/7EsayF1zFkcMojkFCnMxLIjiW26KiVjfXXgxg3lpo
 5+9YfsB65W/9sWSY/wOimJdlWf3gtQtRJg9XncrOv5gclpEzaPUFzBDyp
 BkndkXiIVDE61dwr+iytnAITcgvWMcIcqSLg8jS5F5H9/ukCSJJeYTHz6
 3Cjkzslj4OIjoPuYpCLKjf612hxQpptXI5WSoESAPyw8SsQl0H8xAwcGn Q==;
X-CSE-ConnectionGUID: BoXH2UaQQYyTz1pPyeeZgw==
X-CSE-MsgGUID: nj/Pp5ixTweyxxZ9rDeEAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86539918"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86539918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 15:40:44 -0700
X-CSE-ConnectionGUID: a6L9WfH3QciEm1aNCJ78/g==
X-CSE-MsgGUID: SyqW/5hnQ92uP3qaBCChXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="284722311"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 15:40:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 15:40:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 15:40:43 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 15:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7WHiBhjjv2pf8p9HlgNy193I/gePyf86Uqvys9idEI7TwKxLT4V3efn+ijM8OWNaLiRMgVGPamvf2hn6tr9sQhUmm1s2hVgfBWydKIw4sstlQU0DkizZZjnQGVHZi1YfanLNGE0XB2cnXMeeWW3TyIOFCR0QMBQWrFU0Bi505kLloOaLXpma5f1C1T3+Xm2rT2Vsz9ttZHS+hufMM61pWdpdzT6qKr9NeMMYQH/s2Nnx6l+TZS0QhHirHZOmN/DoHpvydxTG/j5bLnVBHY3it1j582qamBBw52kKxB62c752Z8RfFCRzrySaiA7w5jREkpHWgR55oo/zAefVjdVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS1GCdGz0uDka1JcgZAc2CJCupeV2yFXFLESGqZtpyQ=;
 b=J9bq7yUOr1UiP6NP8/wePofezDIRL3xqPI2vSQh6GcGk9emU0te4O14hGSTze5FEAnhl2HHu+sqDInCR0H4KecCVbIJYOxkiFdocqy0H1DgnNH/hhlA1wdFUKNAPyT8hYMKDgApchLfGFQEkPCAwZQraZ39NKS/iXl8t/e/5BW99H3rWMHQZ4WZaJZmg4u4l+0h/vzDwq10dD93nio4IPYQtF7IC5uYRtNHi4goU3hBNaeXLd1aMdETpelYafuDAT84H4hfOT4Qq6jZeDC1az8286R0eBkgqrjz0wkd8iybwCinklDTHSo2EOXPZFWSzZWrxEur/E8qY0EEJn0fkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:40:39 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 22:40:39 +0000
Date: Mon, 3 Aug 2026 15:40:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
CC: <matthew.brost@intel.com>, <kamil.konieczny@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 3/3] drm/xe/lrc: Fix ABA race on engine migration in
 context timestamp read
Message-ID: <anEY4V4D1O2bUtF2@soc-5CG1426VCC.clients.intel.com>
References: <20260731040004.1345502-5-gajendra.uttamchand@intel.com>
 <20260731040004.1345502-8-gajendra.uttamchand@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260731040004.1345502-8-gajendra.uttamchand@intel.com>
X-ClientProxiedBy: MW4PR04CA0362.namprd04.prod.outlook.com
 (2603:10b6:303:81::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: a87480ca-e47a-4539-ad6a-08def1b03dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: joBKLBVSPtVQO6+RAczgOgGiGzve5ZxywPk9vXApODdkr5cxOgCiF+gQ4NOuiG91X6hJolYun96Yt4MaFta+ToTMUzub1LtU6gzsqwRNbtozIh6rJSw0yMpDVJ8VjWmdywOszDOMz1VQX13MCSYSr1HDboFEsmlU4VHMXBOQjAV2ggVVBziCN6I717gNKNx1u72VFug7NVsVnrIyJEr92kmmnq9WkW3UME8CuVl85UlirwcMva0W9m8E4W6CP4bJ2NpssW7HZM8fZWrvnU7gv7g6FCrvWuB3zM8/c8Vq38VBr0nCsuCnpHIEOLCRIZS/0WKrrWp/UtbDF5VCz3zecoIKU0NxitJXJxiiAe1nlZSQHgITwsVafvKAH7peLi6pRw8Sg5pNRIQhddEh26/ktirQd0fnngmMAD5O3TOoMgnYKmV97/vznGaOWfvd9qTAZgQwFDzRv+rmYXJwgXffZ7e3dGtjv/+1ulUWUjMOHvuhcB2JkajYqBG/a/sLyA5tMNLJQgXECy77ElXwjwLR/5cBfnanaMW8SpbRLlRCrVhiapehJe3iDAFxZVcjlC76opg1FoByRd4BE3vryEwVMiEErgr4Hnxzjx3xaTxvQp4YGG+gF2/CmvpcRZoDyaS64PUZ/iOOo+cQ6+7SC3FVCH/WIaThsUfgtKI6dulz1TQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmxGYnp3aVRKb3RtZ25lVFNzTjBGcVBsbm9IdEtualRQN3ArRjBmYlVlaFFs?=
 =?utf-8?B?L1RPUTYxQm5KMkliTHVIT2JUaXlaWEI5d2Q2MmRkaTYyaVlxVVRUMHVBaTJo?=
 =?utf-8?B?TU1SZ1hmVW1pb0FuREJzN0lRVmtoSHhwMlM0QXRkeFVqNGcyTVFUVmxVNThL?=
 =?utf-8?B?NGlTSFBzNkdVNFVvUm04cmdaRFVIazg2WEJ2azZhSktoWURQbnhWZjlQRDBT?=
 =?utf-8?B?UHdDWmNHOHRXc2pvNGFldlBOdzh3NE9TVGIzUGpRd25ZWFdlaUlNRis2U21t?=
 =?utf-8?B?ZUhLemQvckUvZmwza2dNTVg4a1JydVRsa3pKL0xsRW04OXdLVVBmL2tldFFt?=
 =?utf-8?B?czF1Ryt6MGRsTEV1R21aTzZVckV2VDBTazY4bjlJREtxeTBhZ1EzaUdsaFox?=
 =?utf-8?B?UHMvWnVja2V0ZCs5cVdwY2lHcC8wMjJlbTFHSjliOUdvWEQ4MzVRaVo0bkc0?=
 =?utf-8?B?TFlYbE1ENG8zMEpVRzdsaHBSV21zbGMzRUxrTGFpaTB2Vlk5WDg5azNHVm5y?=
 =?utf-8?B?c0JtM050c3BaM0pTME1YRFFpRFpCeXU3bXoyOGlmSzZEUkpTYURLbWhRbWs4?=
 =?utf-8?B?ZGdKTDU1VWpWcUxLaDR6MmhxSlZMa25lY1V1a3Y1a0FCb1Y5TENsVGQ1YWIy?=
 =?utf-8?B?MkZRNDFVWjZtVy9yTk1Ua0hnbno3aE5mSzJQNUpONE4rVjZPY1I5VXoxYWhu?=
 =?utf-8?B?ekcxYzBvWGhHMDNtL3h0bkcyS3dNUWI4ZGV6RWF5VlpKWURYdHRPMEc3MFhj?=
 =?utf-8?B?ZG5lMnczZUY2Y21UcERIQnlhUzVJc1VaNU9MOHdra3pmTDJqVkg5MTBWUmJx?=
 =?utf-8?B?RWVUUjlWS0FZVGZ2akNvZ3VCcmI1ZjByY212ZWNEdzJXYVlOWHAxL1ZhdXNh?=
 =?utf-8?B?SlFEOVNqM3VyRWhMV0JYeWE1Q0UrZ2c4dWpyQzdhdmxkWHY0RmpHcXhVa0pF?=
 =?utf-8?B?ZW02OXFkaFpDSFRERTBzbGkraXVyV3ByWkZJa3FBMFpnYUlLcjVyWkR1dHhJ?=
 =?utf-8?B?cWpPclp0MjZndzVYaVFyZjBjTjU1Z256U2Y3RWpjSHB6eS9JVEhiR0syaVlM?=
 =?utf-8?B?Z290UTRwbVpzSXdjNzdPa1ozK3BBRG9VVTV2U0o1bFNiOXRIWnlaSnoyZ2pG?=
 =?utf-8?B?K1drR0NrZ2JCOTYvaWYvNlg0QWx4bG10SzRNZ25Rb1JJMHIzZE5iRmVLc0JD?=
 =?utf-8?B?SUM5RUszWGpXdStpUTlsS21nTFYwQ0w1ZG8vQzlMSkxwOGNYWmtZK2tJWUVD?=
 =?utf-8?B?SUppaXhUbHpSdGp1NHNKdzdDUnFnY3EvVnRBc3FiN3hyRG1TSElhQURoQktN?=
 =?utf-8?B?UzM3WUE0K1l6aHVXd1FkUFk3Z0l2Qi9CSXRiK0FJZXg0ak1kUTdpMWlVYjZP?=
 =?utf-8?B?aVZtRTB2QTE0NWQvOXFzTDh2dU1zRUUvSjlDbzNVUzlZSVNRUGw3WTNYR1BH?=
 =?utf-8?B?VU9jenc0ZzBTbXBGRU1KbFVWc1ltTXRQQ0M2aUNCN0RVSTNlMndwZnRNRTli?=
 =?utf-8?B?T2R6eW9ZZkpWclpRaHV1UXFSTURxWGphbTQ0b0xlVFNoTGZveDhWa2RlVWVI?=
 =?utf-8?B?VnI5dlgvNGJHc1NBbFlMRUpaTjNkbEZlWFA3YlcxcmU2Nk0wYUpIQTdXQ0Zt?=
 =?utf-8?B?aTVuWUk1S1JsUGcvSnhhcDdnQXo3NVNFNEZhZmpSbTYxT0E0NXZFWUhNSEwy?=
 =?utf-8?B?YjNjeWlvaFp4Vnl0ZllCR3ZjM1ZFdzZhT21wVzEyOTRmeUNIZ3dhN3JabVJh?=
 =?utf-8?B?amk4bjJvRTEvdUtZZE9GeG80RVJLeHdsUGZxa2VkL2ltNHhYQTFkUHFqWDFl?=
 =?utf-8?B?SUxlVENEZ1N3RDlNa0pqaTluRGloNW9sdkZCR002cE9Yd0ZjVkVyM0V1N0pi?=
 =?utf-8?B?MnRzeGx1bFp2S21ReXRYVDQ0bGdwbFVjcjBINksvZzEzdGV3dWhGcTZQWlA2?=
 =?utf-8?B?STI0aW9vSmxHVzBoSlhRckJoRHV2dUNZMkRDVmJHUW56REpPbGNzVzNqMUdm?=
 =?utf-8?B?bXJ4Z21RVG5RQVNqN0QwNmJqRzZpM0FuZ0pQZFlKamJGZFlBL3kzSmhYdm9U?=
 =?utf-8?B?cHpJbG54aWtHSG1BaXZYZDBmUTkyS3I4eVNSSjdhbEhURkUva0hmdmp5b2E0?=
 =?utf-8?B?dXVjTVhvL1lQVElHS0FKbytpVzJpeXdQejVrK3cvMEthVFZhVENEZ1VWdGdq?=
 =?utf-8?B?cElJU2wraTg4eHRtWjdVamljbFp6bm5mak56ejFNMjNmYlFpamFFV0JJMnl2?=
 =?utf-8?B?Q3F6UE9SUEIyK3VHM1Z1blp6SHltd011M3hqVWdTRm41cHQ4c0Z5RDRLajNm?=
 =?utf-8?B?MklDeUxzV3VjV3VscGxsT2dCQ28rVUNxaHZndTZscWF1c3JhTm5iUk5Qa2Q3?=
 =?utf-8?Q?DUZSctdsvpQs0L7Krer2V5AyeWd9HtWn8L01N?=
X-Exchange-RoutingPolicyChecked: pDqFhr2QyM/MWC4gTxlkbdQAG0+EkKR9hML0rDuwdZ6hyPmXZojL/IG/FFrsfVNIJJzxbzTPFEhhqAV+AhmG3oR/XflaqcA2rz4sPTljpgIEh8kBRvu/iY9eXsyMxmSyD1MMNZ37WmLInXWEMaVjD/sOdGQ8NYpBIZF3N6JzpFObou81+Muf+46r0+AcLi2kx0UoyqazvfoBvsi5W7ed5S5DiSik9M+/GsJAyJHH2AlTGodAjYTqXNSxxeGtFZ2i9JPmInIrgEAIPctkQaFiuwvkUvRJN9xQ5s21tnQSfODtfl6e7UmMKQBNZ09Q4zLj4zfBModAWRBmPnRkDj2mVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a87480ca-e47a-4539-ad6a-08def1b03dde
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:40:38.9932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7zjvmRp4+NRzrsbxWEC1nOL74+inan9GBVZCgYhE2aigWoEHaj81iR19iEKuEQp3HHSPUrXWHoxkmquZ+2d6wf3D21MroVUMOTGEFBPjVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
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

On Fri, Jul 31, 2026 at 04:00:08AM +0000, Gajendra Uttamchand wrote:
>xe_lrc_context_timestamp() reads the engine id once via
>xe_lrc_engine_id(lrc) and uses it to fetch the live CTX_TIMESTAMP MMIO
>register, then re-checks the LRC-stored value to detect whether the
>context switched out while the MMIO read was in flight. That check
>only confirms the context is (still/again) active - it does not
>confirm it is active on the *same* engine the MMIO read targeted.
>
>If the context is saved and restored onto a different engine between
>the initial engine id read and the final activity check, the
>CONTEXT_ACTIVE sentinel will be observed again (now for the new
>engine), and the stale MMIO value read from the old, now-unrelated
>engine is returned as if it were valid.
>
>Pin the engine id used for the MMIO read and re-validate it against
>the current engine id after the final activity check. If the engine
>changed, retry the whole read (bounded by a small retry count) instead
>of trusting a timestamp sampled from an unrelated context, falling
>back to the last cached value if the context keeps migrating.
>
>Assisted-by: GitHub-Copilot:claude-sonnet-5
>Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 47 ++++++++++++++++++++-----------------
> 1 file changed, 26 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 6f0247bdf8e4..3603642ed0e6 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -2742,39 +2742,44 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> 	return lrc->queue_timestamp;
> }
>
>+/*
>+ * Bound the number of times we retry the full read sequence when a
>+ * context migration between engines is detected. A small bound (3)
>+ * prevents long loops; if we exhaust retries we fall back to the
>+ * last cached `lrc->ctx_timestamp`.
>+ */
>+#define CTX_TIMESTAMP_MAX_RETRIES 3
>+
> static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
> {
>-	u64 reg_ts, new_ts = lrc->ctx_timestamp;
>+	u64 reg_ts;
> 	u64 stored;
>+	u32 engine_id;
>+	int retries = CTX_TIMESTAMP_MAX_RETRIES;

int retries = CTX_TIMESTAMP_MAX_RETRIES;
u64 reg_ts, stored;
u32 engine_id;

nit: ^ I would arrange it in decreasing length of line in this case.

>
> 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
> 	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
> 		return xe_lrc_ctx_timestamp(lrc);
>
>-	/*
>-	 * Safely read CTX_TIMESTAMP: check the LRC-stored value before and
>-	 * after the MMIO read to avoid a TOCTOU where a context switch makes the
>-	 * MMIO value stale. If the LRC value is not `CONTEXT_ACTIVE` return it;
>-	 * otherwise accept the MMIO value only if the context remained active.
>-	 */
>+	do {
>+		/* Read LRC-stored timestamp before/after MMIO to avoid TOCTOU. */
>+		stored = xe_lrc_ctx_timestamp(lrc);
>+		if (stored != CONTEXT_ACTIVE)
>+			return stored;
>
>-	stored = xe_lrc_ctx_timestamp(lrc);
>-	if (stored != CONTEXT_ACTIVE)
>-		return stored;
>+		engine_id = xe_lrc_engine_id(lrc);
>+		if (get_ctx_timestamp(lrc, engine_id, &reg_ts))
>+			continue;

If get_ctx_timestamp fails, we should just break. It's a bug. The dmesg 
warn on in get_ctx_timestamp is sufficient. As for the use case, the 
utilization will likely stall with lrc->ctx_timestamp value and tests 
will fail.

Thanks,
Umesh

>
>-	/* Context is active: read the live timestamp from the engine's MMIO register. */
>-	if (!get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
>-		new_ts = reg_ts;
>+		stored = xe_lrc_ctx_timestamp(lrc);
>+		if (stored != CONTEXT_ACTIVE)
>+			return stored;
>
>-	/* Re-check the LRC-stored timestamp: if the context switched out while
>-	 * reading MMIO the hardware saved the canonical timestamp into the LRC
>-	 * during context-save, so return that value instead of the MMIO read.
>-	 */
>-	stored = xe_lrc_ctx_timestamp(lrc);
>-	if (stored != CONTEXT_ACTIVE)
>-		return stored;
>+		if (xe_lrc_engine_id(lrc) == engine_id)
>+			return reg_ts;
>+	} while (--retries);
>
>-	return new_ts;
>+	return lrc->ctx_timestamp;
> }
>
> static u64 xe_lrc_update_context_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>--
>2.43.0
>
