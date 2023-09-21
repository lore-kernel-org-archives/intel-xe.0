Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB459E71092
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 16:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708F910E051;
	Thu, 21 Sep 2023 16:10:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB5F10E051
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 16:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695312604; x=1726848604;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QdeNKfl3Sjo39E9AbtcXODM/K8QaKbOsFdP1wLWG55g=;
 b=gpPrL23pAu99ewsJBJ5ctXR/KCcL2gLz4eIgEAvLUqbUNv4Zxw2X9ZtJ
 9Ses6W3spdLvbWHiB/wlLgEWI4mDs74/uQ9zt2tvdZr320YzN21i13VBL
 31wnbzaNSPttIYZKMuqmgN26jMDUvyb0AmQMVvUcFFXkSU8bw0TGNOTIW
 ybx9uQJETUXEXsP/dbFCCozzQ7qnYGcNY9/wqfmAWnsSI4V0VHsFnWN9+
 Vtyqk7EDmwebPRR72Ow2/qeIUyMSyyLm4VYihUOZ976ljA2LlhNG3xsVj
 f4PTiKeMo1ahwsVG0tpiHCnTummxxpAW9ExhvvhIChz6GluWEgTzOTvvM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="370890200"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="370890200"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 09:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="696785373"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="696785373"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 09:03:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 09:03:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 09:03:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 09:03:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 09:03:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aySxwXF+qfh2DBZ8ij8BAi232POvQE3nVnzlOuQuElJOQpXsvMVvcNzOHlrD8YaQeMr0jyrHobm3dGkV6MkMfxhb62JVpe0Tc4uFQo4VPgH63gGxshFI4SM24iPtSseHRD0kV+cYOHUi7khebW2xgLLrKPtZg//sMfkmIgGgZjr9u77byDPipG+M6I27k2qSfF0OkTE64LyyP0NqWMX9LGUS7Da4RDVsZ70oKp3FFnYgPQdN0iZW0B/5KpUeRqnVcp6iH9YYLW7mDeD3fk3NXoBkyRZosfwJQREQpWKT+q6gAjjGrqGDaZ7B5TE3hpVyO4rCg3cP4tXIwRa5bhON6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMNldUmoSY3QAwUt8UagZUW0iAIBantAGx2IBxPDTao=;
 b=VIHRouRtwOrwgabLU1S2c+TPFem+4EvoiN+zO8ZzWmZjOIXV3y9JC++lj32AM69XTYUJ0vScyBKlMbBZzl+dEgFJBzjVPQJgZOhuILSnxFwHOcGdonl/sB0KqPoi/V738ij5Pt/JHLmzn7gtkJwtF1hxcPbkohUM5Ux66TySFdJmfvtfQVECGo1+AazC4PS/MW/tR+G0qTUf+VSrE8/uYXHXes1H4gmfkMXZB41+IoEeeACqx1CNOqu1ELSH5TQE3MilNU3GDgBaTxDLKfWAARva8k5M57zVak5rbE0X30keC0FteMpGXdo9X0UV2veqrP8d+V0SBLJ4TUEASTByQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 21 Sep
 2023 16:03:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 16:03:31 +0000
Date: Thu, 21 Sep 2023 12:03:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZQxpTss3+OYdbJks@intel.com>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230921102519.3355538-2-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: e70ae996-432c-4239-e69b-08dbbabc4d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjlWfcdP6pwmz/XLS7iadhUv2NGBwYYWsH9mmO7G0cAVOZQ4jzyc+j4G7RVLQyQcr0BeUZPP58qmwG9wGurO1kzva4U8+akkscsu7vx6yYgH39O4EDJyqtN+ZJNUHT+HebPjfuupPn2JzWN2DQCuIPpawoS8Z8PqikEjsqZlY6mDPnQ45d+q0hem8ktcQY+1EuTYbMpCzswZmVAhSt/KG37HHC7wLAN0DZ/Hj1qjw1l8IWdfRhmCHS7KAHp/B0wnneEIJNYkZv/XinyFJXnogGAGe8la+4mhaTWZRQWPi9OMcrVS3OcuBIqwTSItc/TQNEHbbE5Lza/mElJ3DNeQ0ptjPL5irFBygqDRx7WwyUff4QVylkPL7P7tPplbBnUy8MuJCbjckfLccyTT4tZFQIIF45T55GJhTAURdnl5W/e0dJdZkiNki2tzS6bIwcBt11/Ov84XBa6alYira8fZfNEKEzumHId0hZvhyMiPuyCoH8k7u2AaHCtB3qQK6CCowERBG9PotOi8hvXJHINv8lkG5HEqLIBVnm9HWfcl9HQDnTWZzVEDBThuBbQjILAvsTziSUzKbkFL6NCoHkRl5ZL5H+ywlEmrU8kd/9JQCPI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(186009)(451199024)(1800799009)(6666004)(6512007)(6506007)(6486002)(36756003)(86362001)(82960400001)(38100700002)(2906002)(4744005)(44832011)(2616005)(478600001)(8676002)(6862004)(5660300002)(8936002)(37006003)(4326008)(6636002)(66476007)(66946007)(26005)(41300700001)(66556008)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdzpXwR0LeeoRsKRmUTKflV+lv6CjCpe1Z1jmZyJXq++15R6931kygSIqqiX?=
 =?us-ascii?Q?zVOn4xTGyOJu3oQqvVNfF7NBYCsHI9cmf+Vo/HGneUaoTEh3PvkJ8yMY+N2z?=
 =?us-ascii?Q?pasZdWCf/agW9xSz5GINJKVKLgU70UhKVL7x7ZquZOgM1MT1wyx6ub5jYpZF?=
 =?us-ascii?Q?QJfYx51sYZ6fUSncZp3rdjbFoV6LLDh+2ppMOCcYBFELbRdb5m3B0rWTU98j?=
 =?us-ascii?Q?jR69vSmrzV94lYZIZULwf2A0UM527+FpF2/6BccSYAsSuDUgS8GIlgzu3c3/?=
 =?us-ascii?Q?g0w47fFWwUM5CQbfiESJuKPxc19qgltRe3KZvpeV4XkHLms6KDigubQ3UEN1?=
 =?us-ascii?Q?D0L0HDhD3enpmx/nUD7pSFYPD2Y3ZBhkH19PSYITQh6EQbdKsBp3RQiZLcAh?=
 =?us-ascii?Q?nynVKJ9v2Rayi5ne04D3NvdtOK9OfNuv/E+fF7sw+I2PX9+UGtSuZ27bOlzU?=
 =?us-ascii?Q?AohoBYOyb7jyVx1p0Snk6yvHbO76M+MUmnCE03uBS+sosyZWvli0FyNVhlhX?=
 =?us-ascii?Q?ig9bueQdIWglF5Xvt76YcwDqrpLWs4U8hHWz9jIG72JdXw+NjlB+v8qWNsnx?=
 =?us-ascii?Q?pqf6mpY2g5N1Hsr/vsxZyCN+hJY5/w4TgeWJE517s0qd/gyii/uD1+Bi423l?=
 =?us-ascii?Q?N6A2yVMhRfTzC/DxX/BntVjG5PY3c8Fi2aCoHIibnaEiATwUbyjXzI7/Sch8?=
 =?us-ascii?Q?3XGgnXL/HRT2sBP5vkzWP2b+AXEqLPqagLA1+4ZvS6NqcT6r8XSYOSbBbmnY?=
 =?us-ascii?Q?VuK0XNn3bLzGjAudKdoCydCoAMIQXyt6dc0hl1F4zFaTkurw+qf+GJHc/BFM?=
 =?us-ascii?Q?MMNVYZD7f3vezmBCE5Q8LVVuP0Nmh/B5f4h2NPn+3wYHMjaCj3L7gnWXJIu3?=
 =?us-ascii?Q?FpXRwX9vAnEx204R+6pnqIXrLa8rRjdYTv1yC0+TqkDbA5cgsolTE5mc1fjI?=
 =?us-ascii?Q?r22m/CBnU3SYQVNw+svSPsIxHHe0A8kqEkTsxaQuMy6sYp6l0+lja7OlOTgh?=
 =?us-ascii?Q?mxIy/0twl+2C8dIgXQE1lIIdfSLWDRm4XomMBpt/p60houbs2v3nlP6b4BOr?=
 =?us-ascii?Q?C+WJhk4Vn49ihdrCqY/pW591sqd3hp8NLzIo61ARA4qlbChNAC7/Rnm+KmGL?=
 =?us-ascii?Q?ei0BW3ub/TvuHI936oacOjKkpezlvVNkcGYzX4to5q5+3W8ttUg992skqQiO?=
 =?us-ascii?Q?ez8jMfR8HOX/988lHeQQj+mfFmUfdY9+eNAijoruPUJXP8SBKgjdLDY+jWGb?=
 =?us-ascii?Q?1vgpqEXv9GMuR1+J54nNaAlBYCHzdGO1pKIcs+cVBUtSZWCPQAkER9Oo/ArE?=
 =?us-ascii?Q?BDLrlm3mQvMffO0st22pbxj48qfjliRiIB3iSqyE0LWT+7D/P/xub/4iwBrt?=
 =?us-ascii?Q?mevxRcZEIbV2cRTGe7VC3O79t8/IbCGtkchBNUc13b9ZE29EwdtmOFXb0rSF?=
 =?us-ascii?Q?HqXXs495sWn+rekjJZz4JYEUHSdBla5rkjuoIJZNzAGQ4DOwt9mMQpYgUkS6?=
 =?us-ascii?Q?CPwEZWlN0B1brTsqVefDwggTTgb9Eb/vgYF3joo/EYyabvpQQ9mvN2skwN+8?=
 =?us-ascii?Q?5V1Kawmu+1z0FHBQUfT2rIIdtTvVeFsuyRqeGXj/5IsCIK0vIckyKg3s1goP?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e70ae996-432c-4239-e69b-08dbbabc4d39
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 16:03:31.8067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKkKILc86q9wo8u1uK/aiob77WHOE6+7uglMQA1CyN04XHm46C/a2wZ0m+h/JhpIgP8X0TIkYEjGN+Z4vaCBRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 03:55:14PM +0530, Badal Nilawar wrote:
> Add XE_MISSING_CASE macro to handle missing switch case
> 
> v2: Add comment about macro usage (Himal)
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_macros.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index daf56c846d03..6c74c69920ed 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -15,4 +15,8 @@
>  			    "Ioctl argument check failed at %s:%d: %s", \
>  			    __FILE__, __LINE__, #cond), 1))
>  
> +/* Parameter to macro should be a variable name */
> +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
> +				__stringify(x), (long)(x))
> +

No, please! Let's not add unnecessary macros.

>  #endif
> -- 
> 2.25.1
> 
