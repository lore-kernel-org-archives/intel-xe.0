Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E1DC25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 13:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7DE10E65E;
	Wed, 25 Oct 2023 13:50:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C21B10E65E
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698241828; x=1729777828;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=NLrYbq0FCVbeC6JN8ZO2X0dxeI/Mo2iUnNkkfc1yI4o=;
 b=l6ynLVSVe2Sb1g28JmYsx5aSKrj+24jlInP5+6qOKaul0TVqu8TL+cd7
 0aVNasqB1OXKJfqSszFU7OyC8ZZ6fSlNoU7t7WtERBCgM69p8ORbsgMDN
 raRuN+A6eSxkDLWWbGhkdh7OSK+1aBYaVEl+O1rFoFT98+QF8NP6PHT19
 yJLMwM//nhpwjHXFPKIuJumSYmd6xWA2huOEVNJNF3RYJllK09yDSyU+i
 BW8SIJRsG07X3wR/EenL0btBG7NDVwv/P8jUBu8X/4KyJ6jhPV2ticuAp
 fZsCcufNoW9SgePH2c8+raRYWQXD+FuqjngeCkXQ8cklEx0+36nduMbvF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387127943"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="387127943"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 06:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762463367"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="762463367"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 06:50:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 06:50:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 06:50:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 06:50:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 06:50:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpgTV9bsdmZFwnDDwl2MZ8Lq2Gl03lKY4EbTv38pZ2jJrAOzw7zECQ12zutxuTkX92tgdj1Eyojy27xx8VQfkTS+/r5fCgnY0fzwJ0h/qU7xe6oaOyld4JVZX5DmP3zvhQZ/eSP0/Rb1zuzslsUaZj+fQzKyTTGYft4AXwQAiZkBtjA/3q1rlj2OJHAhgo04D+ZqxvzXiaulid30uLXbYtX4gDIMtUjY2CsLvdJs0aoReZtAMu979A1ZIfvHPg2kFNP4wLv53e1HCYiZkwH/BixCCF2iSq9irWGCOvAMW4PVcHCToiKTI+WPcU8/JKd822WsPU2azUrzo9TUYPVbAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+VVhXI56u+GagJnrdSnF3Jns44ir9FNZ1J9P+xiin0=;
 b=lXXijuWYvgZzBV10wKT7r6VXTKHjZNd5fliSK7OvjhVOjAS8J1wGrdk/PbVIYVeKE+MPjd0xU6O//Q8K3p4VjoSRyldPlJU7cPlRzMEKtP7EplLjWW8o0gIgrgMnackVdjkx1VRq5Rba005Bk6SsabJLVBCkYm2VCJGA2lZ/tqu20GJY4MFGaPB64mX2gE9RWWzki9p+rVXS+9I+onsQmpzXTWERK+06tG5327JtxCvyi0ZKPKqWOdWqeUOLa6u/oZX5zLw9hWWr/QA9SFRAH56leFBE4fWDZJNxLk6NwjDKUwdv0eBLGxFU8WcGHlx9grvQRm3v4mOMJwQDMSnkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH0PR11MB5412.namprd11.prod.outlook.com (2603:10b6:610:d3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 13:50:12 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::ad02:4c1b:1e4a:8551]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::ad02:4c1b:1e4a:8551%4]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 13:50:12 +0000
Date: Wed, 25 Oct 2023 19:20:05 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZTkdDeVu2euBjp16@bvivekan-mobl>
References: <20231017231843.1790243-5-matthew.d.roper@intel.com>
 <20231017231843.1790243-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20231017231843.1790243-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::15) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH0PR11MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: bf64b1c2-7cc2-4b1c-b2dc-08dbd5614f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ZtRi4M+pRfIUaMOdxLOac6wzFMuuRF3l3EQXmzC7olzokFrivr5MBxH2og7P/O78/JzxmscrUqI0784xQB6RWfO1ZPyGuMIL31mTRxEkz1VJgeDqVpOvie2Gr+zct/kkXqdtIhiawmM1EG1akkdhGpnv5HH+nuagK+p5ldIXeZ+uR0jo8X2T4IgsZsXfon4hChuQ+5P9E03/W0T7mhRd73fBjsTVJsjlYGMY+5XRLbjqMEAl7q9mClBw0hoRitxwCGKjdMqpoLPKSm9OiNwUDv9ADy8CfrhgSItp5HkEfTltZ63jJvBxzfLmLxy6CO4racZYIZK/x2KOFIXde+DL5dK32nWeelZ2k9881MivQ7F7NCQoeHU+wo4i4fGIa/sbJ/nO6trJL3m6piOMh0gXvIkId9APTGwBb49Uw5qQJY2Oks1hDiiiExU/qw+EDp+SdSvOoL/S5ixFj0ndESomcaCUmB1i3JHdl/8QGFPDwTbUMdv6v4i9Jv/NBIgTYqY/qd2tNumdIlGqXC4Lb9CKitLYJwPmMbsA6w528UEKNbrTsFB6ApP3Til55HAYc4J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(346002)(39860400002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2906002)(38100700002)(66946007)(30864003)(66476007)(316002)(66556008)(6666004)(6506007)(82960400001)(478600001)(6486002)(6512007)(53546011)(9686003)(83380400001)(44832011)(5660300002)(86362001)(8676002)(41300700001)(8936002)(26005)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHJzbUlFNzZsdm1DOE51b0ljK0h0Z3BkV0RybWNoOFB4TnRMbTNvSDZvU0R5?=
 =?utf-8?B?STRzMFpUSk5iTlV4UkFQRjFML0xHOXJCb3ViYnFaUVB1VjBjNGtTTDhmVjdE?=
 =?utf-8?B?OFhUeWdOd2JqSXpoZVV1dXl6R1BNbnVOUm5OVzZxTjJ2SUFqU0h5UlpmbUFY?=
 =?utf-8?B?aDlEV3Rabm00RTYrdnQvRy9NRHpPNGVQdkcrWHNicHNDN2VLOGxwbWtqcDQy?=
 =?utf-8?B?UmpLQmVvTXdiaXg0ckZ4Nm5kbXd5cWZzaDJpc1Z0bXEyTlNMVWQycndXV3NK?=
 =?utf-8?B?TFhKVUJkMWlVWm5VRGJ6T2NyMkFGQnlyd2ZGTXkzblBaUHliTm1QUnp4SndB?=
 =?utf-8?B?bkdwR1BSSkhONTcrdmZuNFdDNG9hTlkxMGpRamR0M3E5OGR2K1Y0cUxNOHBS?=
 =?utf-8?B?bUt3emhOZ2E3QUhLME1EUHlac2VwVktFS2VWOUpBRElsOHRxdENWa0hMeVUz?=
 =?utf-8?B?Y1lYRnlSR0xzWVJrOVZCclplejM1RndTc2Q1SjFEYlliVWU0NjZEcWdMWDZJ?=
 =?utf-8?B?dFVYSnRNTFlyNGttakJyd2JZTHhhQVh4WVJsVVdUZ0V3UHZQaFRVaWRqeHp4?=
 =?utf-8?B?SGR3Rk93VFZMM3hYTTRkSDJQTjdMNFR4M2IvQTd1M013TXZoeU9rQkdXS0xC?=
 =?utf-8?B?Qi83dHlveE81NHFKazFxK1pUazl3K1ZFeE1aOGpCc1BQSm40TWxLV3duUEFw?=
 =?utf-8?B?OTRIb1BUblVFZG9CV1phYlBTVDl4Yzd3bEpLYklYM0lsd29iNS9HMDVDNnU4?=
 =?utf-8?B?U2cwTTJ2QXFmTmlWQStyVWt0NkNMQ2hrcmtJV0RLdXIxV2JCVGlkTERYL1g4?=
 =?utf-8?B?Vmdra2RZeW9UZU5rcmRyQTljcUU2cXJGSnNiL2tITFg1WTh6TTVseTBCaVdL?=
 =?utf-8?B?enlSWmVCOEpqamZmYWN6M1NYOHY1dG51WEFiQ0NtSHFnVENKcjBpOW9LWTFu?=
 =?utf-8?B?NTVFMnpydXI2Sld2dloyWmNPTFAyelNIRnk2Mlo1bjNmTXpDc0FaelRjZHU5?=
 =?utf-8?B?ZEg3NlNZSVB6cHk2N0UxclNjNlZmRFQ1VlRMdjVuUnE3QnQwR1JYd0lPbHRv?=
 =?utf-8?B?U2xMdzdmVDcyRHhFaS9Fbk4yUmdOak1peFc5d2xmTVJ5emczQkREZWZadU9B?=
 =?utf-8?B?VkFlVXl1dGljRmhyTWtBeUVGaGtqODNjMHJFQ24wSzUrVkZyWGswRzJUMURJ?=
 =?utf-8?B?RzB3SXMrbS9neVFOWGRPNkthQlNZM2kvNDZJZUg5SVNpWnpITExxRkdDNTNh?=
 =?utf-8?B?TUh3YXdZTWsxRHRRZG1sSXBMRUFhdGd5M1NnTW1xQWk1eG02OTZFMW5MSnRS?=
 =?utf-8?B?NjFNN2Jxb0dEbjlRZDZBVG9sM0I1cnZGQTBaM3dBMTdZc3E5V1NRV1NkVEJs?=
 =?utf-8?B?ZU4xbmtMSVZRd1pqUCs2MlRidmh5M2JxNU1GQ0UvdlRwSm1vY0lIcnV0WTlk?=
 =?utf-8?B?aTQxcGd5ajR1aGloc0p5eTNjRnZCUit4ajl0Ym11UTAwbVd0ZkZNVTB2bXZI?=
 =?utf-8?B?b3FpRm9OUTA5dklWRkNhSDByWWs4V0FDMDh3c3ErY2tBd2pCSlFPOVNrMHRo?=
 =?utf-8?B?M3ZhOFJiM3hsbDBGQk1MSVF0OGRDVFBLZFhiZ1BpdGwxZDR3MTRaUGFLLzB1?=
 =?utf-8?B?MjEvVlZ5UjlzN1ZIaTRsZjlzS2M2QXZKK2llS3lseGZTN01YL0JRamNsaXJL?=
 =?utf-8?B?b1V5VkZmWWJESXRQVjQrbHE3cGZKL0VnMVBHWTJsbm4xdnJ2MytmV1M5K0hZ?=
 =?utf-8?B?ekZ4M0czSi9Meno1QzViZmxqN3dneCtORlltMHB1OEpKTlZYNFpjVkdCZUo3?=
 =?utf-8?B?ZmFodkRMNHB3RFkzL2xPa0pyVDZRbXVJeTdITWlJRXpqNmhFQ2p2UjRTaUZi?=
 =?utf-8?B?aHpaQVhSZ3JFNG02dnNKaGE5WEZKVStaanlnaDBsVGJFNGlHa2kzb2F5SU1p?=
 =?utf-8?B?NXJsWWg1bHVoOHRBVDZHZkhMaXVkbTVFL01EejUyYlJMcVdKWUZ5UVd0M0xN?=
 =?utf-8?B?SS9DcjNaeklTcjhZQUlERDJEd0YxTCsxdU5mbFZ4QjJUcU00a3huQnlqelR3?=
 =?utf-8?B?WEZaL0p2NXNwSE9FN2Q1QStncjBKOUtwaHlOdW9xTlF1Z2x1ekY2WDB4Z1k3?=
 =?utf-8?B?Nm5PeXZKenFqME5RbldwSndjc25uVTBhdEdoVUtIbkFDMkdkc25FUWN5NHVH?=
 =?utf-8?Q?aWyd9cyTOFdkUV6+IFIF7CU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf64b1c2-7cc2-4b1c-b2dc-08dbd5614f4a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 13:50:12.3495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95ymNkHFqzuSJkc/7hDwECBYILgqurzKVP858PVEu2ObTmHRJDpuRrUmq+u0Bxm63LolO6fms9wokEJCG/pEdO8e5ksjCKexEeaH18jgyex3mvv/uzZHTsnKUYp7JKbj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5412
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Emit SVG state on RCS during
 driver load on DG2 and MTL
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

On 17.10.2023 16:18, Matt Roper wrote:
> When recording the default LRC, the expectation is that the hardware's
> original state settings (both register and instruction) will be written
> out to the LRC upon first context switch.  For many 3DSTATE_* state
> instructions that don't truly have "default" values, this translates to
> a simple instruction header (opcodes + dword length) being written to
> the LRC, followed by an appropriate number of blank dwords as a place
> holder.  When userspace creates a context (which starts as a copy of the
> default LRC), they'll generally emit real 3DSTATE_* as part of their
> initialization to select the settings they desire.  If they don't emit
> one of the 3DSTATE instructions, then the zeroed dwords that remain in
> their LRC image generally translate to various state remaining disabled.
> This will either be what userspace wants or will lead to very
> reproducible and easily-debugged problems (rendering glitches, engine
> hangs).
> 
> It turns out that a subset of the 3DSTATE instructions, specifically
> those belonging to the SVG (State Variable - Global) unit, are not only
> emitting 0's for the instruction's "body" dwords, but also for the
> instruction header dword if no specific state has been explicitly set
> before context switch.  This means that when the hardware switches to a
> context that hasn't explicitly provided an appropriate state setting,
> the hardware will just see a sequence of NOOPs in the spot reserved for
> that 3DSTATE instruction while executing the LRC, and the actual
> hardware state setting will unintentionally inherit the configuration
> used by the previously running context.  Now when userspace makes a
> mistake and forgets to emit an important state instruction they no
> longer get consistent, easily-reproducible corruption/hangs, but rather
> erratic behavior where the presence/absence of a problem depends on what
> other workloads are running on the system and what order the contexts
> are scheduled on the engine.
> 
> A specific example of this that came up recently related to mesh shading
> The OpenGL driver was not specifically emitting a 3DSTATE_MESH_CONTROL
> to disable mesh shading at context init, so on context switch, mesh
> shading would either be on or off depending on what the previous context
> had been doing.  Vulkan apps _were_ enabling mesh shading, so running a
> Vulkan app and then context switching to an OpenGL app resulted in mesh
> shading still unexpectedly being enabled during OpenGL operation, and
> since other Mesh-related state was not properly initialized for that
> context a GPU hang was seen.  Due to the specific ordering requirements
> (Vulkan app runs first, followed by OpenGL app), it took additional
> debug effort to track down the cause of the problem.
> 
> There are various workarounds related to this behavior, with current
> implementations handled in the userspace drivers.  E.g., Wa_14019789679
> and Wa_22018402687.  However it's been suggested that the kernel driver
> can help simplify things here by emitting zeroed SVG state with proper
> instruction headers as part of our default context creation (i.e., at
> the same point we apply LRC workarounds).  This will help ensure that
> any future cases where a userspace driver does not emit an important
> state setting will result in consistent behavior.
> 
> Bspec: 46261
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> ---
>  .../drm/xe/instructions/xe_gfxpipe_commands.h |  51 ++++++++
>  drivers/gpu/drm/xe/xe_gt.c                    |   1 +
>  drivers/gpu/drm/xe/xe_lrc.c                   | 111 +++++++++++++++++-
>  3 files changed, 162 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
> index b5fbc761265c..7be961434719 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
> @@ -57,34 +57,84 @@
>  #define CMD_3DSTATE_STENCIL_BUFFER		GFXPIPE_3D_CMD(0x0, 0x6)
>  #define CMD_3DSTATE_HIER_DEPTH_BUFFER		GFXPIPE_3D_CMD(0x0, 0x7)
>  #define CMD_3DSTATE_VERTEX_BUFFERS		GFXPIPE_3D_CMD(0x0, 0x8)
> +#define CMD_3DSTATE_VERTEX_ELEMENTS		GFXPIPE_3D_CMD(0x0, 0x9)
>  #define CMD_3DSTATE_INDEX_BUFFER		GFXPIPE_3D_CMD(0x0, 0xA)
>  #define CMD_3DSTATE_VF				GFXPIPE_3D_CMD(0x0, 0xC)
> +#define CMD_3DSTATE_MULTISAMPLE			GFXPIPE_3D_CMD(0x0, 0xD)
>  #define CMD_3DSTATE_CC_STATE_POINTERS		GFXPIPE_3D_CMD(0x0, 0xE)
> +#define CMD_3DSTATE_SCISSOR_STATE_POINTERS	GFXPIPE_3D_CMD(0x0, 0xF)
> +#define CMD_3DSTATE_VS				GFXPIPE_3D_CMD(0x0, 0x10)
> +#define CMD_3DSTATE_GS				GFXPIPE_3D_CMD(0x0, 0x11)
> +#define CMD_3DSTATE_CLIP			GFXPIPE_3D_CMD(0x0, 0x12)
> +#define CMD_3DSTATE_SF				GFXPIPE_3D_CMD(0x0, 0x13)
>  #define CMD_3DSTATE_WM				GFXPIPE_3D_CMD(0x0, 0x14)
> +#define CMD_3DSTATE_CONSTANT_VS			GFXPIPE_3D_CMD(0x0, 0x15)
> +#define CMD_3DSTATE_CONSTANT_GS			GFXPIPE_3D_CMD(0x0, 0x16)
>  #define CMD_3DSTATE_SAMPLE_MASK			GFXPIPE_3D_CMD(0x0, 0x18)
> +#define CMD_3DSTATE_CONSTANT_HS			GFXPIPE_3D_CMD(0x0, 0x19)
> +#define CMD_3DSTATE_CONSTANT_DS			GFXPIPE_3D_CMD(0x0, 0x1A)
> +#define CMD_3DSTATE_HS				GFXPIPE_3D_CMD(0x0, 0x1B)
> +#define CMD_3DSTATE_TE				GFXPIPE_3D_CMD(0x0, 0x1C)
> +#define CMD_3DSTATE_DS				GFXPIPE_3D_CMD(0x0, 0x1D)
> +#define CMD_3DSTATE_STREAMOUT			GFXPIPE_3D_CMD(0x0, 0x1E)
>  #define CMD_3DSTATE_SBE				GFXPIPE_3D_CMD(0x0, 0x1F)
>  #define CMD_3DSTATE_PS				GFXPIPE_3D_CMD(0x0, 0x20)
> +#define CMD_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP	GFXPIPE_3D_CMD(0x0, 0x21)
>  #define CMD_3DSTATE_CPS_POINTERS		GFXPIPE_3D_CMD(0x0, 0x22)
>  #define CMD_3DSTATE_VIEWPORT_STATE_POINTERS_CC	GFXPIPE_3D_CMD(0x0, 0x23)
>  #define CMD_3DSTATE_BLEND_STATE_POINTERS	GFXPIPE_3D_CMD(0x0, 0x24)
> +#define CMD_3DSTATE_BINDING_TABLE_POINTERS_VS	GFXPIPE_3D_CMD(0x0, 0x26)
> +#define CMD_3DSTATE_BINDING_TABLE_POINTERS_HS	GFXPIPE_3D_CMD(0x0, 0x27)
> +#define CMD_3DSTATE_BINDING_TABLE_POINTERS_DS	GFXPIPE_3D_CMD(0x0, 0x28)
> +#define CMD_3DSTATE_BINDING_TABLE_POINTERS_GS	GFXPIPE_3D_CMD(0x0, 0x29)
>  #define CMD_3DSTATE_BINDING_TABLE_POINTERS_PS	GFXPIPE_3D_CMD(0x0, 0x2A)
> +#define CMD_3DSTATE_SAMPLER_STATE_POINTERS_VS	GFXPIPE_3D_CMD(0x0, 0x2B)
> +#define CMD_3DSTATE_SAMPLER_STATE_POINTERS_HS	GFXPIPE_3D_CMD(0x0, 0x2C)
> +#define CMD_3DSTATE_SAMPLER_STATE_POINTERS_DS	GFXPIPE_3D_CMD(0x0, 0x2D)
> +#define CMD_3DSTATE_SAMPLER_STATE_POINTERS_GS	GFXPIPE_3D_CMD(0x0, 0x2E)
>  #define CMD_3DSTATE_SAMPLER_STATE_POINTERS_PS	GFXPIPE_3D_CMD(0x0, 0x2F)
>  #define CMD_3DSTATE_VF_INSTANCING		GFXPIPE_3D_CMD(0x0, 0x49)
> +#define CMD_3DSTATE_VF_SGVS			GFXPIPE_3D_CMD(0x0, 0x4A)
>  #define CMD_3DSTATE_VF_TOPOLOGY			GFXPIPE_3D_CMD(0x0, 0x4B)
>  #define CMD_3DSTATE_WM_CHROMAKEY		GFXPIPE_3D_CMD(0x0, 0x4C)
>  #define CMD_3DSTATE_PS_BLEND			GFXPIPE_3D_CMD(0x0, 0x4D)
>  #define CMD_3DSTATE_WM_DEPTH_STENCIL		GFXPIPE_3D_CMD(0x0, 0x4E)
>  #define CMD_3DSTATE_PS_EXTRA			GFXPIPE_3D_CMD(0x0, 0x4F)
> +#define CMD_3DSTATE_RASTER			GFXPIPE_3D_CMD(0x0, 0x50)
>  #define CMD_3DSTATE_SBE_SWIZ			GFXPIPE_3D_CMD(0x0, 0x51)
> +#define CMD_3DSTATE_WM_HZ_OP			GFXPIPE_3D_CMD(0x0, 0x52)
> +#define CMD_3DSTATE_VF_COMPONENT_PACKING	GFXPIPE_3D_CMD(0x0, 0x55)
> +#define CMD_3DSTATE_VF_SGVS_2			GFXPIPE_3D_CMD(0x0, 0x56)
>  #define CMD_3DSTATE_VFG				GFXPIPE_3D_CMD(0x0, 0x57)
> +#define CMD_3DSTATE_URB_ALLOC_VS		GFXPIPE_3D_CMD(0x0, 0x58)
> +#define CMD_3DSTATE_URB_ALLOC_HS		GFXPIPE_3D_CMD(0x0, 0x59)
> +#define CMD_3DSTATE_URB_ALLOC_DS		GFXPIPE_3D_CMD(0x0, 0x5A)
> +#define CMD_3DSTATE_URB_ALLOC_GS		GFXPIPE_3D_CMD(0x0, 0x5B)
> +#define CMD_3DSTATE_SO_BUFFER_INDEX_0		GFXPIPE_3D_CMD(0x0, 0x60)
> +#define CMD_3DSTATE_SO_BUFFER_INDEX_1		GFXPIPE_3D_CMD(0x0, 0x61)
> +#define CMD_3DSTATE_SO_BUFFER_INDEX_2		GFXPIPE_3D_CMD(0x0, 0x62)
> +#define CMD_3DSTATE_SO_BUFFER_INDEX_3		GFXPIPE_3D_CMD(0x0, 0x63)
> +#define CMD_3DSTATE_PRIMITIVE_REPLICATION	GFXPIPE_3D_CMD(0x0, 0x6C)
> +#define CMD_3DSTATE_TBIMR_TILE_PASS_INFO	GFXPIPE_3D_CMD(0x0, 0x6E)
>  #define CMD_3DSTATE_AMFS			GFXPIPE_3D_CMD(0x0, 0x6F)
>  #define CMD_3DSTATE_DEPTH_BOUNDS		GFXPIPE_3D_CMD(0x0, 0x71)
>  #define CMD_3DSTATE_AMFS_TEXTURE_POINTERS	GFXPIPE_3D_CMD(0x0, 0x72)
>  #define CMD_3DSTATE_CONSTANT_TS_POINTER		GFXPIPE_3D_CMD(0x0, 0x73)
> +#define CMD_3DSTATE_MESH_CONTROL		GFXPIPE_3D_CMD(0x0, 0x77)
>  #define CMD_3DSTATE_MESH_DISTRIB		GFXPIPE_3D_CMD(0x0, 0x78)
> +#define CMD_3DSTATE_TASK_REDISTRIB		GFXPIPE_3D_CMD(0x0, 0x79)
> +#define CMD_3DSTATE_MESH_SHADER			GFXPIPE_3D_CMD(0x0, 0x7A)
> +#define CMD_3DSTATE_MESH_SHADER_DATA		GFXPIPE_3D_CMD(0x0, 0x7B)
> +#define CMD_3DSTATE_TASK_CONTROL		GFXPIPE_3D_CMD(0x0, 0x7C)
> +#define CMD_3DSTATE_TASK_SHADER			GFXPIPE_3D_CMD(0x0, 0x7D)
> +#define CMD_3DSTATE_TASK_SHADER_DATA		GFXPIPE_3D_CMD(0x0, 0x7E)
> +#define CMD_3DSTATE_URB_ALLOC_MESH		GFXPIPE_3D_CMD(0x0, 0x7F)
> +#define CMD_3DSTATE_URB_ALLOC_TASK		GFXPIPE_3D_CMD(0x0, 0x80)
> +#define CMD_3DSTATE_CLIP_MESH			GFXPIPE_3D_CMD(0x0, 0x81)
>  #define CMD_3DSTATE_SBE_MESH			GFXPIPE_3D_CMD(0x0, 0x82)
>  #define CMD_3DSTATE_CPSIZE_CONTROL_BUFFER	GFXPIPE_3D_CMD(0x0, 0x83)
>  
> +#define CMD_3DSTATE_DRAWING_RECTANGLE		GFXPIPE_3D_CMD(0x1, 0x0)
>  #define CMD_3DSTATE_CHROMA_KEY			GFXPIPE_3D_CMD(0x1, 0x4)
>  #define CMD_3DSTATE_POLY_STIPPLE_OFFSET		GFXPIPE_3D_CMD(0x1, 0x6)
>  #define CMD_3DSTATE_POLY_STIPPLE_PATTERN	GFXPIPE_3D_CMD(0x1, 0x7)
> @@ -98,6 +148,7 @@
>  #define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_PS	GFXPIPE_3D_CMD(0x1, 0x16)
>  #define CMD_3DSTATE_SO_DECL_LIST		GFXPIPE_3D_CMD(0x1, 0x17)
>  #define   CMD_3DSTATE_SO_DECL_LIST_DW_LEN	REG_GENMASK(8, 0)
> +#define CMD_3DSTATE_SO_BUFFER			GFXPIPE_3D_CMD(0x1, 0x18)
>  #define CMD_3DSTATE_BINDING_TABLE_POOL_ALLOC	GFXPIPE_3D_CMD(0x1, 0x19)
>  #define CMD_3DSTATE_SAMPLE_PATTERN		GFXPIPE_3D_CMD(0x1, 0x1C)
>  #define CMD_3DSTATE_3D_MODE			GFXPIPE_3D_CMD(0x1, 0x1E)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 8618275b1877..d380f67b3365 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
>  
> +#include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_mi_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 1f7b1ea00d4d..4bd6ef9e41fd 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1020,34 +1020,84 @@ static int dump_gfxpipe_command(struct drm_printer *p,
>  	MATCH3D(3DSTATE_STENCIL_BUFFER);
>  	MATCH3D(3DSTATE_HIER_DEPTH_BUFFER);
>  	MATCH3D(3DSTATE_VERTEX_BUFFERS);
> +	MATCH3D(3DSTATE_VERTEX_ELEMENTS);
>  	MATCH3D(3DSTATE_INDEX_BUFFER);
>  	MATCH3D(3DSTATE_VF);
> +	MATCH3D(3DSTATE_MULTISAMPLE);
>  	MATCH3D(3DSTATE_CC_STATE_POINTERS);
> +	MATCH3D(3DSTATE_SCISSOR_STATE_POINTERS);
> +	MATCH3D(3DSTATE_VS);
> +	MATCH3D(3DSTATE_GS);
> +	MATCH3D(3DSTATE_CLIP);
> +	MATCH3D(3DSTATE_SF);
>  	MATCH3D(3DSTATE_WM);
> +	MATCH3D(3DSTATE_CONSTANT_VS);
> +	MATCH3D(3DSTATE_CONSTANT_GS);
>  	MATCH3D(3DSTATE_SAMPLE_MASK);
> +	MATCH3D(3DSTATE_CONSTANT_HS);
> +	MATCH3D(3DSTATE_CONSTANT_DS);
> +	MATCH3D(3DSTATE_HS);
> +	MATCH3D(3DSTATE_TE);
> +	MATCH3D(3DSTATE_DS);
> +	MATCH3D(3DSTATE_STREAMOUT);
>  	MATCH3D(3DSTATE_SBE);
>  	MATCH3D(3DSTATE_PS);
> +	MATCH3D(3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP);
>  	MATCH3D(3DSTATE_CPS_POINTERS);
>  	MATCH3D(3DSTATE_VIEWPORT_STATE_POINTERS_CC);
>  	MATCH3D(3DSTATE_BLEND_STATE_POINTERS);
> +	MATCH3D(3DSTATE_BINDING_TABLE_POINTERS_VS);
> +	MATCH3D(3DSTATE_BINDING_TABLE_POINTERS_HS);
> +	MATCH3D(3DSTATE_BINDING_TABLE_POINTERS_DS);
> +	MATCH3D(3DSTATE_BINDING_TABLE_POINTERS_GS);
>  	MATCH3D(3DSTATE_BINDING_TABLE_POINTERS_PS);
> +	MATCH3D(3DSTATE_SAMPLER_STATE_POINTERS_VS);
> +	MATCH3D(3DSTATE_SAMPLER_STATE_POINTERS_HS);
> +	MATCH3D(3DSTATE_SAMPLER_STATE_POINTERS_DS);
> +	MATCH3D(3DSTATE_SAMPLER_STATE_POINTERS_GS);
>  	MATCH3D(3DSTATE_SAMPLER_STATE_POINTERS_PS);
>  	MATCH3D(3DSTATE_VF_INSTANCING);
> +	MATCH3D(3DSTATE_VF_SGVS);
>  	MATCH3D(3DSTATE_VF_TOPOLOGY);
>  	MATCH3D(3DSTATE_WM_CHROMAKEY);
>  	MATCH3D(3DSTATE_PS_BLEND);
>  	MATCH3D(3DSTATE_WM_DEPTH_STENCIL);
>  	MATCH3D(3DSTATE_PS_EXTRA);
> +	MATCH3D(3DSTATE_RASTER);
>  	MATCH3D(3DSTATE_SBE_SWIZ);
> +	MATCH3D(3DSTATE_WM_HZ_OP);
> +	MATCH3D(3DSTATE_VF_COMPONENT_PACKING);
> +	MATCH3D(3DSTATE_VF_SGVS_2);
>  	MATCH3D(3DSTATE_VFG);
> +	MATCH3D(3DSTATE_URB_ALLOC_VS);
> +	MATCH3D(3DSTATE_URB_ALLOC_HS);
> +	MATCH3D(3DSTATE_URB_ALLOC_DS);
> +	MATCH3D(3DSTATE_URB_ALLOC_GS);
> +	MATCH3D(3DSTATE_SO_BUFFER_INDEX_0);
> +	MATCH3D(3DSTATE_SO_BUFFER_INDEX_1);
> +	MATCH3D(3DSTATE_SO_BUFFER_INDEX_2);
> +	MATCH3D(3DSTATE_SO_BUFFER_INDEX_3);
> +	MATCH3D(3DSTATE_PRIMITIVE_REPLICATION);
> +	MATCH3D(3DSTATE_TBIMR_TILE_PASS_INFO);
>  	MATCH3D(3DSTATE_AMFS);
>  	MATCH3D(3DSTATE_DEPTH_BOUNDS);
>  	MATCH3D(3DSTATE_AMFS_TEXTURE_POINTERS);
>  	MATCH3D(3DSTATE_CONSTANT_TS_POINTER);
> +	MATCH3D(3DSTATE_MESH_CONTROL);
>  	MATCH3D(3DSTATE_MESH_DISTRIB);
> +	MATCH3D(3DSTATE_TASK_REDISTRIB);
> +	MATCH3D(3DSTATE_MESH_SHADER);
> +	MATCH3D(3DSTATE_MESH_SHADER_DATA);
> +	MATCH3D(3DSTATE_TASK_CONTROL);
> +	MATCH3D(3DSTATE_TASK_SHADER);
> +	MATCH3D(3DSTATE_TASK_SHADER_DATA);
> +	MATCH3D(3DSTATE_URB_ALLOC_MESH);
> +	MATCH3D(3DSTATE_URB_ALLOC_TASK);
> +	MATCH3D(3DSTATE_CLIP_MESH);
>  	MATCH3D(3DSTATE_SBE_MESH);
>  	MATCH3D(3DSTATE_CPSIZE_CONTROL_BUFFER);
>  
> +	MATCH3D(3DSTATE_DRAWING_RECTANGLE);
>  	MATCH3D(3DSTATE_CHROMA_KEY);
>  	MATCH3D(3DSTATE_POLY_STIPPLE_OFFSET);
>  	MATCH3D(3DSTATE_POLY_STIPPLE_PATTERN);
> @@ -1060,6 +1110,7 @@ static int dump_gfxpipe_command(struct drm_printer *p,
>  	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_GS);
>  	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_PS);
>  	MATCH3D(3DSTATE_SO_DECL_LIST);
> +	MATCH3D(3DSTATE_SO_BUFFER);
>  	MATCH3D(3DSTATE_BINDING_TABLE_POOL_ALLOC);
>  	MATCH3D(3DSTATE_SAMPLE_PATTERN);
>  	MATCH3D(3DSTATE_3D_MODE);
> @@ -1115,6 +1166,59 @@ struct instr_state {
>  	u16 num_dw;
>  };
>  
> +static const struct instr_state xe_hpg_svg_state[] = {
> +	{ .instr = CMD_3DSTATE_CONSTANT_VS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_CONSTANT_HS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_CONSTANT_DS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_CONSTANT_GS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_VERTEX_ELEMENTS, .num_dw = 69 },
> +	{ .instr = CMD_3DSTATE_VF_COMPONENT_PACKING, .num_dw = 5 },
> +	{ .instr = CMD_3DSTATE_VF_SGVS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_VF_SGVS_2, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_VS, .num_dw = 9 },
> +	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_VS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_VS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_VS, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_STREAMOUT, .num_dw = 5 },
> +	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_0, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_1, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_2, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_3, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_CLIP, .num_dw = 4 },
> +	{ .instr = CMD_3DSTATE_PRIMITIVE_REPLICATION, .num_dw = 6 },
> +	{ .instr = CMD_3DSTATE_CLIP_MESH, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SF, .num_dw = 4 },
> +	{ .instr = CMD_3DSTATE_SCISSOR_STATE_POINTERS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_RASTER, .num_dw = 5 },
> +	{ .instr = CMD_3DSTATE_TBIMR_TILE_PASS_INFO, .num_dw = 4 },
> +	{ .instr = CMD_3DSTATE_WM_HZ_OP, .num_dw = 6 },
> +	{ .instr = CMD_3DSTATE_MULTISAMPLE, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_HS, .num_dw = 9 },
> +	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_HS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_HS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_HS, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_TASK_CONTROL, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_TASK_SHADER, .num_dw = 7 },
> +	{ .instr = CMD_3DSTATE_TASK_SHADER_DATA, .num_dw = 10 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_TASK, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_TE, .num_dw = 5 },
> +	{ .instr = CMD_3DSTATE_TASK_REDISTRIB, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_DS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_DS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_DS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_DS, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_GS, .num_dw = 10 },
> +	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_GS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_GS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_GS, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_MESH_CONTROL, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_MESH_SHADER_DATA, .num_dw = 10 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_MESH, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_MESH_SHADER, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_DRAWING_RECTANGLE, .num_dw = 4 },
> +};
> +
>  void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb)
>  {
>  	struct xe_gt *gt = q->hwe->gt;
> @@ -1130,6 +1234,12 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
>  		return;
>  
>  	switch(GRAPHICS_VERx100(xe)) {
> +	case 1255:
> +	case 1270:
> +	case 1271:
> +		state_table = xe_hpg_svg_state;
> +		state_table_size = ARRAY_SIZE(xe_hpg_svg_state);
> +		break;
>  	default:
>  		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
>  			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> @@ -1151,4 +1261,3 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
>  		bb->len += num_dw;
>  	}
>  }
> -
> -- 
> 2.41.0
> 
