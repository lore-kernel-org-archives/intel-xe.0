Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E879C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 16:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CD610EBC1;
	Fri,  7 Mar 2025 16:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J36m85lx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1689610EBC1
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 16:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741363292; x=1772899292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dnnTZH0sB9T1LaQ4T3EyquCP14CJy5gHofqE3pFQXfI=;
 b=J36m85lxTlsPaDJPEYFKjQS3t4/77jc1G7hjXUZh+lda3hsiuGS/PuYg
 kQeRpa2sC9bBTHgoDKDQ2OGrzuzfwsu9ewZZz+eskDEmeokAd8Aus+EQ4
 1V+zk6IZ0aKUmhm5zE/SeYEyUozCCH2w8lOuF/LFhHhvToQflR1btChSP
 Gwk27MTfnxcI4alDgs+KynSxcJzaX37oGfwz6/1QMNK9RvLfWWMdwskGL
 JHUsmTdg6svYX4gckDioKq9HqGPsq7U4HKiZ4XsVkIN4epuzkyccTUHAF
 XRwwNf9KSRSUiJ2oohlQNot+8IrVwtf+G0i1EggT14lokYOssaIER85fq Q==;
X-CSE-ConnectionGUID: chXWrEDDRuSA7zjLedGO0g==
X-CSE-MsgGUID: dX/2wcJ+SWGO4/GGMBJTLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59973139"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="59973139"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 08:01:32 -0800
X-CSE-ConnectionGUID: fUao4UX+QNee1Lkf0BI8/A==
X-CSE-MsgGUID: 3ZO6MCqgQPm8mFfzEFUzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124390984"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 08:01:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 08:01:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 08:01:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 08:01:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHyPJ06wzyp7y9zKDeMRM1/Rv9J36dQig8zLuEq56bNzRQGDzbnhNUa4bQBOtn8YbOpy4diGGr2jknQYRqhZJGahOUa7ue1CZCsyEvV4Ae1uX6PL6ZSNk41hQG9LW5V6DPe/hQBiet9yiBVh2wgIbaadfLFCY82lBhT8qxovBXmij3MH60bwdrhIlpabLy+cQgT8J4ifc1pN8aQk5ASjFMc2RWfquL/ZoLP5kf+2AVfPs4+v1KZE4gqMRoyXo66eIu1aFOPdteyWBSJA8ydTVIIW2PfxLRO7a8O5GFcztWIygaRyJQjwUQLQlzucrpRIbAYRJCNnwavAqTv7u5zvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhYSYveWrux3EKoF5xIMfD9JhYfSQnFa9oQDSpRaQ40=;
 b=Sk2N16fZgBHYBzMQNBbEesWnvlRPn6H4W5/rsSr3Hv15Oo2ebEkH0x8rZylhxM/T0jWhglfBzUZn+cZHIJDTsajoBKXHmM7B05DlIH7gJM+BK8oujNYpZeZOQthTagpKNcUon2Q3pjtR1TjqP/78AWxRkI3P2yP3hKjasZ8BjAlWTh/1fi6wEKnyazNK9ysWYT/IhsRpD59Hls5hR3eaeLEUpXDWULDnuDREMajTj0HRdFLuQZf7RmAeB65cv1uTM9e8tjhbYxXhRCb2C0NdH3OXZtnQwK39Z1nlDxjVhMET4qn1/lke+fRtuilJKdt9JmR1NcU1f5rl9ErhgZFe9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 16:00:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 16:00:45 +0000
Date: Fri, 7 Mar 2025 11:00:41 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/xe/guc_pc: Retry and wait longer for GuC PC start
Message-ID: <Z8sYKUtK4FwOkvNY@intel.com>
References: <20250306233906.1043286-1-rodrigo.vivi@intel.com>
 <CH0PR11MB54444896702CEF7CDBAD08C8E5D52@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54444896702CEF7CDBAD08C8E5D52@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 2513d767-eef2-4609-59c7-08dd5d913832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KKWUfeVJiVNQpi6APGau9gWWXKxuCJPQFcbcWUae0mu8MMUn5RuSac6o2qL/?=
 =?us-ascii?Q?zTJJsMR5uzxVrYVzj+HGmYgtVc1x/QDLEz64FAWtEEuoA5Xl9yIt7KgEg3J8?=
 =?us-ascii?Q?4pmmfCNHkxdO+/ANdZAZkfu14x2592iqAjw88U94ZRIV4WIWbSWT5Vosrp3S?=
 =?us-ascii?Q?zvH140DEQeqVxK2koEsWiQppTurzKJHgT3mW8lta8tp9uikkIQxwnFYJIF2q?=
 =?us-ascii?Q?BNo0UN81o/MmGCAhORHYm+Cwew80lQ1aKsl87r0vo6WtwLJk3aO3YbJl1gxv?=
 =?us-ascii?Q?J95lIS5piaoUrPsL2JuqUaPRg+OmoWbgLbnrVjqa936l/D35ydhMsyhkFzOX?=
 =?us-ascii?Q?+SAcgxhWtNU4txZY7eZNHKq7yz2XNq3peM+qnBC/AHk3mDNmCN8hRItYi3vH?=
 =?us-ascii?Q?Vhnv0YfS0SUj10duGXxVbimWiqGwU/44qH1vFsEi8OEkaq+VMLrN5E/lF2Aw?=
 =?us-ascii?Q?tEflWACyireiUkCaxNivzyvtGkGdR4F31/lZombsX7GwGEXr2H2nMT5CPahP?=
 =?us-ascii?Q?gWqVzL5dNcHPCR9Yyf/8x09zAEyQj/+W8tPqZgujqeob92G7hA1tKmalYDsQ?=
 =?us-ascii?Q?oHo0bzamKbkS/ya4YszEPtugyPPrz/FhDvqJgsgu//Z5bNmKKHxcER4N39nx?=
 =?us-ascii?Q?vyay9y5XbSNgDjR+BTgY8mEV8I92c+8CIvio3NGpduHVPVCb6lDQtIern/Fq?=
 =?us-ascii?Q?wTeJGDCGyu9g10Zb+FTjC7zw1Nb+c9MVd+EXS85IZEdwiq9rt7F8E4ieYCmB?=
 =?us-ascii?Q?nkIKMHLHvBRIobHoVO+R5JJuF09CHMLjXjOrvjHxifME05OMfuycC5kBrN35?=
 =?us-ascii?Q?QYSpoOCEQhls+qtEEuahx4HD+X7nv0+p/iiQA7gJjA4ezy++4oFIBEiRkwKD?=
 =?us-ascii?Q?iOCKN06MSfTZXFid1BH0w1HbEkHG5aaKPh67Dx6eqiPgiDdwr9t0rP1wPdf9?=
 =?us-ascii?Q?QfU6fdgXe14tmh7gTYzpV3LAAlXp+mk4UMUYSCDAYOPVmpZwnQp6My59OfDO?=
 =?us-ascii?Q?8SnZNB5Qlluq2QBf0J4qG9KgKd8F/GvH07nCN50FpbdPEwbW2xAbHjpl8ha9?=
 =?us-ascii?Q?rOrbzNI4oI4PB+t7rUUh8gcDCl/JWyCKQYCqbx/IhLq0lhBBvPMs6IrWD4RL?=
 =?us-ascii?Q?kSbOWGumTvXi3hGQ68KTKkJ+dxTL9+qH4i1trJMc2FzoB73mQkKt1QkkVKFw?=
 =?us-ascii?Q?GmOwS8bRudMrP6DZCpjeCM9DVKR2s01o2I7MmOYnj0fiiJY291bo9/vvpaUC?=
 =?us-ascii?Q?Dh6z4l3TQBqvJLup5x2eTHzuUYNJPpSHQTLdH15qPM5rewAuKoNKy2gpAXIz?=
 =?us-ascii?Q?Xm2XLwGwM4+rUf5BapfE+vl+z7anWkcVEJSZBWfSF9aWh+3rVEfshyOMqBeT?=
 =?us-ascii?Q?bsv3vdHBiHv9NuY/QvxeumKmOjxi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+49+4R+Ph0+2aI9SULATVMq9SOoNGD4OOS/7gLiUk7k/AxD50zZHSj6vrYtR?=
 =?us-ascii?Q?uSH6AclASSLz0zVNYf6kjUNZmTWKhZZeE2kc3jNseQXGnz0cOJv9qpP38EuK?=
 =?us-ascii?Q?Xe+Tc6lquOp4cm8Sg/2kJgA64MvpEAflkjnOI6vM8cRXQc9RlGN5GvZ4+gy/?=
 =?us-ascii?Q?j0CuXaBb9MIaDX8cq+XNUr4QuVBRzHqVkZsd01xvAYYaJltENUX5mdh1pOp2?=
 =?us-ascii?Q?2YnvTtzCIkGXfpmu1Wys/vHHKiMpyfTIbycxn/fsvUholxQL4E0fhnI4aRIB?=
 =?us-ascii?Q?6ltKSNLeA+wUVcdYJFedul/m0ZCGuZz9rC/+2dKUfJs1gLn8R2/sIJjsA+u9?=
 =?us-ascii?Q?GrakEqk2KV458EMUmCcgbd0HywrgcjrB6PpjX3KhT+TnjGzn+uvj6tk1GP9E?=
 =?us-ascii?Q?+kfgSEpQqxbkQ1kEhKHC1ZqE5VmKnSGqTBpQtz61KbaL/w9SIe39q26iRImu?=
 =?us-ascii?Q?pj4Z6cqRWv0BgftyU6hJJc6XxBrHiYGhG8JperyrprsYhTMR7BGAEzR1GYZ1?=
 =?us-ascii?Q?XnR0joLdedWTKwlY4mtrcpLAV5TK3qTgbmls7wWgw9NxdwdCmrmR8YHpUsiA?=
 =?us-ascii?Q?qC7Ake50QpCJa+HHkiM/QFh0CZiZKxB+ywAofAS7S1wt7CZnUvoH+O9ma70Y?=
 =?us-ascii?Q?pOmS2v92TagqZfKtbMZ0fZaJwRtaDDCWV4RohdzuxZbEFAHNScukVF9Ry8KF?=
 =?us-ascii?Q?AC5F0p8UHBMFeUUb3gjU0pNkoujGo+rQy4Y3vpx/I/A6ZAyoNRZEdaeDBdOf?=
 =?us-ascii?Q?/DPOW8S18pG23SJmAyq+hzXFXUeYZiD40EhyMZk+KM80cmVS+eIQ9XmSIjpM?=
 =?us-ascii?Q?cvXkBTzESLD0h3Ij0+WvtS09jIf99U1oYvUm3ADOb3dW2ZcjcUxsiqbip19d?=
 =?us-ascii?Q?uaNNIN+ODIgULI5cjPW5LE3FRzOhyizt3Gm+pTk5XBG38BzKBSm7jRlnAFDw?=
 =?us-ascii?Q?NrgN+ozFKjELXewj7r5dXCmaNoLVFX324noSwHk5CgU8E0Ej9QRoTsvqyokd?=
 =?us-ascii?Q?XK/PposaopwYh5k731lwz6OLVEEALSq4C6nYI62dKdUgJiQgmEHeAKhRgjdg?=
 =?us-ascii?Q?jL0B2w2Jmb62zYn7D3z0NPzhbpQfz3s7dCldfmLYTCulxHEkqPvFdNlmSy0B?=
 =?us-ascii?Q?W/O9ErHsGZx67BsRtgrHiUVEegSnTuPKWKAWazRb7iRS6Om2sMJrdr6ajTSC?=
 =?us-ascii?Q?44DXP7M+w+SfWUuXFG9bHFGmZw48TKFN7JDyuxPYm/PadqeTAsap5FKCUDUF?=
 =?us-ascii?Q?qbModbqAMMvOoIx/pga+aY3ftJvqWKnzTjTXpm4DSiSesQzPGketMcyepA/t?=
 =?us-ascii?Q?Hzve0EgA74Hn7BRtiaPn45nSxccz3+OGyJXfMoMdJqvetsHqqEwzRnMWNxyv?=
 =?us-ascii?Q?Jy04+cdMRk4Ef46gqY0dj+SjhRZ7ULFIJlqc/jKh6Rd9tQYVdDbFUAjA5OeY?=
 =?us-ascii?Q?4AJCjIV51RcoygahL9AZpUi/Ne0kz11wmD4pezTVoUAv1nm5pLh7eQ2UVu6e?=
 =?us-ascii?Q?WmcqFHBlNJ2ehO8CngJcIb7LlFrQPTBD3REgElPTMziAxjw35S9gJAgN8YRu?=
 =?us-ascii?Q?8hxBRCXBUom57DquBC0aQQ7M1uUe3W9KMTBmhHd6edTXkWIe6HMo19lzDPdk?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2513d767-eef2-4609-59c7-08dd5d913832
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 16:00:45.4371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WWCwv2/BQeXdcyjcUI05We5lZoCXItdVSPoEhEe2Ld5372h7TxFglqPwlgNhivNVNlDG9NI1CCZb8sK1vTwUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
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

On Fri, Mar 07, 2025 at 03:35:39PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> Sent: Thursday, March 6, 2025 3:39 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
> Subject: [PATCH] drm/xe/guc_pc: Retry and wait longer for GuC PC start
> > 
> > In a rare situation of thermal limit during resume, GuC can
> > be slow and run into delays like this:
> > 
> > xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
> >    		 [status = 0x8002F034, timeouts = 0]
> > xe 0000:00:02.0: [drm] GT1: excessive init time: \
> >    		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
> >    		 perf_limit_reasons = 0x1C001000]
> > xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> > ------------[ cut here ]------------
> > xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
> > 
> > When this happens, it will block entirely the GPU to be used.
> > So, let's try and with a huge timeout in the hope it comes back.
> > 
> > Also, let's collect some information on how long it is usually
> > taking on situations like this, so perhaps the time can be tuned
> > later.
> > 
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> s/rought/roughly for the comment next to SLPC_RESET_TIMEOUT_MS.
> There are also two nits below, but nothing blocking.

will change, thank you

> Otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_guc_pc.c | 53 +++++++++++++++++++++++++---------
> >  1 file changed, 40 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 25040efa043f..ec39a8f2781f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_guc_pc.h"
> >  
> >  #include <linux/delay.h>
> > +#include <linux/ktime.h>
> >  
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_print.h>
> > @@ -20,6 +21,7 @@
> >  #include "xe_gt.h"
> >  #include "xe_gt_idle.h"
> >  #include "xe_gt_printk.h"
> > +#include "xe_gt_throttle.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> > @@ -50,6 +52,9 @@
> >  #define LNL_MERT_FREQ_CAP	800
> >  #define BMG_MERT_FREQ_CAP	2133
> >  
> > +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
> > +#define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
> > +
> >  /**
> >   * DOC: GuC Power Conservation (PC)
> >   *
> > @@ -114,9 +119,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
> >  	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
> >  
> >  static int wait_for_pc_state(struct xe_guc_pc *pc,
> > -			     enum slpc_global_state state)
> > +			     enum slpc_global_state state,
> > +			     int timeout_ms)
> >  {
> 
> NIT:
> If we're only planning on having two timeout times, and one of them is only
> used once, maybe we should instead provide information about which case
> to use, rather than providing the full timeout to the wait_for_pc_state
> function?  I suspect that there isn't enough information in the xe_guc_pc
> at the time to determine which case to use, so maybe we can just provide
> a flag here to select the timeout instead.  Something like:
> 
> """
> #define SLPC_EXTENDED_TIMEOUT	BIT(1)
> ...
> static int wait_for_pc_state(struct xe_guc_pc *pc,
> 			     enum slpc_global_state state,
> 			     int flags)
> {
> 	/**
> 	 * Wait 5 ms in the base case, or 1 second on extended timeout.
> 	 * No need to be precise here, though.
> 	 */
> 	int timeout_us = 1000;
> 	timeout_us *= flag & SLPC_EXTENDED_TIMEOUT ?
> 			5 : 1000;
> ...
> 	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 0))
> ...
> 		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> 				SLPC_EXTENDED_TIMEOUT)) {
> """
> Either way works, though using flags instead might be more extensible.  On the
> other hand, it's rather unlikely that we'll need to pass more options to this
> function in the near to distant future, so keeping it as is would also be fine.

I thought about that, but the problem with that is that most of the callers
are calling with '0', then you need to read the function definition to
see the meaning, while in the current way it is obvious to any reader at
first sight.  A similar problem with the bool paramenters.

> 
> > -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> > +	int timeout_us = 1000 * timeout_ms;
> >  	int slept, wait = 10;
> >  
> >  	xe_device_assert_mem_access(pc_to_xe(pc));
> > @@ -165,7 +171,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
> >  	};
> >  	int ret;
> >  
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS))
> >  		return -EAGAIN;
> >  
> >  	/* Blocking here to ensure the results are ready before reading them */
> > @@ -188,7 +195,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> >  	};
> >  	int ret;
> >  
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS))
> >  		return -EAGAIN;
> >  
> >  	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > @@ -209,7 +217,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> >  	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> >  	int ret;
> >  
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS))
> >  		return -EAGAIN;
> >  
> >  	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > @@ -443,6 +452,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
> >  	return freq;
> >  }
> >  
> > +static u32 get_cur_freq(struct xe_gt *gt)
> > +{
> > +	u32 freq;
> > +
> > +	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> > +	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
> > +	return decode_freq(freq);
> > +}
> 
> NIT:
> Creating this helper function seems unrelated to this patch
> and should probably be split into a separate one.  If you
> decide to split this into a separate patch without any
> additional changes, you can preemptively add my
> Reviewed-by to that patch as well.

I also had the same feeling when I was reading this patch again
before sending it out. But then I realized again that it is like
this so the forcewake doesn't need to be duplicated. And the
only second user of this function comes in this patch below, so
if split in another patch it would be a silly patch moving just
the 3 lines out to another function that is used once, so I kept it.

Thank you so much,
Rodrigo.

> -Jonathan Cavitt
> 
> > +
> >  /**
> >   * xe_guc_pc_get_cur_freq - Get Current requested frequency
> >   * @pc: The GuC PC
> > @@ -466,10 +484,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
> >  		return -ETIMEDOUT;
> >  	}
> >  
> > -	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> > -
> > -	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
> > -	*freq = decode_freq(*freq);
> > +	*freq = get_cur_freq(gt);
> >  
> >  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >  	return 0;
> > @@ -1016,6 +1031,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> >  	struct xe_gt *gt = pc_to_gt(pc);
> >  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> >  	unsigned int fw_ref;
> > +	ktime_t earlier;
> >  	int ret;
> >  
> >  	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> > @@ -1040,14 +1056,25 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> >  	memset(pc->bo->vmap.vaddr, 0, size);
> >  	slpc_shared_data_write(pc, header.size, size);
> >  
> > +	earlier = ktime_get();
> >  	ret = pc_action_reset(pc);
> >  	if (ret)
> >  		goto out;
> >  
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> > -		xe_gt_err(gt, "GuC PC Start failed\n");
> > -		ret = -EIO;
> > -		goto out;
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +			      SLPC_RESET_TIMEOUT_MS)) {
> > +		xe_gt_warn(gt, "GuC PC start taking longer than normal [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
> > +			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
> > +			   xe_gt_throttle_get_limit_reasons(gt));
> > +
> > +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> > +				      SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
> > +			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
> > +			goto out;
> > +		}
> > +
> > +		xe_gt_warn(gt, "GuC PC excessive start time: %lldms",
> > +			   ktime_ms_delta(ktime_get(), earlier));
> >  	}
> >  
> >  	ret = pc_init_freqs(pc);
> > -- 
> > 2.48.1
> > 
> > 
