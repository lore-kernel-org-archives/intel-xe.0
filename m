Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FC7C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 14:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644EB10E95D;
	Thu, 24 Jul 2025 14:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6mt0IxR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442B010E972
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753368575; x=1784904575;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B3584EbUWXJhVFAq7c8lpBB2CRNXhXa+Fd6LAcmSyxU=;
 b=N6mt0IxR6de1dBxUDYdZDaemVH0BkpmfOfw6d5YuToGeH2Es1ZKOq7Jw
 +Fnrce9gp16SrutrWysgDF9PfPeckHs2LsyFMDbn+7wDIb0gIkSPIBNYX
 J3i01BN4DyD2Q+z6c8psgYey7eugHkcHGAgyKrlV57DEBHPO/Owkc0SkQ
 HlREKt3RH5hY7MPeZBY8nDY/Pfoo+3VzGRP9lM2Bk7Kr6pCUwMo3jdvEL
 DI1zcE936DUW8OVdARuLVLuzdNNChimWuzLNoBoSnbctWzvKLRweBD4ik
 QDL0jpqCwDeS8Ye70PWj++8tMRGsLZY5KMC6S6kj8npwoncEv+wj5jg6/ w==;
X-CSE-ConnectionGUID: r3mnsP89Ri+vFCPaQ0GH4w==
X-CSE-MsgGUID: ZB0QwL12TG+5v6E9YLSjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59504891"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="59504891"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:49:35 -0700
X-CSE-ConnectionGUID: dNhFSemmR9G0bhE4PARJ6w==
X-CSE-MsgGUID: qyTsZPq1ShmD3RgR7akVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="164559230"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:49:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 07:49:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 07:49:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 07:49:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0N35iaoGgeD4dpwHFGiszMsiQI8nPMLyw1wj4+ipKww0dvu8rK3NADfbMkM3J1usKUs53ByhvOO3pdVEXf1Fl06fdhOq4wQbOH1RuN0AYqnUAhVORuUR443P0NkgMZK7i/hUTxhUddLVsqKn0SLzhFBq6/V1B4AUljA5zJyBJ3LfXkBoDhil9s9mrRCRaP3E869kNh2ZCyzUiGpWG98k6aUFofM2ZaHGF48z2juKm5UdDF4XF6yjzhoUlJN7QQGCs/S5l2FycvHpkMM/HuwGJaFfRSDL8PKZGahn14ovAxJIQSGVWSAc/p/RoZhpStpRCn4LYeaGEOAcz/N/x2yCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohvRhmeuq1UPRFdNsTzgi4YFcvB7yo1dxecX/P7omec=;
 b=zCjDlbZndWJ3T5qcuVI9ctQYdiokNyuuardJIroYhP0YF2YJl7xr3r0J1NMhVmz8hWBaLCl7fB14SEEf4uWrHcf1G/Ynwx74iCWRRPB528Go4jtY3m/8dOdqrOM2XCKqaKb033c4cFnLOc/ufr5/RF39vIZpqGgjGKDDVSpXtgciNnsly8snXv31UIo2Kf3gigWE8p7aYQbzOCaXXP0TZaUQCwflTj0Ok6eOtcUeRN6rECf7h2wcLnbFeoTJVIeBSPwGQKSYeraymwgrhLy7btrwOStJxz8QpgUYg6cLMGVTG0E7Mg8zosmXjXeKGl2jyH4i5Jx4e3271J8VzTHd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 14:49:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 14:49:31 +0000
Date: Thu, 24 Jul 2025 11:49:25 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 01/13] drm/xe: Use emit_flush_imm_ggtt helper instead of
 open coding
Message-ID: <h2yvdahgc7ifjc3n2lx4ksie2zlc7q6vz7v7uopwasuj5mxdzt@ocuu4ztn744g>
References: <20250724131711.74291-1-tvrtko.ursulin@igalia.com>
 <20250724131711.74291-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250724131711.74291-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c3eeb7-889b-46f0-09c8-08ddcac14bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZAWK9OMi4Q4OSFqkYz+wkzbcjAwFEHQXr+zqdy2vJgN7+pJA06WJzDcnE4cf?=
 =?us-ascii?Q?33+r9SEbL8Tw7YEUsPYwKM6ssVFog97GykvlxV3bq9WUDmmyOX9uHEaYEXHZ?=
 =?us-ascii?Q?fkJF7q3KkdMmsV1jVtuDC7t+BdwuANO2J71XiMnxa/SRs0VU4toQuQ7GkX12?=
 =?us-ascii?Q?4mioTMPmOCoJ5phixjrBHGVE/PtX2pqrXjj56CqNH6XwVaxK9V8HgdsxLxuc?=
 =?us-ascii?Q?G/2JXLEcbrBJw6/hnlhE32MsdNvrvozc+5a6r4YT2jZLnLpK75bjAHE73Law?=
 =?us-ascii?Q?x1ScF1EFl2rj2l7h0CFjorfZSe1c9gSqX3MvIALm7f8l3JfFsdE/sN2AlVGU?=
 =?us-ascii?Q?DCYSoLl09epTNgbFucHOCl9Rw1lqgWZ5Fy3QGPU0PAFENdWg/+ajsd1cgUsa?=
 =?us-ascii?Q?WmHwIgsu3odveTwUXnMq78gBsX/I10yc4JQu6yxKGuglJF4/aLJY8b1G8jvq?=
 =?us-ascii?Q?m4Ok6aA1Aiwj0dOQ2hyl5Ru0/cTMTTKyB55863K98lRQkjgTD6h/wI8JBf/z?=
 =?us-ascii?Q?k22md2YML9zBn65dt7NjlCh0AFmSxiyciQF6y9NfrpFVPCGHi0s7UTj8bjVF?=
 =?us-ascii?Q?6D3poyH/Bv6mbQFfwOTxSTwh3ehKP5eWTa4jVZIPcSWcy1qazR7YuKsNCfvJ?=
 =?us-ascii?Q?o9VSqd6X7ysicO+uhOIdPE3mITjKSLeqZRPd73A1vntoF8PS03lDseGcNP4x?=
 =?us-ascii?Q?EBAoVBjhjV5avVwW9bkeMmxVJ0ogKo7cPiRP1o3Uo7gh2ePvhgiUP33wRdlc?=
 =?us-ascii?Q?aDZKRWK4gJAgjY4oVp4qDvkOyUeXInfCntxWn9Of22ESYu167saO6USThxc6?=
 =?us-ascii?Q?IF3UZH9bGbHn2SaqtIMdfKm952kM0d4Ahn2Ua/u0ODmHI3xmJ0Onl8az2BMA?=
 =?us-ascii?Q?nz94QXX2DNXEUsL8f7gNEVfMuzgy3IrBYv/xVKn2TQfgkQxWNGWZ7EeeKcek?=
 =?us-ascii?Q?nDOKLA5J7hltiYPH/gd/yXxsO9N2QoOWAaHW9W4sqvBxlm2fsli/SrD0fFBM?=
 =?us-ascii?Q?uKmPZMWgjDTpnxy5g102F4/E5IcvB1AIpf/NscaLPbJl9KQbt65+Sr+10uSl?=
 =?us-ascii?Q?gVnqG4O70/yOqUrGEYHzxJMtYt2e21VHIJbDGuBvOLd5fXl9RfaNagtLgC6W?=
 =?us-ascii?Q?97GklvJFdjt77pqMIGsC8JXkac7hCkL6OhAkQnHO698UonT8nX+81tHY53tR?=
 =?us-ascii?Q?fP7vL8m/RKbcUlC0ka73gKJCWKgphHCebJbOH7nWGXGqa4DXoZsXVoxQtgvl?=
 =?us-ascii?Q?dal3QvIlTPGF05QYpZOl3Ce79dPwP4hVW2+lKK7gihM/tRkVY/WPSTuFGbce?=
 =?us-ascii?Q?H+KzwfUWSGakJz1CfKUxcHR7J/D8dzESKx2qX4HvN8zkHMcqjb0aoDDIDscZ?=
 =?us-ascii?Q?1Pgrx5ffR+fUwpvoEZjDIJPZuV5qn+cyXHtqec3D5bHyxtZdFFxa/iR7cb3o?=
 =?us-ascii?Q?5cTKjbZiBQE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mow2Z1WAAY3svPfiBLm1yLAuMsNdDiyeECn6cuiEMIUubljKpY+JBXIr0ZVb?=
 =?us-ascii?Q?6uWzWypkY+EM2MPrzEud3EL6G8QyLgEhebGEIXlCjsZebOPVtdS6ZClWyxPp?=
 =?us-ascii?Q?ryDZcbEIKdGpCQpYqYGlH5uYe/mvALhKqwLoEZ1vCJWgKulUXc/04CBRqoHC?=
 =?us-ascii?Q?EAURlmL7lHmRaTHyLLHLiD7MioFkd8j/Ndd5megsGeJGCnvBVqDhF/2yin4k?=
 =?us-ascii?Q?7A1mV4RK0HUWdlEzol+C1ATy0sUHl8og6SyfighvAljZwgcHOIhsts9H+H1o?=
 =?us-ascii?Q?td4sk9tGJzkvBQeL2szgiBAHVGw0Zazbe3HBKZxkczTbEOXUpCfzOX8QgMro?=
 =?us-ascii?Q?uX8Sf6JxZT8H5a8B9cIUEWz7GeRp95Pha0rgtHFxN1+ld4WyGUsE7+IKs4Lb?=
 =?us-ascii?Q?ZTV0fS7xxa8ikMoUyvpgIMXKpEO9HhuSUx7MQZqkWZ0zKZ+K4JN4mNklytTd?=
 =?us-ascii?Q?zAk3cyoue5Lk7kOrXKeFHrl4B/kXw5I3krUSG1wDJ5tiLU2FjcQyNvE9b2HW?=
 =?us-ascii?Q?yfiU7x7OAkKWcdGB/64EMwIcDb8/L7p8rauZvzVH5/MIeFlziRPHfYI49b9C?=
 =?us-ascii?Q?nwTWJxFjwoELk2ZmWKgOL10nIVZPipk647/zCO3cKfYQvUdzdHIxoim0sMw+?=
 =?us-ascii?Q?5uYfjs3IVlsEIImCv2A5DcshaOCl7l6E4jzNbiYwyK+4JAG2f10QAkFJ4siR?=
 =?us-ascii?Q?rauvDSt+WI1roMgLQdpiAm5zq9Tk3xXgJNIn0qjnEiwr5TxclOemzhN/T8HD?=
 =?us-ascii?Q?kiu3qTjVJwtc2WkCZ/mL2JKb9U4VgKO/6SrzV9jnJHeQeBh+dlMkWsJNFIjS?=
 =?us-ascii?Q?X0xrQOiPAj+BkYHwz7mEqPT6NwjTh5fSZa2Qcy2ZWAKNlShSxu1phiycAgnU?=
 =?us-ascii?Q?xVJmwOpxDDrKgetARpsqZCEolzRSoT7YnJ/7WiIeS1gLy2qfgLIRC6fIdg0X?=
 =?us-ascii?Q?bR1lFw6kzbDyqXZShcoX9NUHMpvarDtmpjpY1qD/ipiihiLX2N1Tl8wwys+Y?=
 =?us-ascii?Q?Gbw6+owiySZ8rQ22uULhsPcaQ8dvLM2hrMf7zhD5SWQUq90fqPH47DYWRFWu?=
 =?us-ascii?Q?/298KzeOT/50Axvjegl09DxTI6Ihn1L0aWQKldZ4qegiZcl9AiStg+bawnqH?=
 =?us-ascii?Q?AKneBaKB5hY1p3PRAjw82mvb4VQxg4CpOchuEY14AlhGcDhMfuU2BGt78e9F?=
 =?us-ascii?Q?9Nc3Ei+damEEGfQf5FJ4u2EbjVezN1T5bD0VCezaT+GIihQR8+Hnise96ft1?=
 =?us-ascii?Q?FBCZxR6LjmhVOGzTfI+/azMa2wBJy/Ysm08zRWZ6o3c/EEWp3nxP8RtFX0mD?=
 =?us-ascii?Q?Wd17NlVQk9MSaOJlHJKUfb4mrRCvxBaxwBXp3ucKehw8XwWAlofoSMHh2M9j?=
 =?us-ascii?Q?qjNSf/Ge98pwBg2K5AlpL3esxCVCvBRc1gkE65TUqc0RXwZ1CX637Q9eDKkQ?=
 =?us-ascii?Q?eoypvl2pw1/3gE293J20kbzMja1xyL+AJJKjxoOwbGqCxkHno2ZYSlV7TxD7?=
 =?us-ascii?Q?+2MQt9ZRLPU9Fuqs9DZdNKhGDyQVD+d926zhJGzQ+WpsKzRlmr7gxhm/ALZI?=
 =?us-ascii?Q?gQpEouquRUzGAw40B8Z8mV5eezDfNg2QsLvHC2t9qItN4MlZ1WE7GoYAnBaf?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c3eeb7-889b-46f0-09c8-08ddcac14bf7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 14:49:31.4261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTn7VeVCgjQa4OKif7XublYL9UXPULJrBlsfYGST/q7KPgpafirPc4pGkPEQnfpjrXmTxZRpwudscmtAM61P91spo/78KGkm/wahT+/YL8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5273
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

On Thu, Jul 24, 2025 at 02:16:58PM +0100, Tvrtko Ursulin wrote:
>Helper is already there so lets just use it.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

no behavior change in this particular patch,
pushed to drm-xe-next.

thanks,
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_ring_ops.c | 8 +++-----
> 1 file changed, 3 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index 7b50c7c1ee21..e8f22ec5f9af 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -415,11 +415,9 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>
> 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>
>-	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
>-		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
>-	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
>-	dw[i++] = 0;
>-	dw[i++] = seqno; /* value */
>+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
>+				MI_INVALIDATE_TLB | job->migrate_flush_flags,
>+				dw, i);
>
> 	i = emit_user_interrupt(dw, i);
>
>-- 
>2.48.0
>
