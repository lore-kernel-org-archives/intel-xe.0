Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318F0C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 18:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0703A10E067;
	Wed, 26 Jul 2023 18:58:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA1E10E067
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690397885; x=1721933885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T2IQaCinQKGl+xTqZ0OM9rxpxBNRAdcRbY3Pu1fuGWo=;
 b=KrH0pjksWmf8vcCD3UCnBgFEnk76xRR1MlEOWTeDFPtzz0ILCDZCpI32
 inO/85ECsL++q9owm0EO9WOq/2Bo9BUX5S5nRxsfTW5RAL8KVsc0AG/ix
 6obgjI1YK+cUKH2G0vRmimzitCmQHTMwI0dcPpdIbPYBaNXIjqljUEdJK
 CZ1Qc3CHF3ltvoBElzoK+ScRyosAQtVpfjvvbEyns/rlw44ht8iXIkWZS
 rmTcdJqMj6C3vG4vO/yNURCPMFBjTDUqe+QzYYbeIV+tC2O86LD8yVktv
 xU7hw6Vy3MQ20E5Ij7ASiF3tKwqc/kcw0HkOFbktzNH5dY3rz1i8ZgeMX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365564702"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="365564702"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 11:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816805506"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="816805506"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 11:58:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 11:58:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 11:58:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 11:58:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyCDL2Ral9dVSTlTtlNcYB8kEiJnOsh4kNKyA4BK0o0GFWlHxKxcuYJsZfM00+VEjlnr0fpv1eFEnNj/VBInC+pkOaB4H43pybAf/14w8ngKb0ZJGXJ6qD9GcJCFpdTRNIAg70vxQQAqB4gvmMIAbCz5I/d1xSNrRA2Wet8dY4CmQoEk6FbbDzaIDBHM+517xvYUbE8IF9NZpm//tMgSl+5zdUJwNazh/lPJLXWA+jtQt4HZDHvqh7xadCYG9qstRr0Ww8NJz+KT/6x3laEUGdw04hinglvz4Z/PoplIAbsC6Zb2AGuFkLZdew8+/E5jCC10cdBCh9XgYNUEumQlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDNtPLFn4iahGr4DgpfgVdzhGRvrc0esPTWe55tWiJE=;
 b=biSrsRqQ3oMtziFJCa5JpnydNZyLhokF3o7kMslGzzeSoRA0thbwxh9nMb6WbTGqReAfsIq7b2zapH79Yh4RPSF1zx5tMwwXwim2SHdplUnNJLEDZ2cZPhR8k7XIjXTd1XDTpN6yw/hWPhhaY5XhUx+TBS1R7QlVydz1OcBtmAa6Bu2QE6zO3/nYQGCAvxXSKbp6gfxsppa0AKtlV7xIezOZdRa23Sn+429UxmWnOBdi0ZpRvixRD08QKhRGWcrdEej/fD+SI8a1qc8amVP9kB7siVkxHwYNhZrntaNg2mG1Qf+ttoiNW94dTQ7nJWczq8BJ1U1nmvD9aBACkBo5lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 18:58:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 18:58:02 +0000
Date: Wed, 26 Jul 2023 14:57:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZMFst7HGWshO7/zh@intel.com>
References: <20230726164624.358822-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726164624.358822-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd0395f-466c-4098-e792-08db8e0a3ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vmc7/g2w8VYzFmYuZ9KS3/Qhi3lQShcWv3vj3orNJPk+btUO0Rkyyxoe0heW6syVUGlQoxLM3lRb4HqALdw+Kajbx+oce4p2MoWy60lSABXD7p8EAC3IKyo1enGsNt8sq4ktBiTvOC4UzSPCt0OjlcXGEWaxmD2DPmnMAPL5kK7g2r3KLpJQjuTWK0ugVeY9z5ckbB3jHcVPqO+igodPyGkA+lOGNfafjijw3vCpG/jFeECgUjWq5R9azhwHF9BUFAx09K2bXt3+5HPNupYqDOvKVMAfVRzDG5WcJ3r400ektRBka1WBOIx0eMNFJZn2IMdTMyHxqpPBF7iWrDCRGlVAv26JTo8l8xy96Vd54DycpmsgjGZF1nZT+q2TSdVFFnIU0Fm63rbG+IOvMFzW+w/8OkM9YrsqRo1JySlfATm0I/h/qSU8h2+f4vwVDCMHJU1EjKE/KHVm5h98VxxNC1spEe/t1a//+oU4/+GEBo2S4/CQjJRV5LlklGD5PvATa8U7aVE77zct54+XthSW9XOeQHFCs7Y5xRaOYsGQ33XC83e1anhHPAYHVCB+raoX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(86362001)(36756003)(2906002)(37006003)(478600001)(38100700002)(82960400001)(186003)(2616005)(26005)(6506007)(41300700001)(44832011)(5660300002)(6666004)(6512007)(6486002)(6862004)(66946007)(8676002)(316002)(6636002)(4326008)(66556008)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?izqi/4AFX4Q5y+kw/l+R5GunKXKA64YheBuoifzbox6/OHFVSk/SrwvAFLFR?=
 =?us-ascii?Q?X24XkH+6Fiy9jN2lra/QaVyi0EH670whaWqCh6ZTSGZlKVtTLjKeXm3aYk5A?=
 =?us-ascii?Q?t4sDgtowbj+hpR+b2N94Jfgiu13DLljUMmKJOh9uXysmy93yZWtc5MWHnu/r?=
 =?us-ascii?Q?7H3NTePoKFBUUF51/tTgFspzizgp+xr3bQBiXzUfqIiggkJVdSjEQ0IAIJeq?=
 =?us-ascii?Q?z7vlPQ6/NFZJ7/VUftZyHnqgRtyfCMgJVMgA3IidaP465WvyKxtxnxV+qye6?=
 =?us-ascii?Q?ehVQlh/8TGQoSo0/wHe/i1A1DlSg4g3t+Lm9d+nXwNu07WgCfwmPWVYJUGuP?=
 =?us-ascii?Q?0WxlURQp67/aXXwjdCoh272iyjjjja3sdpMgjdfv/MUg/VARAZ77dlPvbdW/?=
 =?us-ascii?Q?sgJXsUx/1zav6Z6AKUFPPmVvUPpD0ZN2xKJ7MB6dw85GHmlYKRFdWQNxvXJ9?=
 =?us-ascii?Q?ENPQjyKs7sGi6qXJ7zP5syyw3sJNv6Xd6F3g/hgx2BQ3EsO9WGs8JnDqTUTy?=
 =?us-ascii?Q?kmy4f3x8gi1IeYXnBC8Pl3pgIe46zd82Rv/vn4Jdw6apge0h+c++i9A/Zb4N?=
 =?us-ascii?Q?gbxL5YEBH1wgny82FBXWRDLYmUt/H4Pcpuy+/YR1krYRiXdKBsDTOgjknpse?=
 =?us-ascii?Q?fuBGcHqiiMSbPTZllJ1ln2VOAEdFyOeQ3y3rIxUHc9iXuIROSj/PmhIEY0ME?=
 =?us-ascii?Q?LEDrG/ZtuV+DgZg53Bl3R/fdFDCZNqZNCLFk7Gp3+QXC2mDAQ6m7+7rz9zdw?=
 =?us-ascii?Q?9Ez3t5AW0H+tahU1aipIwdU/fQ2iLpZitSU/Y5e+9xcX6xve9YlWoEv2vT2w?=
 =?us-ascii?Q?VpwfisyCRVfsgEJokwS4J3bBkNV6x0ww4HQxVSC3QGiUOGh4vRFj0qq8AtdV?=
 =?us-ascii?Q?oUQe5mjCRfoVOy0VkMLvlSQ7uy9+HajR9hnvXts20zMpLZj4jUJmbx7I7PDj?=
 =?us-ascii?Q?USAdacQGJLiaTYB9JxVKYEIXN21vgB/BVBebdsDGf0WgTMtZUU0+Hnc3OkHd?=
 =?us-ascii?Q?r7sAqJb6DLF1cxZa345rGdZBcZ2H3n/KBMms++8rFmWNGNAgDfPnJfGqpi2+?=
 =?us-ascii?Q?V9VRfORzVm/uOeSksDaaK5B6ZhovE2uSPWtEepRnBHvnQ+cOlhtyDZKw8jWp?=
 =?us-ascii?Q?lvVW75rGLHQzzjFkp9EVyNLIWMFhb3Z36+lwAd37E8Hv+uOWmdlZrKyZ0WH/?=
 =?us-ascii?Q?06NuxG5i929XeoODHkjjugjp5L2/1DCfPfp+8P2cUmKgdgaRHsveX7kZBrhR?=
 =?us-ascii?Q?XHfajMRvnBi9tApBoYTKdyXhj5h4+dXn/d0AMmzyDyQrJOBPNHT1IU02bH77?=
 =?us-ascii?Q?RVxI/Fwzbzn2jEoVgN1ClLSU4hNei/uEuT0p0nVc9+MQV+Y2IcZCtIynBf0h?=
 =?us-ascii?Q?Xc20NfJpc0HqigYkDPfjP0Wk59ZAM7nM2d9eJqUPX2Tpy9YEHQwDslWu/QUA?=
 =?us-ascii?Q?Gu8G9VvGOoGCKvO+8GEssDAJV975ZXWZ1uA8ADOAJBG1fKmLtWk4qNaiNfg+?=
 =?us-ascii?Q?8ijda/DpGNff7H4wyPkllJZJ7NIHQoSlrIT6uaePLMwEJZQM/x13dUQR6WjX?=
 =?us-ascii?Q?LbQU9yzWQ4c2DmoX1XDoxXB7DcOBXYA+NXkVYLMsT3LzufDHEEotWhxejNVM?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd0395f-466c-4098-e792-08db8e0a3ccc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 18:58:02.6766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz9P7aCOzmln0070NaBOfqlkN8XJNdqt1+fZvbBfU9C1P+jZK9NPmIqRil9pApKoUPOulq0GjR6RZHdAfG1zrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Signal out-syncs on VM binds if no
 operations
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

On Wed, Jul 26, 2023 at 09:46:24AM -0700, Matthew Brost wrote:
> If no operations are generated for VM binds the out-syncs must still be
> signaled.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6429d6e5113d..ddb1b4af6458 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3374,6 +3374,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  unwind_ops:
>  	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
>  free_syncs:
> +	for (i = 0; err == -ENODATA && i < num_syncs; i++)
> +		xe_sync_entry_signal(&syncs[i], NULL, dma_fence_get_stub());

after offline chat and after carefully checking all the possible
cases where err == -ENODATA,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	while (num_syncs--)
>  		xe_sync_entry_cleanup(&syncs[num_syncs]);
>  
> -- 
> 2.34.1
> 
