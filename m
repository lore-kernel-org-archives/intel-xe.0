Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC108C7EE25
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 12:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942B510E22B;
	Mon, 12 Jun 2023 12:46:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0EA10E22F
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686573996; x=1718109996;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=uB9lHIUcUxO0z1YVcB2RuRMz8wc5GwnsZMx8yIv7Tik=;
 b=Qx6zJOVvQtsTcBf7Io4hEzBh+uA1NLN5bpToewjWZwvCjP2gyfdhxI9B
 4EVlkQhqjuAlRdTGeBKwuMc4V5cSet2MPbG42dXNqmSF2bAEZOfLLuMsB
 gwKROaFg+S/UeQDcQtY98GnpjVBjNwPwkqsUAIQ/vPBuHupRjZwKrN1B9
 TVnxcg6NTAlFcJKrA8XAYkNpQ6nfNNc35rbBoefLK+cs0xCeVQNFqsqLq
 2v6Gd2Ly1XvpFEBBidEJjWnai/UcyDtd8r0MvDexEBwrYfUZi5CHoLKzH
 P2R8FztzLXXahcLns9IY2bopgRu9iqY0ay/exUW8Z+lfVuTwil+5EwGDt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347675949"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="347675949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 05:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="744320098"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="744320098"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 05:46:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 05:46:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 05:46:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 05:46:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGv2dUbTbgIcif/Y8eFM7Zi7cLLxFSdJlhlIQG4vdVzaD5CGhMdUkAJsFtVcxUOcuIWwps4QNMD9b8ux51kP+EtuFjS9MA0pPe5NC/4oBYtTpV455yLh0zc5JJGixcKRaRxPY0ZPCsQ23ZmJU1k6V7wuSSe2x3IsdGoZ09IaAQITS6xG9DLjvlSXDjnT9CCFltiOv+My94+nwv+bpi/GeDqRHxBVsWTIyCPVgDJyyVqN1d6nqYq4kzciSMAbB21Hs0y3tINH8tsywsTI+pW1MQbULNzu5dhEzk1+jiLTboSeerRrqd5UMuRXt8TKTatr3sN8KJ6k3H7OkJaqWYR/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDam/v3R3YEdF4Om46yVJHv4oPdq7f0nnWCc/Fr4+hw=;
 b=hG3GyVEp49YDmz5h9FD3LhQja+rqdgb1PvYxKRK/AH4oULQvPr4vRLpHCrQFVEB2ft/7HUAnB3v3+2y1Du60KKKOUT01hHmneGzpsmoyysY8Rdhh3MQ1S46p/BLGDruaikj5IfKcvGMMiqIyQXPvOwNUKm2avRnlt2XHU1RCtsDr3ELxc4nneGOk+lnMR9OH/upNUQN7VcBkm88dT6KMd0UmDdZKKR7p83+mx98OH0tRRO34CYm9csdAmc07jNNQHkP1VEyJ8EENNGQAqMkmSHy16HR0dIUHIlJxV5DifvUVoaYB5jW+lAumrPA62YnbMCpX18xdLCFl8rJx8E9w2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3567.namprd11.prod.outlook.com (2603:10b6:208:ed::31)
 by MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 12:46:22 +0000
Received: from MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::8723:ca8a:452f:6e4e]) by MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::8723:ca8a:452f:6e4e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 12:46:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230609143815.302540-1-gustavo.sousa@intel.com>
References: <20230609143815.302540-1-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 12 Jun 2023 09:46:16 -0300
Message-ID: <168657397683.20418.13007343073719802883@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To MN2PR11MB3567.namprd11.prod.outlook.com
 (2603:10b6:208:ed::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3567:EE_|MW4PR11MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f7205f-3492-4ab8-2bd4-08db6b4306bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fM9DkpsSZTUggaqiaDh5rXTqMRL0lpxzqpT1KBYEJoNQfb69TbWMy23ylCGu4qlJqcPw9blsHRmy7oifCJw70yrDdsUrkTvnoCnzH6AevInpxSm5FrqNiW7Pv7FfddjqutNGkhnp2gkp7sc2Q2Mhu3foYDf8k7DHEUGVRUyFgWQYDw9KmXQ+sP0QYSN57NvIzVIuUkht9Feo/i8hQKv4J2B68H9YVjMz8Z/hiCuY8IfuJcalHle85WnTPRfNz8dTxuPVCT+cvqfUBlr/kyMVqZL9wRxI/wAVfVijcXFmbhPEzjW/iq5YMP/FOuDc4nrd/WMvX6PpiWS6CMDJsTppdrw9J3ue5xD4fkA0Obrt6zkSoyZ5BALZ3hhTptUyUWIIEHJlW5rTchxj+ep6tX4wlFuM5Yu3XjiZeiFEKV83GB3zNNSXMU7pMe37Y9S2+VvlgJK7H7uudfce4tGr31PEOleyevuYem5hTBJB/B3LfjTFTxdsH3rqSmDr2lzBvpV/jkXy/ZsWz0AsmfNT6jnTO+6j0ZkYWok991NYoDmurHZt5GHbEfRc/M23qzUklBjq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB3567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199021)(6916009)(4326008)(66946007)(66476007)(66556008)(186003)(478600001)(4744005)(2906002)(54906003)(33716001)(8676002)(316002)(41300700001)(107886003)(86362001)(6486002)(6666004)(6506007)(9686003)(44832011)(8936002)(82960400001)(83380400001)(5660300002)(26005)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFYydXVBb3N2TGNDMmNyL09lU29RTE93SVlmY1B3K0JXY056MHRMTUJhSWhu?=
 =?utf-8?B?cWdIaFhDUXZSa2lHNFdPd0FnWUU1anQweHRndjg5Zm9kMTUzT1NtZlJnSVNh?=
 =?utf-8?B?eXM3S0F4WmIxZ2ppdGFKaEw2azRHR3JmL3JlaHp6SnlMT2RLSm00bURQVFIr?=
 =?utf-8?B?ZS95dnhqNitSaWNxYmJsQlJoSy9wSFc0TUFndEpIL28zTmZoekFTanZYbFM5?=
 =?utf-8?B?VENqWWwrQmJDV01tMVI0RG9VVEhZcWs1TnBXZGxFRHBxeTNzQWpvL2VuY0Ns?=
 =?utf-8?B?THRieFduZUkxVzk4SGQxUWxrcEYxUDdVamZwVGJFWlVCN3lDR0YrM01YMW4w?=
 =?utf-8?B?NUpuSjZqb1dPdWxwbURXUmFWR01ESVRIMG5OTjRCU3FqV1lkdXo4d0ZxTC83?=
 =?utf-8?B?QW1RRUFocnJXS3J3QURHRnNsN0dPSDRYMlExQUlISllHd3NlS2hGb0JjUWc0?=
 =?utf-8?B?QTgyRWQrUUpiV3E1NVV1cVNyYTVSZkFRRWx3Y3BNYVFYQ0xjUUJ3R1NIUnRW?=
 =?utf-8?B?UUVibGNuN05jeHR1VHNFR29BUFBZcU9VeXpya1VsWXdNUTRSdVFXbWRzQ3c2?=
 =?utf-8?B?NFZoc3NQWHMxZyt6R2RiRGhlaGVEYVhoRTEwSmRSamp2RU5jdVllem5JUDdW?=
 =?utf-8?B?VnI1MitsV2ZpelJDVjQrS2ZOOXd0WDF1cnZ4VTBoSFByYzM3dmZwT09YdVds?=
 =?utf-8?B?dDl4S1MwT3dFSW1qcHlYc3EzYlNpa2RNcFBGZG9uMHEzc0VUWWVhaGtLWXVq?=
 =?utf-8?B?N2lGcEhjQlVGTWVPUGFPZ1hCbjFITEVIWm5icWJJejdSSlVkV2lBTEN6OU4x?=
 =?utf-8?B?WER0S3RPSmVJWnZzY3YvbkRDWmdKMlM0cXV3bjNSQzE2U3RFNmMxL0pTMjFR?=
 =?utf-8?B?N0J1ZkhRVkJTU1BJS3FjYnZKTUtDcHJTd04yZ2NZMVQ3RDBZb0YxeGFGbjFO?=
 =?utf-8?B?cnlRdXNZREl6RXYwMm9OMjgzc2VCaEVsdTE0U2FHQjdkTmN2L3FsN00wRUJv?=
 =?utf-8?B?dS9CSVlYa1ZYTGxqa21wcnI5WWc0Z2Y3cTlkMjgrV2VWUUpKeVF3Z0lPWEYr?=
 =?utf-8?B?NjZQRXBKQm1lUjJrd0lwV1BTNnFCRytlcFZQdnhpQVMwN1JDTTduWnVVclIv?=
 =?utf-8?B?NkdVKzRxUWxPSkdnVkd2WHVqalRPWDRINjZOek1qZ0JuOFp3RFpVTHpGbWRy?=
 =?utf-8?B?a0tudXpDWDlyQWpqSUg4Mk5hZnZueHg5VW9WbFlTV3g3T3NyWEFGVFdncThk?=
 =?utf-8?B?WlJEOVJVWnJEblF5QlRyVnlMUUFseCtTcmZ4ZXZZS1F6Mkh5aWdPWlFNOG94?=
 =?utf-8?B?MWJtZ1VtU09jTUczaWRBT2hYVEZoSWZxa3k2MFVyTmVLbmIxMGlkU3dYRDBX?=
 =?utf-8?B?aGh1NWgrT1NESFJlRWcyZVgxV0tYNGZEQmdLTkZYM0FiU3BoUUJQeTh2T3o4?=
 =?utf-8?B?OTNTbDFUNCtkYVFvdXgwNjIwclBBWnY0Z2FEeG9qQStVbUhBc0RvV0tZUmti?=
 =?utf-8?B?eTRpN20zQXZ2bk9Rc3BGUDVSbEo3MDJhMC81cFQvRzh4Zk1ZdEhSbW9qNVBI?=
 =?utf-8?B?SG9EdzVSNm5DRGpVT3NiaXVzWHRoVGhYZ1A0elRaOE5GaVJvazNnTmNRK1h3?=
 =?utf-8?B?NXk1c2pkUnB0bUVIVEZwS3NzR2xHVWZGQW5rWm9HZWQ2T1BlellMbG1JdSsx?=
 =?utf-8?B?Z1VqQWZrYUVVMlpGcnYzcTBLOXd6NWhFV2lWWGJRdEEwNUJqdVJRTE5qVmlY?=
 =?utf-8?B?bC9adWdjbjRTcnFtZUdBVEJwNWhsVHRNdUFsZURxLzYyNkY1dGVRbzExMTVr?=
 =?utf-8?B?bTNQRGhYQUNyVVpVc2FMRTI1N1JvMFQ1aDloSWNHeFdUaXo0N0hCV3VmVGhE?=
 =?utf-8?B?VmtTOStLeEVyM1V1WEVYMmt2OU5mWUFIQk83MmlKTll6VzQrejZXNGZHWFE0?=
 =?utf-8?B?U1h6VWhjTVZuVGtSYVdZN0x0dTAzcnE3SjNXR1VyWEFuY2tTNEk4UzlsMHhF?=
 =?utf-8?B?TUtXdmRmSmRXakNmWU9adjd0Z0U3VWg3VS9IeFkxV2VOS1plTnhob0gvU1c3?=
 =?utf-8?B?ZkRGdEtZSXZtcTBXVjJYeCthd09YY3FpSFNVYTNXaGpXa0hJSEs4VGp5bm8z?=
 =?utf-8?B?NnZUQ2dXWEk1eU1ydXg2SUQxaExOaU52d2M5UGpKQURCK1RVdGN2TVY3VXpE?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f7205f-3492-4ab8-2bd4-08db6b4306bf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 12:46:22.5627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QRye+uaIdP9pEEoLgjLzC2GdB2ofDptPDA4HbP4nwue/oE3y741hvJAEDJDSR6ODMkuupPVet1CeZyA1zoXzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7056
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] drm/xe/reg_sr: Apply limit to
 register whitelisting
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-06-09 11:38:13-03:00)
>If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
>slots, then it makes sense to refuse going above it.
>
>v2:
>  - Add a patch for using a single parameter for xe_reg_sr_apply_whitelist=
().
>  - Use xe_gt_err() instead of drm_err(). (Matt)
>
>Gustavo Sousa (2):
>  drm/xe/reg_sr: Use a single parameter for xe_reg_sr_apply_whitelist()
>  drm/xe/reg_sr: Apply limit to register whitelisting

Applied the two patches and pushed. Thanks Lucas and Matt for the reviews!

--
Gustavo Sousa

>
> drivers/gpu/drm/xe/xe_gt.c        |  3 +--
> drivers/gpu/drm/xe/xe_hw_engine.c |  2 +-
> drivers/gpu/drm/xe/xe_reg_sr.c    | 14 ++++++++++++--
> drivers/gpu/drm/xe/xe_reg_sr.h    |  4 ++--
> 4 files changed, 16 insertions(+), 7 deletions(-)
>
>--=20
>2.40.1
>
