Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AB4C76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 15:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3FA10E0A9;
	Mon, 10 Apr 2023 15:38:44 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F01810E0B7
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681141122; x=1712677122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lYF9Z5NcIMbO+w5lnHrvp3bwyDbbqvG9qYh9LF/SRxg=;
 b=L/2d918N/EMlhe7Iq1+ZPL90Uw1cl6ylA9Tk7Swo3h36B68vgCN/RGjs
 U5ajbx/q1OieW8KhK+gqZ7gEo6ouXgy9e4/SfoOEDjvFtP/ZmmBubN5QZ
 Hy+Hyl9pcIpiMQiqxAqYgdOL8PbAvt2SF+5PoZeSZB+MQwoZdO9RR49QR
 HyeLmD+dNwtrsyxhI5AHZkO86NOx4SvzqVIUSAdABNuSZKLeiZQKbqSXq
 WQ8MdlHeTbMQv3hMCZ4A2GJwplQI3AMl0FVNrPJImp+NGp1H+BVBw1ph+
 WT/wV+5Zk0cqAk2at/GJ1O/YZ/yc29olTsrRYnjK5zwhlJCAQ+lx//oCS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="345165037"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="345165037"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 08:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="862539125"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="862539125"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 10 Apr 2023 08:38:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 08:38:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 08:38:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 08:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVa9Yypkh+0/PxcEGgztNNt+1WX5bE96DtlvnZWusARfjikTL22/K9CpXizG58ca1fIOXgMyqyj2aMfDXe/KIUIkJ/ngfgS+fWwn56dicSOkc4r8c+PgckoA6k9emVwnvHvTU7FUxf9gf8sQPjUOwIV7CmzEb+zYg8Z21ZoIFN3dRUiss9YjGiQH2V8fRGuxeIOFAtdy7lRSn5MvrrZcdbFTkS5TxgqEmZRDOQfXz/7Fz77Ay/yZOVFGR81QRd3SHDIU/IbZiNnDO9GjTGdwvmX2zhgMMPlKVNOOiohdycftHcEstdl32RANuL1+lCSvaKcw9B2eQrUVfaCqpEEIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz5PIcIP32IbqMJZTP/bUt39TgpyDuX9x7Urks80A+s=;
 b=VM5bV3Gb8wytKICV4tbu87OFWwtCiuBxYWLgL+l1dn3LU2Th5BHKvOG8E9PoT8yuFZOo3yOBxopNH8098D3pNzH/hZlYPNiIOORBKWmOBdKj7GNMFYRHxO0QEP68civCOKx9zUKEscV8FGzx+wM0fsZAz6IUkybPdXkgwhS6BuI8ATQ9iGkCqT2sAjfXj/yciCQlewNx6OJShxIRdL3xAgN7F9m//rmubAubvXmDv3UDtUos4gqwYZDhvOX+nnRYFE8nPrbeS+VZiyPxY655Vyiij0TfNYB37xkhfeMUiE3AGca+wjPSYKHwdo7KHMpJQVfdEvhfUCv/XsrUT5sqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 10 Apr
 2023 15:38:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 15:38:38 +0000
Date: Mon, 10 Apr 2023 11:38:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZDQteoVKCktzyNus@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
 <20230406143133.29474-4-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406143133.29474-4-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:a03:100::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 7351e8c0-ed34-4b30-d121-08db39d9a767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c2QU2nJGoxjqVdJbzsjflj+6GzFeRNNDPNfAxJSjouwcrjxsDQbNhzSkT9aoUps6SfaLCd3f+BGmvFSjSWM5TQ3Wm1ekGaP+cnEVWe271rRw8QssLfRmhfNK0iXM4iF5dK/N5dQ/4OdvLDMF8XfMXvX8HQfyPz73TEH8yCd55azdyPeOqFMNQiSNuH0PMKMFXUtT4EUUnlnvzpjDJTDkZpaW6/Z1CHcLwOE6OA4u6GDalmTlqSLVJvZvDaUn0G1g9IUxlPGWhsaptnFFOzIjGjvijy73tunuZgE7Dc3zEjJG5cDlFj/z+YyCOwXV5OhjAnBOR/WcXpZTW9bywLrioC1JgS5dqG/mDTZRtHQgHjJeMKXAmTXRkcBPa9tBczMIz0WaAAZzWc7MWtkxNpKwY1+XuwGNgdtDpaq38gCuJcplx8rlm9WYOXaTNidnQ7g4ZicpNFsHB6d66drfo9oJQDct6c9MSC3EgoGB1yW0n4aVyBVG/DX2PtvFGuukmmJSTwh06xtefbx6HhcwVEuVmePaUT0akIQwGwLA5rbakGX8ddNSva1yjIo4pOSqbM23
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(86362001)(36756003)(37006003)(316002)(41300700001)(8676002)(4326008)(6636002)(66946007)(6486002)(478600001)(66476007)(66556008)(6862004)(5660300002)(2906002)(44832011)(8936002)(82960400001)(38100700002)(186003)(6666004)(6506007)(26005)(6512007)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lDUJ0INH+feKGPT4q87XA1HXKGMcbk+OblEFHjGTJsIjrTRpvkqq+LV3H3?=
 =?iso-8859-1?Q?0kmMSM1MVBjXTDWgswhwBeUYTA/7zZbGd5wCFgJcIO708nn56xofxV4j5G?=
 =?iso-8859-1?Q?G3R9oh/7eJCaG2fe8YiqV2aQUK4TlsjqU79gyPc+OqqU85h7oc5KZItSCk?=
 =?iso-8859-1?Q?MyG+BnsWPKMOmLCzq6osT6lU6mj3DngKaDyf7R/YnyujXlNZZ9uWocAEmS?=
 =?iso-8859-1?Q?m0ZsdoOWOXvQqvAtM9nAjLJgblRzgfG9oVtCl1AWljCN1S7gprNvrokKlb?=
 =?iso-8859-1?Q?lSRJ+a+3CJKNXNTmZQ92VD2KHFaHKfqdDuqLs8jbMWsEclyhFVpLDe8Qmw?=
 =?iso-8859-1?Q?6epaoaG7S0Yr2f9PM0wLLjZ05iv+LeztnLnRc0I4ZcmLzvFBSyk283rYfZ?=
 =?iso-8859-1?Q?vLruabtYJyRxsHnNnktEkkQiMVbpKk1nup+xBh2EmJJ08HnISiZJq6tIdF?=
 =?iso-8859-1?Q?8X70Jf41OQxZv3fFWlNZ6Sao5ILik83O48DjO+WlANPFTuA3kGnfXdmr/w?=
 =?iso-8859-1?Q?NaWzoMtSYnzpFR0fx8oeiOceh4UBS4hE8nwgy4nT5dkasis5YAoWbgxSgG?=
 =?iso-8859-1?Q?YMReIaEitN+QcCpO62a3T2MQuQl0iXyV0ZZQy+qTE5U7iLIrD0xC8/fjrC?=
 =?iso-8859-1?Q?utUzL3bOwovib7G+1qmzlw+CvACp3aPtbCo6oOX699lRh0Rjordkw4FtF3?=
 =?iso-8859-1?Q?Ulhk9LqSEh4+NHo6pQ/456wTlC7lZMlV7msDf4TEnAMXrr1ALkfrL7n/9h?=
 =?iso-8859-1?Q?hQWW90daBxUqObIl5u8OQnOGO9YqNMPgwTM+QonUO9lxUVXk0RIGeiTYTW?=
 =?iso-8859-1?Q?yBuABz+fHKSY1gA6UCI2J3Dt4W7WbJ0/QJFgLqaJNPB2CHnQ9ClCVTpFGD?=
 =?iso-8859-1?Q?fer0uYwOWij9pq9+eQ9dNPgMnndM5pKfQ+ez+dPaBWccK76+4qOJBlZcaT?=
 =?iso-8859-1?Q?S5rcWJPPinpVSD6mg8tqhgS+ezs2Arde29FaHxZXg5YGx0eJmWtKQaqJr/?=
 =?iso-8859-1?Q?xIYIRj+2Od4+CQGZpCtMe8XBY+IVymvlbOQWKBTQDMQxmclg65S1Kg3uIa?=
 =?iso-8859-1?Q?vG1XaPMxZOHFjOiHCYsgKKzGDamBR2QztqPqd0CLvE2dM2JE54BsTxHQXr?=
 =?iso-8859-1?Q?Tt9otsbdoAj0l4RsxMsgBYGtj1BmW3GNGAAEyDPC8a6K2y21/J3r4w5J3R?=
 =?iso-8859-1?Q?Taip6ivsIQ9KeEa2M2M0GpJoFdDvJdLDkqRDxfgvEddj22nBJEWziucJWL?=
 =?iso-8859-1?Q?JpieZkk14/VhEfOD/+y1dQYOS6xmDm8BgieNFR568mNvE7zOsmNiKt9gdX?=
 =?iso-8859-1?Q?mPoiEVi2QJhN6TN3TwD9MxydSGEAZkb5RbFopNgCJjO/+I0+E4XQfuaZEG?=
 =?iso-8859-1?Q?MKGD2lhK8sC4FPdoLGCRFpOdjOup1C+1lviTIVBCqTeNupWIdu0BlUVcTd?=
 =?iso-8859-1?Q?LXY56prToVqc19DEBxTYwPax8CczsohP9zqPBqUSsk274YRKAuN1qi22Bz?=
 =?iso-8859-1?Q?IDHmedy6RoyktHqNxDHJcg4breX6CX5eBe5ES2jxHE0ssIXABjSK0Oycfc?=
 =?iso-8859-1?Q?BefZfeCFa7kyLFwpJzTprTnDX3S4dEwLD4F2gneY5I6nW2IGoZEhqhCSAR?=
 =?iso-8859-1?Q?EnetmzZDWZDfEauv9oyi1Okjb0kFFNh56H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7351e8c0-ed34-4b30-d121-08db39d9a767
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 15:38:38.5964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYrESLVtfN46bBDpK7LpldMxwSHishOXqiEOc64PtteCfv4zIu6a8bvRbNTFKjXAqe39YIEu1BxTBQ0C0vAfuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable
 modular fia in TGL
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

On Thu, Apr 06, 2023 at 07:31:31AM -0700, José Roberto de Souza wrote:
> TGL is the first platform tha has it.
> Enabling it for DG1 don't cause any issues as DG1 don't have any real
> TC ports, so intel_tc_port_init() will not be called for DG1.

so, why do we need to enable then?

> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 5fab5b9fbde0c..0001a9d02495d 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -486,7 +486,10 @@ void xe_display_info_init(struct xe_device *xe)
>  	switch (xe->info.platform) {
>  	case XE_TIGERLAKE:
>  	case XE_DG1:
> -		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
> +		xe->info.display = (struct xe_device_display_info) {
> +			GEN12_DISPLAY,
> +			.has_modular_fia = 1,
> +		};
>  		break;
>  	case XE_ALDERLAKE_S:
>  		xe->info.display = (struct xe_device_display_info) {
> -- 
> 2.40.0
> 
