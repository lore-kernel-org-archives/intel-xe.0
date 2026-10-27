Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B84606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 19:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eF/xvZQp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0A010E470;
	Tue, 27 Oct 2026 19:16:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EFB10E470
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793128589; x=1824664589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qaO8av0CshQLBBtG6XpcCr+OfohKQYDcsIwYJibGXi4=;
 b=eF/xvZQp9RvWjx85/O9lZlxWlCiwxDDPCg7xV3qEEcdEXGXFc479JQBX
 ZfQY1k9vB11Z4lC52zO7A+j+MwYzLXiE2B4HgrRNRtE8aA4/xdbLbPRX7
 JSxkj2A2XJdXptgaK9//O//XPl2heVTnCf1lBGcgIW19EVGAQguyLAUxm
 3vPeuB2LA5p8R+l/TjkJDM+YfEgZspBRtBA1MPyDIVZ3AviQnyJLaygCL
 /Zs7G/mkOehnn6wUmCnstssa7hkbP8jxiVf92lgtFyMVaTRDmGQNeorep
 dpEGvvWUDX9paa32Rnj9HmEerWvnzn8/x2u6Bd0cuLvL5Do83t6MXceBp A==;
X-CSE-ConnectionGUID: sHoWRSkPTM6QuzqIVrjNig==
X-CSE-MsgGUID: g+2ITA2LTpmgOPKTBI0i/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1851833"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1851833"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:16:29 -0700
X-CSE-ConnectionGUID: IHNR2DbOQgCWzK6oeE+Rqw==
X-CSE-MsgGUID: bep5DBGBRcqQ3hxf7jI7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4736498"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:16:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:16:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:16:28 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQTefVEadv6sXJgQTLPrs5Uy/89KLWkXIYMAtsE2gORerc+P70am/5O314wAd1fxrhmmLEyP77BAxEyscD+UWqkEsfI7f+cRfMZD/sxp0/NZahN2vKlhZbLt6z3OqJxtdxwi4FmyKX1Hok8vS4Nuk9zq0psbwuKqfNookvx/WukdC0a6i0zPnuQ1RBdmECiYHSi57dVFqXXYyjeiqyzVFi9J8JYquKpvua4UB1P82VFIEKrtx6Xc50MwqQA4TlnHSdlPj4cB/44nAaQUjhjV/0tgEZJscMBLEIq8WB7PEdtvJgURasMDzpaUtbFhQ/OpYOAVfRkdFckAXaBSwP9SEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mhi/CRy8wFzTsb3veGGpoDZcJH7FOsySTRwkJCXR9rQ=;
 b=VY3B4E36sx6A6OVF3G/766m23X9OKTqpN0zwcEzXWVbwZWb5lkcFZNbx2Vd+J7QTQkX8xctlngUbyjnq/Ng9lwbnUkv0dvIrDHSpk+NpUXgmPuhB+BEd5/jSh3tZ986h7ywx448kiAppFyJB0eKW5uTHul7zdic+PoE6iIX1T0UNG2fEp35KUVN35++a1JdZmvtJp2D0r0MGltYts90PR8akED460p+4FFc1b4+DMxziIWgU+01QBNSPUVKW7G3R4ySJ1XyQpH6wTXOyniURoAJ+vzITN4Neo9SsTnqbYMQjl3GgZ8OEsSh7Og9srgI3t2xb9Z5KBRmy4DKh+kB7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by PH4PPFBD5C5E113.namprd11.prod.outlook.com
 (2603:10b6:518:1::e6c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 27 Oct
 2026 19:16:25 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:16:24 +0000
Date: Tue, 27 Oct 2026 12:16:21 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH 02/10] drm/xe: Sync Wa_16023105232 in xe_was to match OOB
 rule
Message-ID: <20261027191621.GB203565@msatwood-mobl>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-2-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261023-wa_16031259911-v1-2-b0453f79c4e1@intel.com>
X-ClientProxiedBy: SJ2P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::14) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|PH4PPFBD5C5E113:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9a815f-0b3f-4ca7-4f22-08df345ecacb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|10070799003|1800799024|366016|56012099006|261021123027099003|261026121527099003|261022105027099003|4143699003|261009223027099003|11063799006|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|261026140227099003|261021121427099003|22082099003;
X-Microsoft-Antispam-Message-Info: a0gZ7GkhZi6ppD2KE0n9pxpicrLhyoIXPLh3RhqwXuUXFYb88T41y/JwQPdZjTdqe7fuz1QknlZWPanCQ7sXPW1llIWqo1xbzhYFTPWWNe7T05wN4Jbc63DA2j9A5n+sByHDxiM+juhZIzJNq1hXxCKbBmJb168PofHG2nJSHVZTm7OrKm2cdaOE9nMatpqhkTiSnpu5f6bvligcRzM4jXjHeOzBGuMAbOdGEdYP7wFFpN6Pge8rGHz/1yTl6v+qZhXXxrux7UHTix2V4CdlcSJ55gMMVRWJ9hV8M5LlGjQ+1gDXmV3jzEm/FDGGa8GJxSIUsQbQLih3UIZDELkuWebQieBv7wPXmMvgo6NVQGMxtzD2aF0gndRMTXY9+a12RtHgjV871spkrEmaY2iP1t60iGE5n6XU77jFAsRS9wz6S0/JL1p/A5AkC0wlds0+/Kld1tA3dbBjllMDKyys4H/xaEYfxfezK1aCOJ8cf1de3XwpspnKX0tzXgPhguBG9TOz2kYy+gmXcxTvEBG+2YxCFea2Ed95w9RFBTu1LjA0BqcyErvMC7RXsn1bjy7bS3i4G5Xfg1vMlr/dsYOkRVTXABuCxu/dkvagNNrZpAATw69P41pbIVHphLhLV/mzTXozonnWy22Rmb+xtS0n6IVoAKHH2XepczgjBLI7UTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(56012099006)(261021123027099003)(261026121527099003)(261022105027099003)(4143699003)(261009223027099003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(261026140227099003)(261021121427099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ys0MRC3gOA8VG9ECp4ebVO18rg0qIOw2KAMlhCDrwA6xHTbKceDZU5al1i0u?=
 =?us-ascii?Q?N7Tyj+R9Gys/nqNvcdtOQroFbQO/4OD0s5eABOx315DWFOHG92ucW8NK4nFz?=
 =?us-ascii?Q?l03II6+OAgggZZXemL42NUCa/DH6PH7x13PY2w6fYdwQKxU2NDcy1As8Q2Qs?=
 =?us-ascii?Q?ii9nB+bEGu2zTmdVIhBhec4JRvTjhKnRFSDqHTbaNO7ORI2Cz2az3j391VOB?=
 =?us-ascii?Q?AQiM1e7zay6IG9PHVfXBQlIzwgje7i+h6fhiC6BSKL6jc9/rRTqwumB2AhgY?=
 =?us-ascii?Q?SQzlcjOVP0of4Si9G9/hUXpEjK4dVsN93ywZim5PF1jm0T+pLTyIPHyWETkP?=
 =?us-ascii?Q?KIgg0mT+es8sY72howRowaYY+6Hfubi2HMpq+lHi07ewOGggafyUPDzN6il4?=
 =?us-ascii?Q?NuZotKBwvd/DVD4DmgEK83ieH8DQVGfMDHVFYotTdn7HT5PaMExkQceKiSYQ?=
 =?us-ascii?Q?2GVp00ITwwynZ6dLa6sb3duO7Za3sOamncVIYnVCtFsSSHDzxxhP1R4HFFyU?=
 =?us-ascii?Q?FAMWmwzOpYxFd4VL9JrajkMWWtpwH3aYzFfJkWIVybEBYSIOFqK+hS6AY4Zx?=
 =?us-ascii?Q?25a0x/6acwMgGRD05v/gV/AdOwqkYNktiBIQubw8CXYGGnInEFzj8CI/sCMb?=
 =?us-ascii?Q?vcIbZn6pdaHSKhq3ZZ7+QkmGMfsIeymswu81194139dKSZsItRkn6BvC6g9c?=
 =?us-ascii?Q?g1w3f2yBCD/s9rodb4DHRObh14yWCpRN8Mine1jo1vbNyxEph+7GMp4OzZFi?=
 =?us-ascii?Q?bTdwsFGtAfRWS3TuU1eNPHzbVlhrUanKTFN/rqCwqsC4/OGf3xRufXfvTi0r?=
 =?us-ascii?Q?N+CKtF0JoNFYUZcByIiIRJfwwDMnL6/+DEfwCI6jnN+24HCUlx7RN4K9FlVo?=
 =?us-ascii?Q?kzYMRlC+zm6m+nQDL9wK9dfQNz14Htg1QTHEz537xDbRNl9NHpiyYUM54Cjd?=
 =?us-ascii?Q?qAfgwkB1u/DiHiBUD9PkdmQ76fFX266uR6KTHN+Qq6ygT3l/hTo6p38NG9wV?=
 =?us-ascii?Q?rmSFbNqCeqaFWIMKbRdJr+8BEPQUO9bd2Cd0uPHoNcg+u96NleRO6cg75T3K?=
 =?us-ascii?Q?b65dPjQo0B4sDV2k+4lAqB5rQFG8eHsTBEOS6lUrrHbR4RjsBApFQ5xXG82O?=
 =?us-ascii?Q?qRc/TlWDdCZ3ZqWKOmtNPg/zpNXnivEWPOUnyKaMfL39q1jalQMYjlmBWGlZ?=
 =?us-ascii?Q?PzHK4XaXVQLqW6+8h8vhxrKNKrIZum9CE5v03q1WQzxajUWQustgHJnKB33l?=
 =?us-ascii?Q?C6/5TDVHyBsWbofl+7o0wub+YiNF/nczyY8OxxqWkQzrmQPRUS8P/QhBvgMv?=
 =?us-ascii?Q?a+BnGwCDr3eAeMC+pRBGedIj9A3n1f9B7QJkR3wqtfEY207wpittCdjCU/re?=
 =?us-ascii?Q?naIgXziU5CcgGIrFmxCMP3QdUJKYAIy23VVMSoLPf/wPxEaHjpCm7RHu7nhw?=
 =?us-ascii?Q?9fw1GGFINbZcB8jTfwaYxdf9PHWhHhy44EXOL7mNKJYrh2coYi6qlgjTJgEw?=
 =?us-ascii?Q?eW6gshHiYvZ8+47M3wGYQQaGMIh+kYrLuVmmtdh/vzMaAMFEDHsfFl2lvmZa?=
 =?us-ascii?Q?tc00kmHJYVGiAymgSHSVTwngIi4qpkkd8O3g2AwaNKvNAigFSiUiSrbMUC9f?=
 =?us-ascii?Q?YD/7MDAQA4tNYQHJV5whTslKWb/rtuPw4mxwJ3Iuy/ik0WbTWwJcZOA8LMzu?=
 =?us-ascii?Q?F08zpxcnb9CFPK19hz0sIkz6rr/za1cvwn7cuPjKIYmxQP06wHo3bWLjeZt2?=
 =?us-ascii?Q?Nd+wrDnVg7YuY/ARX0gDHhtzETgUzrKsfSgZ+ZkAKCZrXfWMnBwPLfCdGzQN?=
X-MS-Exchange-AntiSpam-MessageData-1: NPSkfRhZqoXUo6WzWcvZN6SGioZL2NDjFII=
X-Exchange-RoutingPolicyChecked: Oj8nmywCCCknVXFctskpt9vc7OS7AHr3Z1XjXcr8siSQxBqmqRFlmfkuWact6jgsajGnYY4VcKeT7FWPTZtKZIB8DX3MfIqpxsyDZboAu9vBtOwPMV+cKv/Crjrm6VXrd8IPavWQ7ek0d0fSoZRooio+mNWJlFVZGIg1cloORlw6yEHS8OXLA7CxotyWQJb+/4KXK5ToNyFpxR+Dv2qCIhnKjKDIHGOSyHmGh26RYn7HXVBJ/dSU4HBfszkAOLlZIpbZCyIwTjKMAO3We9cJJfeBFXjxfNVlIclbVQdnimPoWcnJQecZargwk9Q550L21B3DJ9yu377K8flIubPUxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9a815f-0b3f-4ca7-4f22-08df345ecacb
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:16:24.5218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMyYySw4Ja5NdbFAj9YqilPJGfc0GuUykwr+ztCXNmYPmACPMNAiLX2G5FEdw4W0HkKP2IiRC8Be3Cg2yRPX3TPkQKsnAvw51oA2/1awQeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH4PPFBD5C5E113
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:09:30PM -0300, Gustavo Sousa wrote:
> Wa_16023105232 was extended in xe_wa_oob.rules to match extra IP
> releases while the respective entry in xe_was[] was overlooked.
> Update the latter to be in sync with the former.
> 
> Also add comments in the code so that we don't forget to update both
> places if new IP versions are added.
> 
> Fixes: c96e0df4e9f5 ("drm/xe/xe3: Add support for media IP version 30.02")
> Fixes: 4fde66699f1c ("drm/xe/xe3: Add support for graphics IP versions 30.04 & 30.05")
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c         | 5 +++--
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c94fe7753f9a..bbe1696a57bc 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -581,8 +581,9 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
>  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
>  	},
>  	{ XE_RTP_NAME("16023105232"),
> -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
> -		       GRAPHICS_VERSION_RANGE(2001, 3001)),
> +	  /* IP versions need to be in sync with the respective entry in xe_wa_oob.rules. */
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3002), OR,
> +		       GRAPHICS_VERSION_RANGE(2001, 3005)),
>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 6a1d5250ba1b..9be392bce969 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -44,6 +44,7 @@
>  18013179988	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  1508761755	GRAPHICS_VERSION(1255)
> +# IP versions need to be in sync with the respective entry in xe_wa.c.
>  16023105232	GRAPHICS_VERSION_RANGE(2001, 3005)
>  		MEDIA_VERSION_RANGE(1301, 3002)
>  16026508708	GRAPHICS_VERSION_RANGE(1200, 3005)
> 
> -- 
> 2.56.0
> 
