Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EEEEDE99A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 16:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3572710E89B;
	Tue, 10 Sep 2024 16:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gcz18Wjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6420010E88C
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725986377; x=1757522377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jDvPb5ll8epCE0kY8ZbJFwIKNBxFtSP7mN/YKmWu8nM=;
 b=Gcz18WjzFVigTQCFJwVTkpSn0A/MeC07swPLZ0Y64qsYgiZVm1jjMH44
 5x+JnM3G97TShKgaoD8jlqb7W0loYQF2ryuRyaUals0OhD2k4fVCs33Cu
 Lw8M6Tzb79xCXZNkl/wi+07XJq/axoaKg0gJBg9t6Q7lAET2pINprkz6v
 +yWbERQJN7/VuoafL4tNnUiuYP0u5dJf0mXSYtSnh/Q+iiZLnlc8BHq30
 C7nxyzVufOl68B7cSS5yS3RmZF78Psl3FXMsTjaayDmjSM+x6IORV5Awu
 nwLrCfdUAxLk9iUGUCLm3Jv+lraGZuHsW+kTQh/pm80n2DPONvEr3cv9t g==;
X-CSE-ConnectionGUID: 3bvOeW8RSfajhrMi0nhLyw==
X-CSE-MsgGUID: SEvzIL4qT0CYEKK1W9qYzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13460139"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="13460139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 09:39:37 -0700
X-CSE-ConnectionGUID: 1/6wvgLNRveGichKAgrlpA==
X-CSE-MsgGUID: cAgxY7ztSDuE+URQfnsYAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67383120"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 09:39:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 09:39:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 09:39:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 09:39:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xk2tbc0zP3wKG3fq9XzICKm23wbZS5k0wm7xQHLzrQgnGceeRZSyvRNlRKH22SSsRRB2wJ1H2iUMcOIcIGucC/I1YUia7Q78rs++pkZJRzzqKCfQGJ9VRNPE1IHqm2X60c3D5y1EpxEAqRjtFnKVPA+bsgjT9Wo4x29n0qq2GQDARV0Ip9a/VZGHbABSwNSWJJm3XdOjc17+/icT4lBE1/lPjz6IVyDLC9sY1gEgTPKeI2B6hXipHQaSf0jc7kIyOUHt2q3pQ45LSYlgLPh9ErTw3YLZ3RVIoqIiU+obj8J843HJiW3rLKD4yRuaXo3hxep3VAO7g+DuohpHuxWWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn3ZYReagfGrhQsLImvw9jkiW/3JfmYZn5nwOY8kc48=;
 b=vR1MpGge7Z3nyAEOV/WrICDI7YVbjDP3hc9dNhdIOOhZaVhwXWioXoNnuiu/b54zsD4ezeV1aRMv3L+3TuCgC4spDjWO04sOzC5nUTfL4IpN2CeAXhEhmW1bPyTvhh1iHyMTyTgVmDg/xFYV+hyulctk5auwGeWnFubV3mu7StfzJ8/2dj0Rig+dhbuGTX1EtdMKoJyDmcCKRulhQ7ll3vaRqBGWaRnuu+HJHfPvq3PCDC596S2O2I4BTaD4ocrC5Y7nAd8VbcFiBbAK9cEwBkVCUBOkvC2wWR6+cOgFo99vQkxZnOarDuXrV+cdlm4UiV4M1JxPe9MOvNdMV0tQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 16:39:33 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 16:39:33 +0000
Date: Tue, 10 Sep 2024 12:39:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
Message-ID: <ZuB2Qa2O1Vak6rVI@intel.com>
References: <20240910142837.636680-1-riana.tauro@intel.com>
 <ZuBdM3qnzcZM_uNK@intel.com>
 <ZuBdll8hFS1bElT6@DUT025-TGLU.fm.intel.com>
 <0732e0c6-d3d1-4886-ba76-11995ca4554b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0732e0c6-d3d1-4886-ba76-11995ca4554b@intel.com>
X-ClientProxiedBy: MW3PR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:303:2a::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f4458b-4482-4d19-c966-08dcd1b7263d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZMLvrVwVPMZ54bkrLSpionKPrnxdCb0W4pCEsx4J5Hq31c2kREzpPbqUDsWw?=
 =?us-ascii?Q?yuA2If74pYrvlw4fQbtujqnVYnzsobO7pQPysAUGg1TVUGsrvSJTTDVMHpOX?=
 =?us-ascii?Q?wXR11sRcEIBAceH215jDM5mT2JJXIUtRdFRiZ85JOcxQkqSK0XFuIpFjoV4d?=
 =?us-ascii?Q?m7X1DFldEFUBX+t3jpt0GJ72W9LhTUeX7+LsQQ66arcuy2ep/+2210i3LQu0?=
 =?us-ascii?Q?jA8nY2eGUrdzDYOrGUKTMHnkh0C32leNHHKbu7Nkb5s+LLDZdkqTEke0EbrT?=
 =?us-ascii?Q?tCT1K1PGzGY2Q9pVqbYJCuRQVL+BlkRPhXdBc/eF7imHZMbquts7jqC3lA9R?=
 =?us-ascii?Q?U/I4n8865jbBLlq/A8qlTyci74FrhyNG4xL9pLrFl7hMJfRwBtrZCpcPaRcL?=
 =?us-ascii?Q?wbZIKRd0axMqgVjHkUB+37ymernsz2FU1BKwcj8lZJw/d8V/y5hlQl2MFqBG?=
 =?us-ascii?Q?VFEW848YK9gnhX/hFlQv4/wm5vcRk/MzBgt0L1AG53F+qHBS3NHc9t7fUWk9?=
 =?us-ascii?Q?uSymGHtHYAmK99II/jeSjI0IN4uBY4A/2rJ7M9G+u1EUKKRwsW9f4zidAjrH?=
 =?us-ascii?Q?uSaFL2CZG5WBJEBaYbnn/Os+9KDu3cDaV+C11+Zsjoae+ZqqwHRpJol9tt4p?=
 =?us-ascii?Q?Vs5FEFhV5zB29JgInjpMVvndclD+t8u5dpdQbJipMmO+A2mFK4rwBdX4px0i?=
 =?us-ascii?Q?c0meALPUX8hO+f3YzM5HzXztTT+R+luXRwsJGFesaYPau+Sqz0npCwVFMYAn?=
 =?us-ascii?Q?eCol0+Caqsrn4ucMDUyVQhqElTsuAazIgkuvlkfrtp08mKodV7HXWPTYljnN?=
 =?us-ascii?Q?8LFq7mAWlFbUktX5ry2DK29F+V6k58vpeEjpagBkfBWHzVfPnVBbLgJodZKl?=
 =?us-ascii?Q?jQ98KS5pOBu5yo7SReVin7TVeqsR58Eat+DQJFydgulaWtuI0n9cdaOvb0Rz?=
 =?us-ascii?Q?z53thx0ZV7ByLA35J/HMwOdNgJFDw5XVCCk15Ma8Vj0oP33Az06grqbbhPzq?=
 =?us-ascii?Q?pFivlqe2T0ZdC2T7gDGFU7+ZryIk43pH6t1P2gm22lv2iNV2Ezu3bqc0/E57?=
 =?us-ascii?Q?7HBQ9S/BonGw5lXppJkXwqL/9n+B3ol7pZ+hps6OR9QrxX/1KZWYt9tPM5Ej?=
 =?us-ascii?Q?BHYvm9dpDNWmDTwnk4Rpuho+9m0ljZiTf3RNVRg5Is9JLc9s8OR1ys7/x8/l?=
 =?us-ascii?Q?rPv2nre4DnNm6gcNrfHW93R/WwlBKmwonyxrMxSmGwm0Sj2IO3UOaxJmYwMD?=
 =?us-ascii?Q?extfrIq4jvy7Ki/0TUmV0IuG31HXoLAW2nfv35hjp0ucFHhpK58AQT2EJW38?=
 =?us-ascii?Q?fXY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LG8DuE0om2RI4W1v0BrMy3fJcmO8Gub8FAzvfieP2OUBgFpNmxpkA3IlW8wK?=
 =?us-ascii?Q?8z8rKMWOBFK62xajiNYItbXutyuKdQ2A87u7wFI51oyjGNrNC6anJ08fYTK3?=
 =?us-ascii?Q?om4BOixSAqbw7haxepiqXBS11aUMFODTYoRwPVCZd86Ymica3u7dwCwXCere?=
 =?us-ascii?Q?3afwaR4n+EI0oIBy/8E2yM6gda9KTMmMcsjNlBHOTgNJ30BYxB6i3DfyJ6g/?=
 =?us-ascii?Q?UhPy5T+7QXiDTcjUBiuJXcG79YQp2trORNUhSBzXcHJpVjUytPc6W6qERRof?=
 =?us-ascii?Q?b6x7MEAv3DYr95jvIuN2az3+phRAb/lOu0zHJGwij2/LWhOK6gJo5PORwTTE?=
 =?us-ascii?Q?IKNbRxccXAsn39MoE0P4kzcYm+hhp65/RM7kndHzTKTAmrXK1QE8P8HWh95z?=
 =?us-ascii?Q?uYQED3Df6wC9Nowo8Tw0KANCs7B9PozcSqP6q/lqYaUDCdHXLYWDhzqx9wN1?=
 =?us-ascii?Q?RTCsFvf2NhEfgnYZcBwkNbcF7Km7yC0bxC+EB8xDp4FZ4EfdF9tMoshrNXtG?=
 =?us-ascii?Q?sHLl5gzO6b+VGw9GpSqwv+HuUaMxE2b83yTB+CH/N64u6LxJ9U4YAF73s/y5?=
 =?us-ascii?Q?BbRpfhmgXbKKGO3gA36ZEhJWnMoYw6npxPhiXjdVmq0XnLFZMjRHtqsPoJE3?=
 =?us-ascii?Q?q3NOd5OCZA7n78+SHe5eQTg/7nG1waUxy5rxgYJClHV+arw12Txii3Cyvgg7?=
 =?us-ascii?Q?+fLZxNlKsvs4+ShLUQ2sboMPp5jv12I+1Y7Z5cBRV1rEkbh/ezxnOdGo2Tj2?=
 =?us-ascii?Q?YydxNvBczZLzGEx2IPORUbcvG7wURsn1n7xl+BKIVlFjwiUbrw7lwv8La8AP?=
 =?us-ascii?Q?l1sJUGuecSnny3eP8NlmyMOdigcu5Ovozj16OjmT6gRSmmiuDA6M/N7pzyMl?=
 =?us-ascii?Q?e1x/DrW9l6QKA8Wp6n7PkYIQ4Bp5tTkSPomsVoevVhB3qzXgbhms+uPNBySS?=
 =?us-ascii?Q?1AWoagYh5qDfqftS5xSIYY276G4iIE+1F8e0ihiSYpwRJcBPHJ7AFcIea6Ah?=
 =?us-ascii?Q?emYPBxO8SXyIlYDSWjPbPldCrrYxXprABbPZanD3nly/epI/gdy3RtC5qLa2?=
 =?us-ascii?Q?8/kH+63TGroDABZ07int1ji5jKQuIlgcJIDC0XxIDYNfRy2M6YQeeKi48A6H?=
 =?us-ascii?Q?/4ksVbs/Nqt7MhUhLFPKTAnn2lOZXpQoa8Qui3GiTQX2h8/AkqnJODdJRfPN?=
 =?us-ascii?Q?Np4rrNAkSPjZK8mOTUNwF2MxkNQ0167SECnYEkl3gT8Kd5G3eiwqbGh8AOKA?=
 =?us-ascii?Q?5jtgK36XDMUMN0FuaAKY4qun36VCUY/vj2RJiXi6rqY1TA1ed3FRanniQ8a4?=
 =?us-ascii?Q?xtVgHpxJVp1+CrJ0rcvT5XcjxN9zDBFDuFQJ88Vn3SFL438YdD26o7ByWSAh?=
 =?us-ascii?Q?TIbvN42Ay+J4DqXwtLLeR8x3Wt5/U9zwDVTWAJCc7rL4mrpvoxXXffKkqiBU?=
 =?us-ascii?Q?OUAHptZ9LkqSySsdWdxYsiYQ13vU9EY3wj5PoQs98oOwnnx6Q1Qq9/h+mnXD?=
 =?us-ascii?Q?DFYZvhaOMCZtxHF4RZ9nayaWfOgna/gZHkw7DahlntXnUWYXZ9I2WABuv91w?=
 =?us-ascii?Q?cUd9BcTl0NhSFPAcJNsfMgQcPWk1lLqeCHUD7GfxZMySCK/LYCVSn9+ux+Jj?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f4458b-4482-4d19-c966-08dcd1b7263d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 16:39:33.2793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/GN8RQEp7GegZWOOa3MUWrTlea5eKhO29/FX2E9UUbJ35g31skb7qg4sgklTx5QxtAZ6l05oOKVvABH91XUAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
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

On Tue, Sep 10, 2024 at 09:55:23PM +0530, Riana Tauro wrote:
> Hi Rodrigo/ Matthew
> 
> There was an error when this change was merged to linux-next
> https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
> 
> The conflict was because the below commit
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=3ff37dbb1ae9926d3b51749f7d0d3f474fe2440b
> 
> Jani suggested to rename or remove it in
> https://patchwork.freedesktop.org/patch/612760/?series=136477&rev=5.
> 
> Removed it for now, will add it once the commit is in the tree

So, the easiest way is to just rename as Brost suggested.
Then when we are rebased on top of this we just include the
string choices and rename back.

But please mention this in the commit message.

> 
> Thanks
> Riana Tauro
> 
> 
> 
> On 9/10/2024 8:24 PM, Matthew Brost wrote:
> > On Tue, Sep 10, 2024 at 10:52:35AM -0400, Rodrigo Vivi wrote:
> > > On Tue, Sep 10, 2024 at 07:58:37PM +0530, Riana Tauro wrote:
> > > > Remove local copy of str_up_down to fix name conflict.
> > > 
> > > what conflict?
> > > 
> > > I don't see any conflict caused by this. But well, nothing
> > > against this change itself.
> > > 
> > 
> > I don't see one either:
> > https://elixir.bootlin.com/linux/v6.11-rc7/A/ident/str_up_down
> > 
> > > perhaps s/to fix/to avoid/g in the commit message?!
> > > 
> > 
> > What about s/str_up_down/__str_up_down rather than remove the helper.
> > 
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > > 
> > > > Fixes: 0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
> > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_gt_debugfs.c | 2 +-
> > > >   drivers/gpu/drm/xe/xe_gt_idle.c    | 9 ++-------
> > > >   2 files changed, 3 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > index cbc43973ff7e..8f850b9e1947 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > @@ -14,8 +14,8 @@
> > > >   #include "xe_force_wake.h"
> > > >   #include "xe_ggtt.h"
> > > >   #include "xe_gt.h"
> > > > -#include "xe_gt_mcr.h"
> > > >   #include "xe_gt_idle.h"
> > > > +#include "xe_gt_mcr.h"
> > > >   #include "xe_gt_sriov_pf_debugfs.h"
> > > >   #include "xe_gt_sriov_vf_debugfs.h"
> > > >   #include "xe_gt_stats.h"
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> > > > index 85a35ed153a3..a8ce8b484561 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> > > > @@ -53,11 +53,6 @@ pc_to_xe(struct xe_guc_pc *pc)
> > > >   	return gt_to_xe(gt);
> > > >   }
> > > > -static inline const char *str_up_down(bool v)
> > 
> > Also if this is kept, drop the inline as we don't use inline in *.c in Xe.
> > 
> > Matt
> > 
> > > > -{
> > > > -	return v ? "up" : "down";
> > > > -}
> > > > -
> > > >   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
> > > >   {
> > > >   	switch (state) {
> > > > @@ -227,7 +222,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
> > > >   			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
> > > >   		drm_printf(p, "Render Power Gate Status: %s\n",
> > > > -			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
> > > > +			  (pg_status & RENDER_AWAKE_STATUS) ? "up" : "down");
> > > >   	}
> > > >   	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> > > > @@ -241,7 +236,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
> > > >   		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
> > > >   			if (gt->info.engine_mask & media_slices[n].engines)
> > > >   				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
> > > > -					   str_up_down(pg_status & media_slices[n].status_bit));
> > > > +					  (pg_status & media_slices[n].status_bit) ? "up" : "down");
> > > >   	}
> > > >   	return 0;
> > > >   }
> > > > -- 
> > > > 2.40.0
> > > > 
