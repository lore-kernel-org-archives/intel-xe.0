Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1DFC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D357C112CFD;
	Tue, 30 Apr 2024 16:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPh9cXR3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDB0112CFD
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714495671; x=1746031671;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=crEGT+cBWsJrAtTqak1gcnHIDMV/H7nnEV7G1pu9ONA=;
 b=OPh9cXR3mqR1eX0tN5CH3o7vwhY10nnzYge9eFzPG/ID3DC3KYiovTPX
 uPZKfYAuLPontKRQpzP2OXgtBufFSgiEYSIpnU1rT0xkfz+LReQgdEyqA
 HfLM3DuASCbBiZgHwNRcSakqS7tKZFkFW+z0EE9rSk/pMT1l/3ZWjXC/e
 zpmVEyOfBbYCh9FLXHxgcQnN+itxayzcb/ihseLqpcj9BQOsMVw9d7LRi
 hGnxTSy/KCDOrZGpLM0jkzRpF+r4iQkX3AO0ulGDEFAvBlVBlFLxIeQA4
 5QYNL7ex4Ruf9Y+amUGsbNWiOJUZKfRIW/5QazPADo13KR+gFIWMOkQgs A==;
X-CSE-ConnectionGUID: WZLxU5ceS6eo43Tfdarp5Q==
X-CSE-MsgGUID: XO2vXtO2QBGO2GQrS5TibA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20762614"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="20762614"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:47:50 -0700
X-CSE-ConnectionGUID: Pcmgy1BtTLm4WjujWflVtA==
X-CSE-MsgGUID: RG0HwG2aTmO+VgauFGNhmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26930147"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 09:47:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 09:47:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 09:47:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 09:47:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 09:47:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQeOArL3sv1J3KOVEEi2ElSBQsFJT8oTqr+zLuJtS0rOCvASS4F3Mj6HahigyoSDGsNAhr0ynvu8steikh1P0iMod8JgBsXNaa8/phcc0XTP2P23cmTnet9GRdWoGNj+oChOO/v8MiIm1MyKNmpvwoJsre6W+CoMoi3ZxynQa4AOYKTw3u5wYZuSDsyg/DLzNYc0k3n8NrO56m77FbtoTXjI8VFECnqpnDEmfSOq54GhEIQCU/7V0rse6fhsHILaLtO38kLK3moLHQ5NtIccP7D62hggUZkkxMeUnbpEuPSJnT0uUmWAL5bPZNgYidmdY26ek9ZovdlzC8O8PMK9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwVwXzZuEp49eDsFfuwmLKge+iajtOFUnM1qMw8md30=;
 b=TB0PcqoohQ0xpCh6/Rx5BbZ/Yunxixo+aLkMhIQyw0ZTw6Uw9zJ6fbk+yDbL5PglLyFUZ61EpcviarEHxR8nRlslhb2Ffqwg6hU0QFabEGZ9vhzkuOIbxiesGcY2YDzBubwNo4NV6Ox8zcEU+q3FAaM+MZQzUKNbDUTPTRk+s3TgaYqTNhOJDhc3wmTIVZN6SB8LVBPKkKO0h9F619N7TyXph9aLBzwiN7qEhh5VGTEE/oPOn7N349b3pHJFcP7hrkm8iXluFIYqv5y+uVthK8fOFU8kssLWwd2HQFAqgEaludE4u0aNf41kuxiWi7AlCkPHEW6waRlItYdC/eR/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 16:47:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Tue, 30 Apr 2024
 16:47:41 +0000
Date: Tue, 30 Apr 2024 16:47:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Perform dma_map when moving system buffer
 objects to TT
Message-ID: <ZjEgowaMK2IUexXO@DUT025-TGLU.fm.intel.com>
References: <20240430120214.5372-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430120214.5372-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7018:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f084d4-9884-40fd-b7e8-08dc6935408b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?G8A7ZZAR6Tmv9XkUxjsmJN59UMYPHTp5vwPTe1sCnRz3vg3zq+FUWC/wnt?=
 =?iso-8859-1?Q?Ev7olFPEFazUnINxYehPY84+P3hIUJmfCPyBnKEkKrHiucyr/Ymy6H/lG1?=
 =?iso-8859-1?Q?mgN5sB3RsGEkTxxpKuDjFQ/n3xXMPavw2AWgDsnDZFefyW23obZd3PCIue?=
 =?iso-8859-1?Q?TgwaRVrVTG+Y7B+y8nhN8MD+7Dtsu4cphWPkJhhbc1lzLf8TgaJW/p67mW?=
 =?iso-8859-1?Q?t5hOqT/a3S+3TktEZTYNiVHeW0pueghqdThmndaW47mnQtmv0zXpXaygqk?=
 =?iso-8859-1?Q?94RU4K0zmNVUKuMOAceIaEhelP2Duz0yrOgZ+vmD7d0OQtx/IqcqPxgp9E?=
 =?iso-8859-1?Q?wshrI96zrIFfE7irqjwwADKrzAOyZcq+0WR8yTiapgZnr46i1MgeqPqwhl?=
 =?iso-8859-1?Q?tXAV6HoDBgjj3TKYefXDQGbbYbNgJoMfAwlQHyiEtihRobNPD+PzdKzhD/?=
 =?iso-8859-1?Q?XPEOOjolbkb0pqyIc9Y26zTgH1fTMSgWDC97Et0CsXSXkV5C5NLzKLQNY6?=
 =?iso-8859-1?Q?2Mm+6S9QNvfsiYFsPhqeSuZ82I7+e2wrc9gr0JEmDQ8V5JqwmL5Hrt5AjC?=
 =?iso-8859-1?Q?ALf5YGQnLTknWUAEjVnsPaJSauuY1RAi76tx76zEYQPR2PCRzzCgkutNN3?=
 =?iso-8859-1?Q?Oc0rHx9annJ0WXOcYmPpOE7YQmipQ7NhiMPUPDC94UtvQSpT0L8huYajri?=
 =?iso-8859-1?Q?SeTsbBvsiy6umj+Vh234GGe6P9EnxW4rTC/ADqtqclTdZyItRNVUsNB9SC?=
 =?iso-8859-1?Q?CTXYp8VY4yRZPe3zLk9OSurm2+qVLrLRI2Nmcp6gYTqPUPx9YYQiIPmqFq?=
 =?iso-8859-1?Q?sOnkH6CgP4SIzIN3J+XhsOF3VeiMWLWFsDs6wQhGTdg5A7sg1sacek05tV?=
 =?iso-8859-1?Q?fgpZaD90RGZEf7EJMbsJTA7gyp5q3KK3kC7OhgUL1tlGtUyBV10VokyZjp?=
 =?iso-8859-1?Q?iWSFYk1xO2VLbLT61g8+tlTF4BI8xGl0+5vKCxz+1ge/H148u/7JOszziT?=
 =?iso-8859-1?Q?F8GRC0T4IuIrw4JD7kJZon5bhiBeoF/e7jEeosyZp2uf9NVMz8uz38wDmj?=
 =?iso-8859-1?Q?VQpAbyNa1QVbO4hiqSCJJCKTfk+8dY338+bWnXMZExbB6MNcvuMZm63WnI?=
 =?iso-8859-1?Q?0DfrnTwvKOB1a7mnkOI2LWFYEaHetQb224tIxsUb0XWZfruuLtFaGVMAXV?=
 =?iso-8859-1?Q?RLHH4kLDEHtpVuotclkCngG6B1uCri12IS6FGdPCVIVptsrApMBXCxvQkX?=
 =?iso-8859-1?Q?RAapgU3EoVMhuwULJTOfWr8DCQ/3AO8wnq8UjARUuOI750Fa7JmJUEmhF5?=
 =?iso-8859-1?Q?Q06dYVDbFTj571DDPHmBobcrrA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VDj6oSDMZMVin733d4C4z2+Le6AwuyEMdQi/PzTovEI2lCRbP5BzJHLe0W?=
 =?iso-8859-1?Q?OeKqLTcPLOqWUoHiNuKhBIWlrcgHUGhKBpYJXT5lxBg9Zw7uVUoCu8j1pD?=
 =?iso-8859-1?Q?/DoeHk5wvI16KJDL8OeY8Dkuk1OptXnt2nWtVS/fhq7TqlTzhGRKA3xKbf?=
 =?iso-8859-1?Q?tWZPSgw2oVMhs4syVagDMObz0eUxcI4VESuPscr0xa81/dyTGSAQ23N23R?=
 =?iso-8859-1?Q?k1oh8cc08B1XszQ8/+mX4GQfRAAro++ZjI9unjQnbx6AY2on7x9kEgEl1T?=
 =?iso-8859-1?Q?Vt/XQwi9KFHbpsAlTtlLXxkEn1/ySYZGkwjwd8Pncr1es4Y8FQ59b5lceC?=
 =?iso-8859-1?Q?Uw7+tpKeSM8AnpXXdSR2wAXJnA0871gpYJCt95pvYjrUrai2N7CQmhKsIz?=
 =?iso-8859-1?Q?mKg7gHa7IydSGmiN7lyAi0matkb4Sqqu6RET93Y5fB+F87SFW05FDZa0sF?=
 =?iso-8859-1?Q?JfY7CMCwfPQtbfOrn2XSyvzizeW+xFHt+0FxugaU7O1QkbFCKWhQWmgMM2?=
 =?iso-8859-1?Q?U4A7FJ0FCn0/nfidz+pNrKFZfcJAJCfmAkVBkfUJPLnflS0hJdIfnuqxsk?=
 =?iso-8859-1?Q?rbOQj7EPaUUOrV8bFlfEqQsstOHyzgZhu70aDLCIryVOWqakWZzQL8Bs7n?=
 =?iso-8859-1?Q?n9Hvu2WCSPnXccbCRctwLgTEwk4af182VJGmbfwQyNqTTUGVtuuve+vxou?=
 =?iso-8859-1?Q?dvc2IJpsSHHHyiiN/EU65pPKah1SnSemAeHExy1SjMwCfi6zW+HGN9nx/g?=
 =?iso-8859-1?Q?B4PLO3dBuyVTskiNUAU3aQj6Ql4BmSvuFFFgMKUZ9pi9qo/h7O9uHhlx9W?=
 =?iso-8859-1?Q?y/PnA9FFCwvHA7H89AOOIAAnj+ZbU6cjCptLPqfyjXOCPvWXMy+HmP/SdH?=
 =?iso-8859-1?Q?I/Cer2dwaTq2KEBFq1ljOIZSiVyVx2cu3qGMcQcPeYkxOWrUQ++zgmVQOc?=
 =?iso-8859-1?Q?KWjXJGxTALyPo3lUWhqppQkJV3WIVarA84h/qWZCdl3L0aPE0uKGpNX/FQ?=
 =?iso-8859-1?Q?27VhlHq8mqMzEiov5cCnkO2oErCKMwVRPDZemMfQonEaMiVdDov5bqJ8NF?=
 =?iso-8859-1?Q?czoARQx+cZbdRIoNDIDmf046y2O5lVh0nfWdOoaECtnXXW6VBD/HMZZ7Z3?=
 =?iso-8859-1?Q?IefmXcYgYR8jf85FjVzs1IQxh0LZPpufRH7aCgPkhfoLKxON0jk76u0Eua?=
 =?iso-8859-1?Q?JXjtvdOI5TqqzSn3rBqgpbsFQtsQANIbDcP+Ug4mMsKdXnNdq9w67ZhWVz?=
 =?iso-8859-1?Q?sBs/+rd/9yNVe7YrJJpUTUw+vCnml21suPfq6d8epYKy7U1plzJl5gkxNT?=
 =?iso-8859-1?Q?nUVMrRkzUb8PBM3ezm98RC9wRFvmbvSewYJHfgNSQz4MdA2ORdR2DAtWS0?=
 =?iso-8859-1?Q?nhPEOAYm2xYrsvA5V2rSHsBfVJcKCBxwohWlVp8Q1/A6DsbJ9drtLAiyiq?=
 =?iso-8859-1?Q?KFU/FOtpgD5fyvEmJPNFgFKz9i3mKt1Aa43FvUejcTgaLdXIgRpKa3m6I9?=
 =?iso-8859-1?Q?5ap4WeoETIcrO7e3/doCsesM/Kugr8laStyCVgEiLNX01YyW+NPmy/sWOz?=
 =?iso-8859-1?Q?u+w2l/Fj6BkaBbeXrB3FSTFl/VanTgYsVLMZvpj3n5qCJDiSad+zuECm0I?=
 =?iso-8859-1?Q?WMeckD+N9UbW2IsoEidHRLjKVKXf3qnclouUqLcAHEWpzhc1Qor8iEXw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f084d4-9884-40fd-b7e8-08dc6935408b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 16:47:41.8060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdGeVVcartPV/Ob2sT4aTBK22F6xxmE0emldxGdI+Ymvnf6IqDidwXpL2cXQiJP9aWN3qPMShP57U5LCF6Lq8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7018
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

On Tue, Apr 30, 2024 at 02:02:14PM +0200, Thomas Hellström wrote:
> Currently we dma_map on ttm_tt population and dma_unmap when
> the pages are released in ttm_tt unpopulate.
> 
> Strictly, the dma_map is not needed until the bo is moved to the
> XE_PL_TT placement, so perform the dma_mapping on such moves
> instead, and remove the dma_mappig when moving to XE_PL_SYSTEM.
> 
> This is desired for the upcoming shrinker series where shrinking
> of a ttm_tt might fail. That would lead to an odd construct where
> we first dma_unmap, then shrink and if shrinking fails dma_map
> again. If dma_mapping instead is performed on move like this,
> shrinking does not need to care at all about dma mapping.
> 
> Finally, where a ttm_tt is destroyed while bound to a different
> memory type than XE_PL_SYSTEM, we keep the dma_unmap in
> unpopulate().
>

Makes sense.
 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 45 ++++++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index bc1f794e3e61..4c1dd67a4588 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -302,6 +302,18 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>  	return 0;
>  }
>  
> +static void xe_tt_unmap_sg(struct ttm_tt *tt)
> +{
> +	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (xe_tt->sg) {
> +		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> +				  DMA_BIDIRECTIONAL, 0);
> +		sg_free_table(xe_tt->sg);
> +		xe_tt->sg = NULL;
> +	}
> +}
> +
>  struct sg_table *xe_bo_sg(struct xe_bo *bo)
>  {
>  	struct ttm_tt *tt = bo->ttm.ttm;
> @@ -377,27 +389,15 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>  	if (err)
>  		return err;
>  
> -	/* A follow up may move this xe_bo_move when BO is moved to XE_PL_TT */
> -	err = xe_tt_map_sg(tt);
> -	if (err)
> -		ttm_pool_free(&ttm_dev->pool, tt);
> -
>  	return err;
>  }
>  
>  static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>  {
> -	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> -
>  	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>  		return;
>  
> -	if (xe_tt->sg) {
> -		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> -				  DMA_BIDIRECTIONAL, 0);
> -		sg_free_table(xe_tt->sg);
> -		xe_tt->sg = NULL;
> -	}
> +	xe_tt_unmap_sg(tt);
>  
>  	return ttm_pool_free(&ttm_dev->pool, tt);
>  }
> @@ -628,10 +628,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>  				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>  	int ret = 0;
> +
>  	/* Bo creation path, moving to system or TT. */
>  	if ((!old_mem && ttm) && !handle_system_ccs) {
> -		ttm_bo_move_null(ttm_bo, new_mem);
> -		return 0;
> +		if (new_mem->mem_type == XE_PL_TT)
> +			ret = xe_tt_map_sg(ttm);
> +		if (!ret)
> +			ttm_bo_move_null(ttm_bo, new_mem);

Random ranting, ttm_bo_move_null is a terrible name. It is freeing the
old memory and assigning a new one.

> +		goto out;
>  	}
>  
>  	if (ttm_bo->type == ttm_bo_type_sg) {
> @@ -650,6 +654,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>  		(!ttm && ttm_bo->type == ttm_bo_type_device);
>  
> +	if (new_mem->mem_type == XE_PL_TT) {
> +		ret = xe_tt_map_sg(ttm);
> +		if (ret)
> +			goto out;
> +	}
> +
>  	if ((move_lacks_source && !needs_clear)) {
>  		ttm_bo_move_null(ttm_bo, new_mem);
>  		goto out;
> @@ -786,8 +796,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	xe_pm_runtime_put(xe);
>  
>  out:
> -	return ret;
> +	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
> +	    ttm_bo->ttm)

So this is covering the case where we have moved to system and had
pages.

What about the case where evict fails after the 2nd instance of
'xe_tt_map_sg' in this function. I'm guessing xe_ttm_tt_unpopulate
covers that case?

Matt

> +		xe_tt_unmap_sg(ttm_bo->ttm);
>  
> +	return ret;
>  }
>  
>  /**
> -- 
> 2.44.0
> 
