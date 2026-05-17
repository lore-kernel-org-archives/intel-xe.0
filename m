Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DA1CD4F21
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 09:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9561210E1F3;
	Sun, 17 May 2026 09:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEEF5xP+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E8E10E1F3
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779010029; x=1810546029;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YxFB3nFy21VAIX8EFbaAZ+/On4qTgrUbiOSm00AAgT0=;
 b=EEEF5xP+R33rrP4fd8z4Y5gEYB0F3TFYOwrloUe7ca41JcSGBA9ItUrW
 rZNmch16pUVh3uZg6nHgQDMMOjiVKM1wchAOR05H0mhCIyXesCrbAsIC+
 coqYepYWGGLahDaYhjziDozzD6ecMijpU3sAnBTi6RFrLRlxrdlvh1dCr
 x5m5hMVbRdof1+X9JgQS/UaOXR9QJRt1ZuwWiAnRtF45CYudtFh3RHS6s
 1Sp+Jby7wJ7/Tetu/LbvXwXVUiNoWWjwXgvV5/vMtiwAeZbtMzEt0sF5P
 JofXO1NabSIW85dnNNmFkoXQiv3Txm6AgRHl3zfUecE9op7VscmDUo0Ti Q==;
X-CSE-ConnectionGUID: mMwU+wAOS6KFxpVxY1lsvA==
X-CSE-MsgGUID: oJwil6aYRUeI1LmRH948NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="97463467"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="97463467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:27:08 -0700
X-CSE-ConnectionGUID: vVD88Pw1Squoupq0H/zUJw==
X-CSE-MsgGUID: G9H+iULnQ+GIe8AzvTv/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="238257039"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:27:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:27:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 02:27:07 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:27:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtgoOcPvju6vZD7K3CiKDXflNOaxcORvKrvBM7psyhkyRY6QMu2cnq1Jb9FriA7+vs6e9YUtKcLbzpt55xrZSw2tLFkm20K2wyecr59iAb3Ru+oYzMkx1Eg9229ImH7/2VLZvw3pLIhKxwYgdd//8FCLfeF8yAG9ggvZ8XtdDlfDmosQBRbSw849ZntkYdZdUSOTJMCVZiESp/tVii2fOLP2Q3rK7L0GsES+P1h8wRnnGhku9CQQQGUAltQ1T2Ai7vxwPgpxqlNzF7jGgPunSFJO3RNRdhhtpbZVrgiL+sTfCa4iqPULUMpQCNHAB/YIWNPFhyvwj8mhhqAdbWyEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WL40ioOEyCvDtzfX5+Fg3UKq5/iWMTFoS/Jqz2e+qZ0=;
 b=cSL5V/Dv8D3Pz+O5oUYz89PQyA/Hi+ASuAN2u/eREzOfPyZrxV7u0Oh52zRHLzJmSh14VYcEHJ+/ShqIe0k3XMqhsZ0GcU6PmhE818WGTD/m0cgWLU+BH/J24PTmEh8dsssIVcmrENK4PvMPGCducY4w+AH0n8Bk6pRKYdb5BokXPn0RgT3xkpkIM9FwH94RJhP84Xt1STxqC1rWPtZ4/o/8kVUbIPocSkTaPjTxYXIYQsab/fSaVR0CqAfAuf0CCE00E7hUKf+/0uOBy3/Tikxez0+fZGKGQN0nYhF48wS1+I/QccojlkBebra31yGNTQw6f/mns+jvnYUzwyTiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.12; Sun, 17 May 2026 09:27:00 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 09:27:00 +0000
Message-ID: <69468a7f-d8d8-4450-adbe-2e4f8d46a0f8@intel.com>
Date: Sun, 17 May 2026 12:26:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/xe/memirq: Drop cached iosys_map for MEMIRQ status
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
 <20260514150010.7123-10-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514150010.7123-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::14) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: eb35b12b-9494-44e3-ccd0-08deb3f67218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: SL6Gp2PMlKVIT5Is+0uUzBX1UZEpGIT+/c/tkMvYqleTy3KYUuWATZ6tmDNubP5nhefVHGTh6pl7sbtDtpMCi0yH1VpbWnGxVYnsmZ9WnYwB88ch8dVnc1wZ/kHaMsaDcpJmXoSe72UqBDwgdZmJzM3kkZtSFIjfE/kYpZDyHa6GN8g5NZyOoCi73a+lazvskF+AsU3abzoJkqZcBSadYlTsJduEycbjXCkQJNxnRG+sF37lws+hgp5K5tXqGI+/omcTKDqAMcl789L79CyxgI4rgJebOIUwqokMHHF56tQEt2M9tp6FClZ72U3rznMWjaixJUNLPgGlPetfpdI7/YluNxm1Juk8S7GDkDQ6gNhM/yUJmIjyMtmNZ+SlS5iqmjW0UDfwnwXinvBN8G5f0Dzm0Uoqfn+nyDRVLBnsY8tnMVZ/gpm109zGI3CZ5D69drj5j4ywF2HMumdeSknTNKnpbKjwIkgFEO1LpWxyXj1sD+PNp0y/tq+8p0BOe+hmebh8w3eYyK1hFvmZRdWjhdt+kbUnlyv4B4I/tmi5rek7B/vSiuiepgaYY1OUGX/+tLXUHtZnfEHm21uLAqzQT4MIe2Qb3HvhzUbNaKIn2oKSYwbW/egs6MbPur4KebjDpzGCVEOODBPV3qCOoEoye1dT4+VRspeZmGZ+ckspnOel+E4xfd1wOkpsvGIYzh7Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzhOK0VaUUltSkZ2eGw5WHFCZUVGOHZOeFNoTzE2MXdjMWJ6WEd0eTlBUWZR?=
 =?utf-8?B?SXg2UlVQQkJHbE5MenEwWHBFMjMxY1VvTS9tMURyZGtlaWpSLzVLdmpNY096?=
 =?utf-8?B?TjBLQm1ta3N4UGZLVDdaMmp5a0lUV1dVeHJaeE12ejZMYldBQlRWa3EraFN5?=
 =?utf-8?B?Y2kzY2M0em5YcTlaOEpFSzJLdmZTQ1NFUzdQVVEyOStGdEw0NVN6bTh6YVJX?=
 =?utf-8?B?bEZFSjRnTEJJZXcrMTBBNHBoL2QxdE5CWW4yZDRTWmg5UkxjTWs2VE8rWU8w?=
 =?utf-8?B?WE1LY29uUXVLdFkrbmVHcTlpRGJNTkkvb2VyRGR4TCt1OWlReFE1cWVIdWRj?=
 =?utf-8?B?ZmZmd0tLUlVJZmlPYnRrWDJPb0dIaFUydXJCYW5GZGFKT1JGVkpMWUZ0eW9Z?=
 =?utf-8?B?anhZVlJvbE56TFl0L21JdkEzanAzWWZOS0hrWkFlRDZYWFA3bW1LdDc2dEoy?=
 =?utf-8?B?blIyMmc3ZzVieXl4QUJ1Q1cxMG9HeWhSeG42enQ5M3JHZHR0OWZ2c1oybzU1?=
 =?utf-8?B?VE1hUTNKUC9PbGpPSmZGUDBScXlMVmljWmMzdm9yc05iNXZkR1FXQkkzaGcz?=
 =?utf-8?B?bkFaaDFOVjNqYS9iczFqN2pkMVFWd2J2OUc5N0lrRHRKUEpzcElNZUs3Y2JX?=
 =?utf-8?B?cHFHcTEvK0NZN3JkWXlWR3locVpaUUlDWlNCNm9RUEdpcmtUaUxUenNrV0gw?=
 =?utf-8?B?RDUwMDUzd09DQ3FoWUFVdk1nQnN4a2NWTUw1Z0NEYVozNlFKMGVodFBYWFU0?=
 =?utf-8?B?NFdpdGRJZ3RWb0lkOGdZQlNzUFFMeXlPQTk3cy9FVjlFRjVTWWZUY2w1WHBN?=
 =?utf-8?B?WGNMTDgyall3cHhOTXlWVG1NRmh2L1lFZWtlY2NwVjk2NzZicloxU1lnbEdI?=
 =?utf-8?B?aEdXeFJoKzR3c01hanZsdWJzU0VwcVBFMGFtbVgvcm5TR0ZLaUVoemhWZ1Yr?=
 =?utf-8?B?V09BdGtBTE45WDhkNUhrN3hWYTVwOU5CR255VnozUEVCNVJvNjdYL3FUdkRF?=
 =?utf-8?B?WGVSRUpGL1V4dnlSV0M0bXNCZ1dxRHE2cVZ3cEd2VTNHVENxeGloWmpVcEJx?=
 =?utf-8?B?Yi9zUVgydTVrOUN2YnlyRGZvOVUwZkUvTUpSTXZWZ0JvN2NDVENYVCtRWVA0?=
 =?utf-8?B?eGlQTVMraHMxUkVPK1F2RVVYZnBaZitkRE9uUWJ4MDFVbGx0amJJdkttdHkw?=
 =?utf-8?B?S3FwSStNMUxYaGIwTmE4ZDVPUFBsRzNiaUE5NVArN0MvZzI4eDlraXRTdTlt?=
 =?utf-8?B?SC9qR0lhbkRkK1VuWTZaeHVYSjd4VXVJMVM5d3hOTEp1Si93VjUvU2RjckVS?=
 =?utf-8?B?bjBzeWhnQ3diV0xkNjJUVVEyRG9jTG85YjNxekJvSWQ4d0xnWnB2OTQ5dmNG?=
 =?utf-8?B?TlNzV2pkb2ttV2QzNVFXT3dDU2ZYMDIzZ1VxUFdmV1R5Si9vSkdJaGxmM0Y3?=
 =?utf-8?B?c2JKNlBOWVl2dlBLMmRISURFUTBBUzhsSTFXYjVOTDNvbzdud2N0enRqRm1T?=
 =?utf-8?B?bHc3WEhjNnVaODVVKy9VQkR0N0RCS3VCbGhKR25FNWpINy9hTmIxZzduRUx6?=
 =?utf-8?B?Z05Fa3JCTm1qdkYxQUdwZ09WMmxBWXdqSmZzU1ZwY1lVejdtcDM0TGNSSWlh?=
 =?utf-8?B?aEVSNEUyZ1RDQjZKVjYydXFJOVBTdlBiRlVOeFlEdG92K2lkVmJaSEJndWdi?=
 =?utf-8?B?bythRU1qcit5aUNZWTlVVndYakw4OTVic0ZoYlJBL2QzVnVYaXpsRW5MY3h0?=
 =?utf-8?B?dDhic3B3T0RsSVpPMGpCMU5ORyt0VW02MUhkV3hYdFJlRWJCVm15VDllTmND?=
 =?utf-8?B?V3dwOTVOdzZsYUVxWHRNbUZKQUVFMjhrRDZmWjFXVVFPNytTVmRLSHd4UGdh?=
 =?utf-8?B?eDZkWXpkNnF1dUVCZXl4UjJQOWoxSWg0VTBpRGJVQythUUZQQUpoYitmWCtv?=
 =?utf-8?B?RGthcjBzT3pOK3c3STluSTFJd01jSzZkVUczNkxyQ2NnTGRPaXBGMWVrekEw?=
 =?utf-8?B?TmZFZGhqN3RTRXVFajBHcFZyMHd5TTBsS3F0TjVIWEFwZlFIN0FlVEt1Rmt2?=
 =?utf-8?B?aktlSERYV3NoRkphc1Vha0t3THM0S2IzTEdIUzc2Ty9OWFIwU3l3U3RoY1cr?=
 =?utf-8?B?TVdxaDdyYk5FdlRtQ2NwSzVXeXlGM0NSVDIrOXlpcVU0L1B5SVQwZk8zUk15?=
 =?utf-8?B?ZDRaOWlKeUFabnJpSXVWZCtLVzM1U2JLYnMwRXN5WmJyN2FVdnRiZnN0alVZ?=
 =?utf-8?B?QWo4a2l2TEI3NmlnZGVzaWhwUGNPb3dyZkZ5bjMzZUxXNUFDQSsyeS9JVHZD?=
 =?utf-8?B?NmxFcFp5S1Q3ZFQ0VHI4cGtGYkVrampVdTQ1SFNHVXBZYU1kaStSdz09?=
X-Exchange-RoutingPolicyChecked: UNUH8jfymzFhZTaHWFt3GPf3vt9JgDPrceTxFjhfuae7Xy5imc2a+jHfhkojUJ5zZ61VC852vneQHVjfTt405kXO34Vd0rhtRR9dEnPvuNNH/h8lHOXSktKIt+8RIsXDv7FOnOavlOiCAT/5oZCR8TPi+eSjA9Yx9Jaqm2+7RsFwkt9nw9qZcir5qwcJ9DEiTrU6GqvKzyff53DyzFYnfdQTxvFkq/JNeKVPvBlc3Svzx3iG74Oed+Zrw8US0J2Qe7Kreru6WkOCAq9KTOl1JlkuCbUe9LkNqZvFb5z9k4dZc64ZjkMSn1+11R5ia7l8tEwVe7doIxgLxOQi8CU2GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb35b12b-9494-44e3-ccd0-08deb3f67218
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 09:27:00.4577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACEGA8C9MqCC80AbS5ZBXmk7TymbNiKiBQkEOWnRc2YL2TCWgOh4gtaiWKYncgGTJDFnnwxBoglPdIhsQ2LbVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
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

On 5/14/2026 6:00 PM, Michal Wajdeczko wrote:
> Since addition of the MSI-X support, we mostly rely on the offset
> calculations done by XE_MEMIRQ_STATUS_OFFSET. We don't use this
> separate map pointing to the first status page anymore.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_memirq.c       | 2 --
>  drivers/gpu/drm/xe/xe_memirq_types.h | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 65038571b6d5..7fe1b00a0607 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -219,11 +219,9 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>  
>  	memirq->bo = bo;
>  	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET(0));
> -	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET(0));
>  	memirq->num_pages = num_pages;
>  
>  	memirq_assert(memirq, !memirq->source.is_iomem);
> -	memirq_assert(memirq, !memirq->status.is_iomem);
>  
>  	memirq_debug(memirq, "pages: count %u size %zu\n", num_pages, bo_size);
>  	memirq_debug(memirq, "page0: source %#x status %#x mask %#x\n",
> diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
> index 4ea3d1976d4f..c2b0b33d55cd 100644
> --- a/drivers/gpu/drm/xe/xe_memirq_types.h
> +++ b/drivers/gpu/drm/xe/xe_memirq_types.h
> @@ -16,14 +16,12 @@ struct xe_bo;
>   * @bo: buffer object with `Memory Based Interrupts Page Layout`_.
>   * @num_pages: number of per-instance source/status pages.
>   * @source: iosys pointer to `Interrupt Source Report Page`_.
> - * @status: iosys pointer to `Interrupt Status Report Page`_.
>   * @enabled: internal flag used to control processing of the interrupts.
>   */
>  struct xe_memirq {
>  	struct xe_bo *bo;
>  	unsigned int num_pages;
>  	struct iosys_map source;
> -	struct iosys_map status;
>  	bool enabled;
>  };
>  


