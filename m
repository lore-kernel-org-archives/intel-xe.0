Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5408C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 21:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DFE10E2D5;
	Fri, 29 Dec 2023 21:09:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D4910E2D5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 21:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703884186; x=1735420186;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Df22mOBHF3StRMeGZYktnbrZOfUQJ7YRPbElm1fuER0=;
 b=f/j56J1Ru8DmRRg2Y3ptQ83a9aU2OxQn2yNqZCsO9EH72aTDN/pLbxmW
 5u+20rI5U/K0Lz6J4rPMVPJpV759JmOLTgF7IcImXub0B5FMt+LvRRJw9
 2LwbdbkYwAxvF+kuF7mxq/ooIi5PdHMGN/MAl6kKtqEWsOY0wM/mIM6ZI
 yC+41/u8rsSh2cTf8JqhSs//8oRQb9g3SDGPsmkmcSSCJZhcBVyR/MlKA
 hp88NrsfHhu0LIlVpGb4Lsov2sDQv2pel+1m65Rp+OTb03QwV/o5rKLAp
 KUCRmUylRP6D3LgNrC+1LIyWG2pMuOucTSFRqwAGAcppEV3YPDyMAf1yk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="460991600"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="460991600"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 13:09:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="728682585"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="728682585"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2023 13:09:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:09:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:09:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 13:09:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 13:09:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHXhdXRyVdy+9STrzjvOc6+EA5o5lUskNLdG7AuOt56NBAdKuDW6CWabVQLmyXIg776qoQuFjJEW1cu9aZz/gcGU0G5hQbILrpQYNRrjwRrhS4J4W/eXbeftcpGGQCY8RjqxqBoPAUYbD8Jy7NctkFuGM63AMe9UQGd4plbZLKukXP6L3VLPKA5y1xDx/NBPIUSZzWpqCpUR1itvmAgCm/YCpigWNcLvXyYOxPG9tqZfBxaseLC8M/Gg+zwSyTNhyCQMRictmyvZ4pSvAtaZgJz1y3kVc7RNcSB3epoGPwwz7dtmHVvA8hUlrwA2vlRkBX6YIn4MNqe9YxrYH2c5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wR2qPXz5u7yFfu3zLpjO6hS4CO4l/y8KWT+QE/v87cQ=;
 b=lwPW3wfB5quTg4b0k/j5mxhAH9mrd+MQaqGgVQyCegxfBl5niVoMgKGAIIqBbFkDnwDbE7Zpct/CoG0YfiLrkAGFsm5utIpf6Q27kQVSfVvJ5CukwnAHGlEbIcu69ziqY/EiE8P9hl1RvELfae63mXezVlOiK+2uLQAY5UYfFcd8Fg7rUyiceQHadpWA1cSvJKI4FuJBRkL1Io0WoggfaV+8+qAanIswEDnsDX6r3B6iqxnWAWtx51o8D6tZbVSpY2WENbSIRfLlbGjSkwPeHUpguYEHTWV1lyCFnvz7sjehdHQ7tJviBjk1jdPiJdkq26A7GhLeNW5vP1pqEGhPzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA2PR11MB5179.namprd11.prod.outlook.com (2603:10b6:806:112::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21; Fri, 29 Dec
 2023 21:09:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 21:09:40 +0000
Date: Fri, 29 Dec 2023 22:09:38 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 06/10] drm/xe/guc: Add Relay Communication ABI definitions
Message-ID: <20231229210938.6qidyfbojiuuycgf@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227235838.212-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA2PR11MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: ddbcc28d-1ddc-4a61-e1d7-08dc08b278ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVI6KN2dCg3+VQkyG5gA5k6zl+5F1TAFBESnVx1oRJmZz5RJ8dSBxbobFsDGgXhI7WN49AFZcsrB80mZtGXXAzz1dozuUTX/mwH2ZaN+hQjiRA5YmfoQsPKxOFOVaMtDMmNtOOTn/jQ99XqFI+mVD12dQDjhL3rBgUEIAENsEuKLoCQeMVNR41B403ksxRjhc1na/x9uoiBkBqCogxZD8x/S6LBtNx7SAI7kk/ujXI3cdOiVLCN/S+7bAr+sSy64tfNyxBX9/Opn+YZ5a2mnFHbLtxG3eKo88Hpy761zQLNNhZJqGnd17Ful4/NTQlyd9lrXkZjol2Twg2lA3nirmciSrTsTO5Fm5tHScSK46mB7Q46npD1j8cmgvUsfzmz8bkBahHLg8F1joFrTiJMUKATc4ylX2tE+eHoubDBAmJvi+Vtbnfe1MdoisR/ZuwG8UhZRzRbmweFEw7QFSwSSj/mmKjxwKoZyktA2pbESb8MNSarQ02ijpJUBiW9AYitdG591DnM1Wu4btvFHr+rv1qLUWYMq0jO2HaHFvgttcwRMbOwiElJS+T3ND8b+NBcn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2616005)(478600001)(6486002)(41300700001)(26005)(6862004)(38100700002)(82960400001)(8936002)(8676002)(316002)(66574015)(30864003)(4326008)(2906002)(5660300002)(37006003)(6636002)(1076003)(6512007)(6506007)(66556008)(66946007)(66476007)(83380400001)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUUwdk9CZnNpejJ1em5GS2dURElzcDRQSCtSZjFlK3BCOWtHQWI2YXdhc2FG?=
 =?utf-8?B?OEsyVzFPYjlIV2lmcC9jVjNJSmlya3VGOGJzNzVBUlM0UThZd01CZ1lObmQy?=
 =?utf-8?B?aE9RMnFCSERFalBUVVlzK2w5ZFlkMXdnNXZ3WERzTmtUVWFxY2JMQThhT1BB?=
 =?utf-8?B?N3VFalFrNm83ZEtaN2o4eXFINE5BZ1N6M2VnRFJpODFRbkpJa0hPQVdNaGIy?=
 =?utf-8?B?NjN5NUgyS0VqaHNrSFVwc0oybUJ0NXZoT3QzK2EwZ1BhL2RrakhuZmlVRmlV?=
 =?utf-8?B?Q0ZSbHg0RFFUaWVnYnBCMWFjVE80dkU4S0xVdFIyNGVtaTNDWkVOZHRGOGUx?=
 =?utf-8?B?Z2ZDeXlpZXhoYmJLdHdVaE53eERzcDBxUGZ0WDlWN3lmNTZXbXJBQnBTS0du?=
 =?utf-8?B?SGx2dnZEWHo0dTYzVDJPZGJkZnBXQ0puTDN1eVV1YnNFWUgrSGpUN0VqRjhW?=
 =?utf-8?B?cnM0VzdrYTJkVWl0bit6VkNiYVNudS9kNkE2M3FrTmVBS3dzdGVJSnlmU0tz?=
 =?utf-8?B?SGhTNnZwUFcrdFpxbXpKTjNHdTRHWGswNTdNWndzTE13MFAwL0svRHJLcTJm?=
 =?utf-8?B?blE5bWJVYTRSVWhoZEYvTlVoaStkR0FoNmVXZ0dsSjFYV1YrM1lteE1iRDN6?=
 =?utf-8?B?cjR0blh4Y1lVcElwdmdUQmZHNWlJWnRxYUd1RUJxK2FFa0w4eU9TZFNJaGo2?=
 =?utf-8?B?VFpRSUtmVXAwekhWNStGbDI1WDQvNW1FUDRBRXlRQWpIUDlxNGdlQVFIa2Mr?=
 =?utf-8?B?aFhOQk4rWjEzNjFzSTdLOGpqTFJQaVJQZ1BHNCtkZGpSMktQRHZJVU4vYis0?=
 =?utf-8?B?U0JUL0NDejBtV0V5RCt5Zm5aOVB3bGh1K3RrRDFRQmVLdEtqODNWakZIVnox?=
 =?utf-8?B?Sm1xTEZUOWUwNkZoNHZNd2FIdEZOeUFMY29QY3gxaGFsMEpaWS9raHBzeVQw?=
 =?utf-8?B?SG9tSW5Qemd6VXpQdTNFdXd4UmpMcGoycmdJOExNOGRaV2RweTQ2d2oxY3pt?=
 =?utf-8?B?VlV1TFNEV1VoalNEcmZRbERzdWRSRExnQlkwK0VoSzlub0RveXF2VXV4Y3ZM?=
 =?utf-8?B?UUxjUThvN28ySTJ3NFNtcWlaZk5NVElhVWxuQ3R2bkRyNU5vVnhvZ2pmUDhW?=
 =?utf-8?B?aldsWDFTaHBPcHNSUnNJTEhuVFI2MmY5NW9Bb2cxN29WeHFsTlFQT1NRY0Rm?=
 =?utf-8?B?L3pablBIbnlRd2x5bjJBUkg5T0ZjQm04YTBUbHhTZmcxbi9CMjZPYmV5NXVL?=
 =?utf-8?B?aVZiV3AxQ0FENzRHMVRWbDVZT1hpQXhTMXhLM2huYXhIczdKUzFCbHdlRGtw?=
 =?utf-8?B?dnJ6SUZ3bStqWlU0d2ZaVExPaU55d1dLMWNoSGRpMnhjOWhaMzVaeWVNdldI?=
 =?utf-8?B?MGRJMUFqalVnakdlRHpGcElOYU1zTVRMSTVBK0ZEd04rbzA0aEhwdnFlY1Rz?=
 =?utf-8?B?VmkrclFZd0tCN1FzZnhoejNuWUUrWkE0c0UzbWVWeEwwcnRRenBGNnBoU1lt?=
 =?utf-8?B?WnJZQW9DdTdCTm5MbmJyVThZQ2R6emN5K21GZ2o1QXhPQzhHMlQxL0RCRmQ5?=
 =?utf-8?B?YnY2UERMMDhZZ3hEZ2pQK3NXOFhZU3B1VCtXeWxoMkhjalJMTDRRR1hPNEdT?=
 =?utf-8?B?MFdDeTdPajVqbGZSYjRRTVlyS3FmSFFJaXpuM0k3R285dVRUZ0swcGxSZEdi?=
 =?utf-8?B?QURHem5LTG9nZDFrd3NoNkZVTkpCbUlzRTdrRTZIeTFlcDhjUVBRK0UxczFV?=
 =?utf-8?B?UlZoUlhOclNxaDdtbVdrWTQzbTB4ekxicjd5aHVHdmJyZ2lYQmw0NVBGdGN3?=
 =?utf-8?B?MlQySzR4Mkw1ZEZKbFpzYUJ1QzJJUmZ3ai94RzRGQTljbFQ1eW0wMjFqYTcw?=
 =?utf-8?B?d0RlcFU4YTlNTFlDSXY3WkxRTC9HTHBidzVBNUpPd3N1VzBlb2liTWUxMld0?=
 =?utf-8?B?V3U5MUtUQU9WZVZXUjJzVnJjWUVYVEZnSC80d0VwTEdJYWtLcEdFNHJRV05N?=
 =?utf-8?B?TlJMeWtsMmQ1d2ZvSHVWWHllT20zV1JGR0Y5NjFYNzd0ZlhZcFlGV1RMemMw?=
 =?utf-8?B?bjF4Z3FOOWFSemJiL0E3Z2gzSnRjVjJveXdrZlVOcEdvUmc0K04xdjZIR0tB?=
 =?utf-8?B?MFpIZmpGTjhuQ1VDMmJQV2FuTHRLWG5JQm5aaEthYVhwNDBIcXFMVmlSR2NM?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbcc28d-1ddc-4a61-e1d7-08dc08b278ef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 21:09:40.7685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTVIQpjUJ663TzS0J9ZSAfttyrRdPwgx1iJDMUQG84nwrX13/hecAQ5WhRiIGM1ttSctIRDdhON8dKpMDj9YgI9qBmWdz8vM/jIBY7et6X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5179
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:34 +0100]:
> The communication between Virtual Function (VF) drivers and
> Physical Function (PF) drivers is based on the GuC firmware
> acting as a proxy (relay) agent.
> 
> Add related ABI definitions that we will be using in upcoming
> patches with our GuC Relay implementation.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 174 ++++++++++++++++++
>  .../gpu/drm/xe/abi/guc_relay_actions_abi.h    |  79 ++++++++
>  .../drm/xe/abi/guc_relay_communication_abi.h  | 118 ++++++++++++
>  3 files changed, 371 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> new file mode 100644
> index 000000000000..5496a5890847
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -0,0 +1,174 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _GUC_ACTIONS_PF_ABI_H
> +#define _GUC_ACTIONS_PF_ABI_H
> +
> +#include "guc_communication_ctb_abi.h"
> +
> +/**
> + * DOC: GUC2PF_RELAY_FROM_VF
> + *
> + * This message is used by the GuC firmware to forward a VF2PF `Relay Message`_
> + * received from the Virtual Function (VF) driver to this Physical Function (PF)
> + * driver.
> + *
> + * This message is always sent as `CTB HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | MBZ                                                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF` = 0x5100      |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | **VFID** - source VF identifier                              |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 2 |  31:0 | **RELAY_ID** - VF/PF message ID                              |
> + *  +---+-------+-----------------+--------------------------------------------+
> + *  | 3 |  31:0 | **RELAY_DATA1** |                                            |
> + *  +---+-------+-----------------+                                            |
> + *  |...|       |                 |       [Embedded `Relay Message`_]          |
> + *  +---+-------+-----------------+                                            |
> + *  | n |  31:0 | **RELAY_DATAx** |                                            |
> + *  +---+-------+-----------------+--------------------------------------------+
> + */
> +#define XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF		0x5100
> +
> +#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 2u)
> +#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_MAX_LEN \
> +	(GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MAX_LEN)
> +#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
> +#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn
> +#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_2_RELAY_ID	GUC_HXG_EVENT_MSG_n_DATAn
> +#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_3_RELAY_DATA1	GUC_HXG_EVENT_MSG_n_DATAn
> +#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_n_RELAY_DATAx	GUC_HXG_EVENT_MSG_n_DATAn
> +#define GUC2PF_RELAY_FROM_VF_EVENT_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
> +
> +/**
> + * DOC: PF2GUC_RELAY_TO_VF
> + *
> + * This H2G message is used by the Physical Function (PF) driver to send embedded
> + * VF2PF `Relay Message`_ to the VF.
> + *
> + * This action message must be sent over CTB as `CTB HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = `GUC_HXG_TYPE_FAST_REQUEST`_                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | MBZ                                                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`XE_GUC_ACTION_PF2GUC_RELAY_TO_VF` = 0x5101        |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | **VFID** - target VF identifier                              |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 2 |  31:0 | **RELAY_ID** - VF/PF message ID                              |
> + *  +---+-------+-----------------+--------------------------------------------+
> + *  | 3 |  31:0 | **RELAY_DATA1** |                                            |
> + *  +---+-------+-----------------+                                            |
> + *  |...|       |                 |       [Embedded `Relay Message`_]          |
> + *  +---+-------+-----------------+                                            |
> + *  | n |  31:0 | **RELAY_DATAx** |                                            |
> + *  +---+-------+-----------------+--------------------------------------------+
> + */
> +#define XE_GUC_ACTION_PF2GUC_RELAY_TO_VF		0x5101
> +
> +#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 2u)
> +#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_MAX_LEN \
> +	(PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN + GUC_RELAY_MSG_MAX_LEN)
> +#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> +#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_1_VFID		GUC_HXG_REQUEST_MSG_n_DATAn
> +#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_2_RELAY_ID	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_3_RELAY_DATA1	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_n_RELAY_DATAx	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define PF2GUC_RELAY_TO_VF_REQUEST_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
> +
> +/**
> + * DOC: GUC2VF_RELAY_FROM_PF
> + *
> + * This message is used by the GuC firmware to deliver `Relay Message`_ from the
> + * Physical Function (PF) driver to this Virtual Function (VF) driver.
> + * See `GuC Relay Communication`_ for details.
> + *
> + * This message is always sent over CTB.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | MBZ                                                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF` = 0x5102      |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | **RELAY_ID** - VF/PF message ID                              |
> + *  +---+-------+-----------------+--------------------------------------------+
> + *  | 2 |  31:0 | **RELAY_DATA1** |                                            |
> + *  +---+-------+-----------------+                                            |
> + *  |...|       |                 |       [Embedded `Relay Message`_]          |
> + *  +---+-------+-----------------+                                            |
> + *  | n |  31:0 | **RELAY_DATAx** |                                            |
> + *  +---+-------+-----------------+--------------------------------------------+
> + */
> +#define XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF		0x5102
> +
> +#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN		(GUC_HXG_EVENT_MSG_MIN_LEN + 1u)
> +#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_MAX_LEN \
> +	(GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MAX_LEN)
> +#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_0_MBZ		GUC_HXG_EVENT_MSG_0_DATA0
> +#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_1_RELAY_ID	GUC_HXG_EVENT_MSG_n_DATAn
> +#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_n_RELAY_DATAx	GUC_HXG_EVENT_MSG_n_DATAn
> +#define GUC2VF_RELAY_FROM_PF_EVENT_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
> +
> +/**
> + * DOC: VF2GUC_RELAY_TO_PF
> + *
> + * This message is used by the Virtual Function (VF) drivers to communicate with
> + * the Physical Function (PF) driver and send `Relay Message`_ to the PF driver.
> + * See `GuC Relay Communication`_ for details.
> + *
> + * This message must be sent over CTB.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_ or GUC_HXG_TYPE_FAST_REQUEST_   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | MBZ                                                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`XE_GUC_ACTION_VF2GUC_RELAY_TO_PF` = 0x5103        |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | **RELAY_ID** - VF/PF message ID                              |
> + *  +---+-------+-----------------+--------------------------------------------+
> + *  | 2 |  31:0 | **RELAY_DATA1** |                                            |
> + *  +---+-------+-----------------+                                            |
> + *  |...|       |                 |       [Embedded `Relay Message`_]          |
> + *  +---+-------+-----------------+                                            |
> + *  | n |  31:0 | **RELAY_DATAx** |                                            |
> + *  +---+-------+-----------------+--------------------------------------------+
> + */
> +#define XE_GUC_ACTION_VF2GUC_RELAY_TO_PF		0x5103
> +
> +#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_MIN_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
> +#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_MAX_LEN \
> +	(VF2GUC_RELAY_TO_PF_REQUEST_MSG_MIN_LEN + GUC_RELAY_MSG_MAX_LEN)
> +#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_1_RELAY_ID	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_n_RELAY_DATAx	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define VF2GUC_RELAY_TO_PF_REQUEST_MSG_NUM_RELAY_DATA	GUC_RELAY_MSG_MAX_LEN
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
> new file mode 100644
> index 000000000000..747e428de421
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_RELAY_ACTIONS_ABI_H_
> +#define _ABI_GUC_RELAY_ACTIONS_ABI_H_
> +
> +/**
> + * DOC: GuC Relay Debug Actions
> + *
> + * This range of action codes is reserved for debugging purposes only and should
> + * be used only on debug builds. These actions may not be supported by the
> + * production drivers. Their definitions could be changed in the future.
> + *
> + *  _`GUC_RELAY_ACTION_DEBUG_ONLY_START` = 0xDEB0
> + *  _`GUC_RELAY_ACTION_DEBUG_ONLY_END` = 0xDEFF
> + */
> +
> +#define GUC_RELAY_ACTION_DEBUG_ONLY_START	0xDEB0
> +#define GUC_RELAY_ACTION_DEBUG_ONLY_END		0xDEFF
> +
> +/**
> + * DOC: VFXPF_TESTLOOP
> + *
> + * This `Relay Message`_ is used to selftest the `GuC Relay Communication`_.
> + *
> + * The following opcodes are defined:
> + * VFXPF_TESTLOOP_OPCODE_NOP_ will return no data.
> + * VFXPF_TESTLOOP_OPCODE_BUSY_ will reply with BUSY response first.
> + * VFXPF_TESTLOOP_OPCODE_RETRY_ will reply with RETRY response instead.
> + * VFXPF_TESTLOOP_OPCODE_ECHO_ will return same data as received.
> + * VFXPF_TESTLOOP_OPCODE_FAIL_ will always fail with error.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_ or GUC_HXG_TYPE_FAST_REQUEST_   |
> + *  |   |       | or GUC_HXG_TYPE_EVENT_                                       |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | **OPCODE**                                                   |
> + *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_NOP` = 0x0                      |
> + *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_BUSY` = 0xB                     |
> + *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_RETRY` = 0xD                    |
> + *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_ECHO` = 0xE                     |
> + *  |   |       |    - _`VFXPF_TESTLOOP_OPCODE_FAIL` = 0xF                     |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`IOV_ACTION_SELFTEST_RELAY`                        |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | **DATA1** = optional, depends on **OPCODE**:                 |
> + *  |   |       | for VFXPF_TESTLOOP_OPCODE_BUSY_: time in ms for reply        |
> + *  |   |       | for VFXPF_TESTLOOP_OPCODE_FAIL_: expected error              |
> + *  |   |       | for VFXPF_TESTLOOP_OPCODE_ECHO_: payload                     |
> + *  +---+-------+--------------------------------------------------------------+
> + *  |...|  31:0 | **DATAn** = only for **OPCODE** VFXPF_TESTLOOP_OPCODE_ECHO_  |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + *  |...|  31:0 | DATAn = only for **OPCODE** VFXPF_TESTLOOP_OPCODE_ECHO_      |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_RELAY_ACTION_VFXPF_TESTLOOP		(GUC_RELAY_ACTION_DEBUG_ONLY_START + 1)
> +#define   VFXPF_TESTLOOP_OPCODE_NOP		0x0
> +#define   VFXPF_TESTLOOP_OPCODE_BUSY		0xB
> +#define   VFXPF_TESTLOOP_OPCODE_RETRY		0xD
> +#define   VFXPF_TESTLOOP_OPCODE_ECHO		0xE
> +#define   VFXPF_TESTLOOP_OPCODE_FAIL		0xF
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h b/drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
> new file mode 100644
> index 000000000000..f92625f04796
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
> @@ -0,0 +1,118 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_RELAY_COMMUNICATION_ABI_H
> +#define _ABI_GUC_RELAY_COMMUNICATION_ABI_H
> +
> +#include <linux/build_bug.h>
> +
> +#include "guc_actions_sriov_abi.h"
> +#include "guc_communication_ctb_abi.h"
> +#include "guc_messages_abi.h"
> +
> +/**
> + * DOC: GuC Relay Communication
> + *
> + * The communication between Virtual Function (VF) drivers and Physical Function
> + * (PF) drivers is based on the GuC firmware acting as a proxy (relay) agent.
> + *
> + * To communicate with the PF driver, VF's drivers use `VF2GUC_RELAY_TO_PF`_
> + * action that takes the `Relay Message`_ as opaque payload and requires the
> + * relay message identifier (RID) as additional parameter.
> + *
> + * This identifier is used by the drivers to match related messages.
> + *
> + * The GuC forwards this `Relay Message`_ and its identifier to the PF driver
> + * in `GUC2PF_RELAY_FROM_VF`_ action. This event message additionally contains
> + * the identifier of the origin VF (VFID).
> + *
> + * Likewise, to communicate with the VF drivers, PF driver use
> + * `VF2GUC_RELAY_TO_PF`_ action that in addition to the `Relay Message`_
> + * and the relay message identifier (RID) also takes the target VF identifier.
> + *
> + * The GuC uses this target VFID from the message to select where to send the
> + * `GUC2VF_RELAY_FROM_PF`_ with the embedded `Relay Message`_ with response::
> + *
> + *      VF                             GuC                              PF
> + *      |                               |                               |
> + *     [ ] VF2GUC_RELAY_TO_PF           |                               |
> + *     [ ]---------------------------> [ ]                              |
> + *     [ ] { rid, msg }                [ ]                              |
> + *     [ ]                             [ ] GUC2PF_RELAY_FROM_VF         |
> + *     [ ]                             [ ]---------------------------> [ ]
> + *     [ ]                              |  { VFID, rid, msg }          [ ]
> + *     [ ]                              |                              [ ]
> + *     [ ]                              |           PF2GUC_RELAY_TO_VF [ ]
> + *     [ ]                             [ ] <---------------------------[ ]
> + *     [ ]                             [ ]        { VFID, rid, reply }  |
> + *     [ ]        GUC2VF_RELAY_FROM_PF [ ]                              |
> + *     [ ] <---------------------------[ ]                              |
> + *      |               { rid, reply }  |                               |
> + *      |                               |                               |
> + *
> + * It is also possible that PF driver will initiate communication with the
> + * selected VF driver. The same GuC action messages will be used::
> + *
> + *      VF                             GuC                              PF
> + *      |                               |                               |
> + *      |                               |           PF2GUC_RELAY_TO_VF [ ]
> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]          { VFID, rid, msg } [ ]
> + *      |         GUC2VF_RELAY_FROM_PF [ ]                             [ ]
> + *     [ ] <---------------------------[ ]                             [ ]
> + *     [ ]                { rid, msg }  |                              [ ]
> + *     [ ]                              |                              [ ]
> + *     [ ] VF2GUC_RELAY_TO_PF           |                              [ ]
> + *     [ ]---------------------------> [ ]                             [ ]
> + *      |  { rid, reply }              [ ]                             [ ]
> + *      |                              [ ] GUC2PF_RELAY_FROM_VF        [ ]
> + *      |                              [ ]---------------------------> [ ]
> + *      |                               | { VFID, rid, reply }          |
> + *      |                               |                               |
> + */
> +
> +/**
> + * DOC: Relay Message
> + *
> + * The `Relay Message`_ is used by Physical Function (PF) driver and Virtual
> + * Function (VF) drivers to communicate using `GuC Relay Communication`_.
> + *
> + * Format of the `Relay Message`_ follows format of the generic `HXG Message`_.
> + *
> + *  +--------------------------------------------------------------------------+
> + *  |  `Relay Message`_                                                        |
> + *  +==========================================================================+
> + *  |  `HXG Message`_                                                          |
> + *  +--------------------------------------------------------------------------+
> + *
> + * Maximum length of the `Relay Message`_ is limited by the maximum length of
> + * the `CTB HXG Message`_ and format of the `GUC2PF_RELAY_FROM_VF`_ message.
> + */
> +
> +#define GUC_RELAY_MSG_MIN_LEN GUC_HXG_MSG_MIN_LEN
> +#define GUC_RELAY_MSG_MAX_LEN \
> +	(GUC_CTB_MAX_DWORDS - GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN)
> +
> +static_assert(PF2GUC_RELAY_TO_VF_REQUEST_MSG_MIN_LEN >
> +	      VF2GUC_RELAY_TO_PF_REQUEST_MSG_MIN_LEN);
> +
> +/**
> + * DOC: Relay Error Codes
> + *
> + * The `GuC Relay Communication`_ can be used to pass `Relay Message`_ between
> + * drivers that run on different Operating Systems. To help in troubleshooting,
> + * `GuC Relay Communication`_ uses error codes that mostly match errno values.
> + */
> +
> +#define GUC_RELAY_ERROR_UNDISCLOSED			0
> +#define GUC_RELAY_ERROR_OPERATION_NOT_PERMITTED		1	/* EPERM */
> +#define GUC_RELAY_ERROR_PERMISSION_DENIED		13	/* EACCES */
> +#define GUC_RELAY_ERROR_INVALID_ARGUMENT		22	/* EINVAL */
> +#define GUC_RELAY_ERROR_INVALID_REQUEST_CODE		56	/* EBADRQC */
> +#define GUC_RELAY_ERROR_NO_DATA_AVAILABLE		61	/* ENODATA */
> +#define GUC_RELAY_ERROR_PROTOCOL_ERROR			71	/* EPROTO */
> +#define GUC_RELAY_ERROR_MESSAGE_SIZE			90	/* EMSGSIZE */
> +
> +#endif
> -- 
> 2.25.1
> 

-- 
