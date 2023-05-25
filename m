Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BE0C77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 17:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C63010E472;
	Thu, 25 May 2023 17:04:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D4910E472
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 17:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685034275; x=1716570275;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W8KRpbaZx6CbbNsCHeg6jSOO17AG59MMsMzfq3HYolU=;
 b=EbvdQ5NVSB3yy3hCN7v3VUhgHwZJ26zblCxUjlxn4v2wB2faajKSFDU2
 vTDQYzFjqdP+o6LBd1xtEYNJo7ug/JzUrWdviZHFDGULSCGxLXw/7XRof
 u8f+XwkXZRP2y/sNF/60eUHFfAJSNZbSaWLipjMNhYMq64HMgTanhADEL
 QfQyrQ2xPppBJ1RRVE42tRDOJtziykI5+xGsR3yeI71Gj08bH4r8zMEXB
 4YDIRNEzoY46JizNHLHIhetlUlab3XsfIwCHjm6CHBigmNmL8/tn7dWkN
 /LaY3vK3MaTdVLWQ3RljZ61lhED0marhl5d7ZMM1Z+3Y8g55/fKXdsPXC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440311438"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="440311438"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 10:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="817181784"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="817181784"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 25 May 2023 10:04:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 10:04:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 10:04:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 10:04:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 10:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fY5VniuJtUymkzBN2B449UPeAH8+f+VCFTPozHPKggIjI0SJuBGUaWkEsYvPn8Wod2cANyT68FwY4yIo+jOYNwSVmVAt0LJpYi05LskOe1Qtff9+YO9NP5Is/RkjXXmYkMa5iH0AB+WL/nt/+6jL17anklJce191VcpAWNBbIvdemSO8M0xgzqv1s4Mvf/FR243gltlJAVRnhBEn6lohhXchXvBwargnp/kKFRELWGOAUEygZp9qhixHQ2CzLzk/cuqDHqwiz8YgrAdEAoFoOGrI4aE8l29EFKJEJLeHnIbOLbelpHdUt7w5JdP8gl2o6PUPQTvX2LDHTc2l6WaxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIx+aZW0jyk8xEXo+lX+cAolS98i76nXj4fJ7Oic/mI=;
 b=YJ+Mr9otTxa2JsU9unGc/3lkXGy7KgmRMJR80qHrKL06oM+QLs7eS9D5hYh1fDA7F1+nb2ygFaQ7yMRCREkRPIbgltZg39lh53U2xqyHqIiAGpF4qL5IZHsbkrS67Z6ubZx/yvVqVt70y0ez30IfebTBI0QRU2mPuvDe6u5Yay+5EdRtxEY14Rt8WcvW/5twWcQ8Tua62ooAV17hxeftRwIXD3fpjgWpVV0Xckw6I+TH4dXIOyEjsJOHAtpxzvtsVg0Qrot9LUOecG8DW1OvK17GanKiZvGjdwK6VdK2256DqsHAfcXICbDDMU9WxYNvUmz18Xausn0oRHucaG4Vrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Thu, 25 May
 2023 17:04:25 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::b4b1:f52b:901f:8c5d]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::b4b1:f52b:901f:8c5d%5]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 17:04:25 +0000
Date: Thu, 25 May 2023 22:34:15 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZG+VD4v33ojG26Dr@bvivekan-mobl>
References: <20230523135020.345596-1-michal@hardline.pl>
 <ZG3TL2NQko3finrY@bvivekan-mobl>
 <7i6r6ecvx5cl3d7dxjzgbmsfbnnhd5puvybhrqc5pwnyo422sw@adk7o36gppwt>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7i6r6ecvx5cl3d7dxjzgbmsfbnnhd5puvybhrqc5pwnyo422sw@adk7o36gppwt>
X-ClientProxiedBy: PN3PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::21) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4873b2-b19a-493e-cee0-08db5d421773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: najpF0mPsvkNe3oMhhkOOYmHGKqxhvju95xWSh3N9DMx5Dz2o8Hy3LARu+ErCJn8U5305TvDlVLhXCWmKuyLOR3tKlWUv7lzaCs1IS701E2Ko0EGtipN1jDgqlEEuJVu4rF9mtPyqTj4mVBwinEpuJT9CRf4lagzl9DjMSY0pTGdAhgazEPzEJTxbhCHwa6fJ7AQfdFY1dbZBsc1oGjr8SxOhChGHBjPkbCAZsP88pT960wKVWdF0I1Qx6Kp16qAex8D/kQCQQXDMgwP5nGYEK7jUjRIR0+KXPkTVa3RF1QbUYgQYgVmf8nXLtpzoygKix7MvgfI/9U5OGxqK0uXyU5Ti5gOtUeYsao6ii2LbppAWXnNINRQpkv+7we03j9j9NYaBdHoKEwSLA7ksb8Xb+HWLtCTsbS3lBgrT37tSra+UnC/OEt9nULVhyCyX0HdmKAQf5o0rX6Dqwh/hCh+yJaMo3UZqaizrC1E0J4KznhzicjkfYMNkYiYvkYl+hwATFS62L450MOcgS0rhKN2bJ7QeLUZfgLNpljUbc997HG54f0JPZDgsxx5KOEJQSr32tdQ+EY1VteCsuI6sNzYErzSYMS7llVVki7DHIuZM7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(6506007)(6512007)(82960400001)(53546011)(9686003)(26005)(38100700002)(2906002)(44832011)(186003)(83380400001)(316002)(4326008)(6666004)(66946007)(86362001)(66476007)(66556008)(6636002)(6486002)(41300700001)(478600001)(8676002)(6862004)(33716001)(8936002)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y09Pamd1SEF3aTBydUNycWxxRmpYa1lxKzNRZGp1SUdDYWFUa29XUnZ3OG83?=
 =?utf-8?B?elNmYk9lU1MwdDIvRFRBY2IyckF6b3dpTmdQMjlYZjlORFc1YXprMkZBNHdi?=
 =?utf-8?B?ZzBRK1g4VVZNczZUZ3BtUGMyS2xEMEhGcjZvTVN0Y0xtRHZvNlFudnNtK2F5?=
 =?utf-8?B?SFcrcmUxOWtDRmdjaXZyVisvaWQ3eFM4OEhBTStXK1VWbVl2RFpWYk1PbE9R?=
 =?utf-8?B?M2NaMTdnWFpBcHI3QjVEK2NQYXlNZ1RRb1F6TWI4UEFKMkdPZjlibWJ5MG1Z?=
 =?utf-8?B?VGdaUW40aW9BL3hGdk1RM3YzSW9DUmNOanJTb2JKMWxRVGtNRUdmRS8xSWpV?=
 =?utf-8?B?Q3JncU1LZVFLQkxSTGNpemFDYUVxbGJDdmFCVE9ZUTlKY1NDQ08wWXdqS3RF?=
 =?utf-8?B?T0FXRlFWQzlHb3VZY1ZzZHZhZ1NEOXFaaHorV0dTdXFvTlB5c3hDdG9HZ0ts?=
 =?utf-8?B?RDB6L3JBb3FtSkZ0SVUyaW1NL1lOOHNENTZ0S1J4WHdYRnQvT3dxbUNQRXZT?=
 =?utf-8?B?STdDSlYwSjV4UFhsTGgzcytqaXkrQU11NTN2eUZDWUpsV3ZMdVJKZ1A3SGVO?=
 =?utf-8?B?dWRSZGJycUJmODE4K2NhVTViWC81d2FMb0NuQmsxWWE3cDlDWmlqMFhkOVBl?=
 =?utf-8?B?bmd3RVJUVXNTblVXMFF3bXFqSjU2aU9SRy9OdGUvc24xR2U3aVA3Nm1RbElE?=
 =?utf-8?B?V0h2ZlhNZFhYcC95RVlraHYxT2NsQXdGOGlYb1E2alF4SFE1bkFxc2JPWHht?=
 =?utf-8?B?QlprY2h3bE5QT3h4MWMwK1NRWWw5RTZOSDI1em9TZXlITVVQT2FNQ0h1aDNE?=
 =?utf-8?B?STJvZ1lIQk5EaG1RQXdhMFMvODJkQjhBQVpaaGorUEZrK24xdmE1VWVIb3hR?=
 =?utf-8?B?dUZLcHVSNnlDa1d2bUZjSWxnbGlNdDNVclh1U2hrSDBxVUlvVGlTOTkrV0h5?=
 =?utf-8?B?MS96NDJzSXFjQU0yQ09BdkRJVFVBcDhrekJYMzhCU2tBY3ArUmNuOG92Y1pZ?=
 =?utf-8?B?NzVlTDVOc1ZNS1ZVR2hQZmRhUGJDTGl4QnpHWVNGRENRa3RjRER2TllxZGli?=
 =?utf-8?B?WUViRVhoMng4T3RMQlMxUXp4UWs5WGUyaS9IT2xWbHJ2eFJVb1kzQ2NnWmhy?=
 =?utf-8?B?YlNiOTJnck1ObFNLZmFRYVBJQ0lIVExQcG5mM0tiQStDYmVRa0VkNms4ZVZn?=
 =?utf-8?B?MGF2TkhPMXozeVdVczJwdGpmd2RJY3RubUl6elVVbkhKekJBSWFlbWRkYlZD?=
 =?utf-8?B?cVI1eVZyUmlWdFlwNTN2RloxTXoweU1HR3BRdjVHaVRFL1RjTjlzWGM3K2FU?=
 =?utf-8?B?WVdqNXFiV2JIWm9KRWgyVlZEWGRhcURkYmd0ODhJU3RoT1JWSFUwZmdTZFI1?=
 =?utf-8?B?aDFJaDU4S2g5b01rSHVCVXpKN0xJWjlPbGx3cEVGeDNlMzR6RHdRWUc5MG5v?=
 =?utf-8?B?dk5NK1JHbWcvdTh4TTkvUTdTekNRUDdBZ25NOFhOOVZlNzBpWCt0SjV2eVll?=
 =?utf-8?B?SW02QmFjeTk1QUVQUzVLSVpNdVZxK1JxRHdPNDcvTW9USWIrUzVYbHNCbm8r?=
 =?utf-8?B?S1IrQ3lOWjFYYWtCNk80Q3diUWlMRWUyaGRVS0FkR1FLRHY3MGUyZG5XRzIx?=
 =?utf-8?B?d1Yyd2NWTi9IYisxell1QldhYmhTaW80VEFPaE44YmxZRitJN3dVRHhvaG5q?=
 =?utf-8?B?NFMxcjJ6cHE5OXZWcmZISUswVUhXNmQ0NmFEMkRNUVFITGh2NjZ4SHlPUEZN?=
 =?utf-8?B?Zjk2bTcxZGlPcHZLMk5LNVVRZU5ZTEFUczA0aVNhZEI2QTlkeVRVZlJlVUNH?=
 =?utf-8?B?QzF5cFU5NzY2R29IQTFINXIzMldmcjhYS25MaDJmWnBxTUV0WmxWa0xodFRj?=
 =?utf-8?B?RndWK0s1WjhvNnpIckY3Ynp4TTNsNjFpVDhQZ1ZxbkM0eXZrUGpCNzgxNmNN?=
 =?utf-8?B?RllueW9qYUFBc0p3anUxM1J0SkhLSXVyZG9CMEpYQWRwb2lUQTh5L2pxUHVO?=
 =?utf-8?B?MHB3SElGNkVSenNaRjQ4M1dXNnZtNnl1bkF3Zy91YkhmS0RSN0JCQmZQWmJP?=
 =?utf-8?B?aXlkcVhCeUVIYXZqUlBiUFdFYzBXcUJOOUVBb2tkUGdtQkNMRVArL3Q5Nk4z?=
 =?utf-8?B?ZWpza29WK2ZlOE9RSnc5YmhWYjVyNlVGb1Q3SFNHRmY5ZEVYVXFMc3hxdWlv?=
 =?utf-8?Q?iV1p64o4DPoDROqEGyZdcNY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4873b2-b19a-493e-cee0-08db5d421773
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:04:25.0733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vAgFYMU7yOdJ3poMam2gTOs+RcppbT9EQrxK5Ta/c3SwknJAkcOhN4sTc4L5kcEwEQTZOpA4jj2X27IkluliqBBDZp1jJyTzCjA3UsnzBO4YMLjHL+uT+Z3w/4jv/Ls
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Fix uninitialized variables
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

On 25.05.2023 00:04, Michał Winiarski wrote:
> On Wed, May 24, 2023 at 02:34:47PM +0530, Balasubramani Vivekanandan wrote:
> > On 23.05.2023 15:50, Michał Winiarski wrote:
> > > From: Michał Winiarski <michal.winiarski@intel.com>
> > > 
> > > Using uninitialized variables leads to undefined behavior.
> > > 
> > > Moreover, it causes the compiler to complain with:
> > > ../drivers/gpu/drm/xe/xe_vm.c:3265:40: error: variable 'vma' is uninitialized when used here [-Werror,-Wuninitialized]
> > > ../drivers/gpu/drm/xe/xe_rtp.c:118:36: error: variable 'i' is uninitialized when used here [-Werror,-Wuninitialized]
> > > ../drivers/gpu/drm/xe/xe_mocs.c:449:3: error: variable 'flags' is uninitialized when used here [-Werror,-Wuninitialized]
> > > 
> > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_mocs.c | 2 +-
> > >  drivers/gpu/drm/xe/xe_rtp.c  | 2 +-
> > >  drivers/gpu/drm/xe/xe_vm.c   | 2 +-
> > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> > > index c7a9e733ef3b..ec82088b73f0 100644
> > > --- a/drivers/gpu/drm/xe/xe_mocs.c
> > > +++ b/drivers/gpu/drm/xe/xe_mocs.c
> > > @@ -373,7 +373,7 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
> > >  static unsigned int get_mocs_settings(struct xe_device *xe,
> > >  				      struct xe_mocs_info *info)
> > >  {
> > > -	unsigned int flags;
> > > +	unsigned int flags = 0;
> > >  
> > >  	memset(info, 0, sizeof(struct xe_mocs_info));
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> > > index 0c6a23e14a71..86fd1025b931 100644
> > > --- a/drivers/gpu/drm/xe/xe_rtp.c
> > > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> > > @@ -115,7 +115,7 @@ static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
> > >  	if (!rule_matches(gt, hwe, entry))
> > >  		return;
> > >  
> > > -	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
> > > +	for (i = 0, action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
> > >  		if ((entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) ||
> > >  		    (action->flags & XE_RTP_ACTION_FLAG_ENGINE_BASE))
> > >  			mmio_base = hwe->mmio_base;
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index a0306526b269..109a5d93be89 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -3262,7 +3262,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >  		if (!vmas[i])
> > >  			break;
> > >  
> > > -		list_for_each_entry_safe(vma, next, &vma->unbind_link,
> > > +		list_for_each_entry_safe(vma, next, &vmas[i]->unbind_link,
> > 
> > This seems to be an unrelated fix. Can this be separted into a different
> > commit if not already merged?

At first sight, change looked like fixing a bug which used variable vma
instead of vmas. So I thought this bugfix sneaked in by mistake.

I realize now it was also reported by the check for uninitialized
variable.

Regards,
Bala

> 
> Unrelated to what?
> All changes present in this commit fix the same "category" of a problem. 
> 
> The commit fixes all 3 occurences of using uninitialized variables.
> In this case, vma is used both as an iterator (which is fine) and
> container (vma->unbind_link - which is not fine, as vma is
> not initialized).
> 
> Are you asking to split it into 3 separate commits?
> Or are you saying that there's something special about vma in this
> particular case?
> 
> -Michał
> 
> > 
> > Regards,
> > Bala
> > 
> > >  					 unbind_link) {
> > >  			list_del_init(&vma->unbind_link);
> > >  			if (!vma->destroyed) {
> > > -- 
> > > 2.40.1
> > > 
