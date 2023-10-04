Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB29E7C4E9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 18:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9667710E3AD;
	Wed,  4 Oct 2023 18:10:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6AC10E3AD
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 18:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696443014; x=1727979014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cfHmapUvFBx8Eut5y+/GUywb/SbJQJIOmR23qF20vY8=;
 b=IzuOgvEXcfz9sA26X4vJP6RTkEKu08OnMcjZRZKfGk7KfbYuDhDfKhpF
 X/Cm3r5Gvr99/DxoYRLUEtJV/lVoc/WYJs61YCjNvSSFiNFAjmnUoxj9r
 LFQ/l4MkyVE5zq1HWv35YZrzVvyFb8Lx5gyTUuRffy73R6An4IrVOTmvx
 nZuaGbkHlCNRAJSRaCSNkJ98jFP77vjGZCn5LtmaZCF+wuDzWfmdbg0y4
 WKFkGd+hvmR/JfH1whD7MeWBy7Pv/pQLopK/S7HCjAkbwxun17gvzgc8i
 FYQ6b8+mwniVbGpUnR+N22w/P2WRzUrNIYoo3qlhU2NjHCf0BU16qHOSX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447442110"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="447442110"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 11:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="841992337"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="841992337"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 11:08:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:08:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 11:08:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 11:08:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkKj4RorQZ7gaNOm0ZAmcLEIwlqeR/bdDXcrCMDII/JdY49vR//j2c5QmsvOn1EJkKjO617+1M6a39YeNaWVjDRLi6ySRCptxFUWdaJxms+ppkTWkYX2WOq5kVdL5rGFYkzc9prmYJELgZUTtAzSnS42s0gd76mvtjrUr4wwcWw+iClrRRMGN/2M0z0ORp5hLVhmMOucHQMMiIMD4EeO8BRHB+54NQM5a9JiD7CcxHuxvpHKBiG1OoxKO7xwqxdTLNdOwNd2/Ec6fXd9BPTzlaxJvwxWvE7BRcBjSmWkXjVkoAxndjKFb+UyUw2Ua1XDCINIuYS7FSaoEi7wrh+1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UL3b0IPuneZZK9DjY6XmaFVModBP0jeAT+sEIK2SKvA=;
 b=Yj0keooSHVndEKwK6tzmqAZc9TOE2v0KuiYOG6ekykftjYCxSFCFY7yFSU6SdbG4DS3TqMZWQa5M0Z4SyDTCLXZ7a7hrdPNMb2PLwHbQCAuLDjJSPpK2RfRQ2gI2cvFq2OO5Mat7Zq99C2aihDsq9kpAmBtIi/jHwA8vb2Y/KYEra+yC5d0JvoNzQCTnWf5GbZ1TXpSNJKXocNlsPQJPjhpTKZR0e7jfqOr0jwlOO8bO4HzZjwkmsnBTenTZYm4GQJ6v+3rBNVZ4MzIztAgEK4VEwBvC6TemTaTFfqSlhH9O4WcA1Rz9gj8Km++KFL12NJxzU+v1fPc2T/ANSzChqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 18:08:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 18:08:29 +0000
Date: Wed, 4 Oct 2023 13:07:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <ppfgi2wffuysszopbntugvcpezmetisitgmughalbadozy2nfx@4wihb6ycbimn>
References: <20231004130824.13909-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231004130824.13909-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:303:b6::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdb71cd-3a3b-4bd6-74d2-08dbc504e959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsJpg6+8EcCvtyzglalpnndrjbVlfrvkL9kKi1l2kn4BYDpKp9YFDAKums0tAicwaxK0pvlJhoPiUDmhFcrODYFGq5YfdwkbQmioIQlVXLQ2sxmgoZ1sjHh4R0udSzEjQpVB7ha5QT00s9/QcmIDQ/vHxBFpl4UzusXmknvDFBJ1oQAFhnkN2aE008TxKR/UDWVvlcMxAmNW91ujjpuljM2WdOiiR8WEOVtVfDrGJQs4sKLu7GRFAdtKizfFpBv7cjO83QDUG2jybxC/4oJHfu+Q4+ymH2mlLSOIEFxLQmXfYytgOOFoqGlAZn3aOkskAgh/ZP/mukhUt4xDE38G8yx197O84x+z/pZ374npaLP7shhuymt/WaOTUqQTTG9xTY/3vhkmBQRswLiUu2wSCYCZRiZsYJtQldnOxHz2gbwQ0du4WQ/2dJg+m+QoxASrdpGQRQEb9tPrjpCQLyNVbiX9Pso8hrNB3ecrrcCJh6yklP1xZDkW5KqB7kfnrTQmDIz5Xd6pW6aW6r7y91gD6XHrHBsoEHvLsPeDd+BotOJ1xxb8g/A+w2WsrUVlB2LA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6486002)(26005)(478600001)(6512007)(82960400001)(6506007)(38100700002)(6666004)(8936002)(4326008)(5660300002)(8676002)(6862004)(33716001)(66556008)(66476007)(316002)(41300700001)(6636002)(9686003)(2906002)(66946007)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QOSGVLZBffFE/cw0uVP7RCEPKdrJ/e55WSly6JZ6z1gfxda9lBEU30abFA0B?=
 =?us-ascii?Q?8OjWWfPrP7rKFf0Wf1ZwQgPIQhvKCUJDaem3falWRWlVpXRxrC/27AAaj5wN?=
 =?us-ascii?Q?9LIfpcTXHNOGOXaor2X30T2bIAsOLssk7ImY1eo6tpzhcNVK98rxrXEKrJSh?=
 =?us-ascii?Q?/Wdbv+miulvZKYGIBrB+A4fpVx/PSzjCEiTXq+Wfy7etKuOmcOjxdUnhXuup?=
 =?us-ascii?Q?ixxZRltvQJKuWdaRW/d7JOjiSCB9FHBjBdOJZPv/7Lvnn85+uBsJ+ohIk+oB?=
 =?us-ascii?Q?cnWlWiN3BLF7mxWNyRoTBBCfE+PvLZn6uk1Rr2eT1IpUu1irc3aHAkpIi8eJ?=
 =?us-ascii?Q?N4iBDprLB7IO3DWUdSNLB6wyXPWxUH5gqh+YpDDyvIFakVCPJZYT2sLSwtq1?=
 =?us-ascii?Q?64bkFeXc7GEGYGSQlOxk+n5dHr9XQXH34BCIvWWpguurqCW39E8bz4dTIBTc?=
 =?us-ascii?Q?69E0aIw6w7sdzofmk8xZXFJlv4VUDJLRJqmF6zSdcgL4n0yXKn7bqG4SVOcA?=
 =?us-ascii?Q?xZysE7orug0CK68WGlL/fIIqre8rnAxEGFZyaid6Fa7yXeXONcu2OhmKgw73?=
 =?us-ascii?Q?X1IGY9bipqwTIoDz2NS1eTay7oXqJC358w+k3F8ddXzhSj/tI7gEwtbWJ6vQ?=
 =?us-ascii?Q?H8zxjzVePYs67xPgiYtMmb0ASzp1Huzyu0zDg/sN5fGTZg1Hw3Abvx4Tp7sc?=
 =?us-ascii?Q?96IOB7Huidn24u8r5ve8XcIob1am2MD8q0apymnhDFcnz/uYl3WwYAqs652T?=
 =?us-ascii?Q?4/uTq2wNxLgF8hO7rGMVUHCzXEyEwFQBp8BP3MzYmh8uixrN1RL7ml3+7bgO?=
 =?us-ascii?Q?rsK9wgGEXxGRkWRjfd9Gi6Dcz3SSuUazlSJH7Oe82ATXDUFvFvawbVNw9sMx?=
 =?us-ascii?Q?68BA9W8bt84aEZIW62HRgeVQiUkAJxCG8RZVKMXiHItJNazTbV5HQzakNgg6?=
 =?us-ascii?Q?6foyu8O48OCAbR5TdYAisyorvxZuLAdjuJp0oNOf1oDM7yCgoXgyjRXWuavo?=
 =?us-ascii?Q?FTvrb0NdB26x8/0HEgxDFtq18XMv3LnjpOQXSxOQ6Wi7l/RGd9qo0C0lTNZE?=
 =?us-ascii?Q?FhRFMoKoKfdmxCyRz8OJVDQg5Es4e0chQDhdx0x/fLcFzrHZd+WtboTQV1Xb?=
 =?us-ascii?Q?kw0oYNcCmzJTg2rWEQpD6TaI/+0aAIt2zIoQ+MEzo3SbvMEoD3ebPzPKYOr4?=
 =?us-ascii?Q?/Saziv8sCpv5Tm95/aPz/EXwjQane+KfZ+XeIO5RtPRe5bSTSuD7+Lr56Ajr?=
 =?us-ascii?Q?BXTkc6BxpsjeDfbR0Du2odtWXdFJJFqS0x88BnMktf9hlzSR908N5JuMN6Ih?=
 =?us-ascii?Q?XY3izharYUoBeRh6ONfkYp30EXlcY+p8DFZYtR0fIQayoI9zR+GdnPmXnxUN?=
 =?us-ascii?Q?QLk0qaDpYPolLiH7McCVzfFAfUf3UU4rsh76dcIZY24mDtHCsHDTJbpBzPPI?=
 =?us-ascii?Q?027wV+hoem9V/7tHexQpHH7UFXtgGcVtcZHtTAwXZnyhNBhErLKcFwVdTQTo?=
 =?us-ascii?Q?WL1SHkosUHuVTXFKXlgRFwzcwA+eBbLULTBtlJRCLP23CCbO1unF21YViyh/?=
 =?us-ascii?Q?lqIJZqk63Sx7CyKLrlbPmixJrfJFEIfa/Ez13oln2q4KTke1s1duw1aFx7x4?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdb71cd-3a3b-4bd6-74d2-08dbc504e959
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 18:08:29.3336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogLan8dXYJhYAa8a+JgLLUDLU+O7i3Y1QZBonuJqx6LAL4rQmHMGS1mwkoDBIShMMsISfCaGJcVW4rqXbkvkxLwyqm8HizgeFXv6nEw6gKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/rtp: Fix doc for XE_RTP_ACTIONS
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

On Wed, Oct 04, 2023 at 10:08:24AM -0300, Gustavo Sousa wrote:
>Replace the paragraph that was meant for XE_RTP_RULES with one proper
>for XE_RTP_ACTIONS.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_rtp.h | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index 04ccb26452ad..c56fedd126e6 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -350,9 +350,8 @@ struct xe_reg_sr;
>  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
>  * @...: Actions to be taken
>  *
>- * At least one rule is needed and up to 4 are supported. Multiple rules are
>- * AND'ed together, i.e. all the rules must evaluate to true for the entry to
>- * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
>+ * At least one action is needed and up to 4 are supported. See XE_RTP_ACTION_*
>+ * for the possible actions. Example:
>  *
>  * .. code-block:: c
>  *
>-- 
>2.42.0
>
