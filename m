Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE6DFC72AA
	for <intel-xe@archiver.kernel.org>; Sun, 22 Mar 2026 05:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B9510E012;
	Sun, 22 Mar 2026 05:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Je8mhYAJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AFA10E012
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Mar 2026 05:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774159024; x=1805695024;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4hKmY4x8rk9yBaVaWfMUWJwYphe4R65JkrvECSXV5YQ=;
 b=Je8mhYAJ+R1se0IUDR9+qdAP/jJB9/pBQvpxvCRZSrsEVTpigH4SLJQ+
 HksnjiI75TCJRBLKQi+pMWl3kS2QhSF9Sn2kgvx7P+OaoRq/TYLtIzZK4
 /KewT802O7S95MVr8T+akupHup8cZ9aIbv7ltMJOgR4cH09q95rhSgG68
 94Z8rJg5q5QSaaRoQfRotygo7ZcuHIqtCfjyejqIikH/esluoyYkZankB
 a6jOtsuBYxJtTiNom+AXkLirgWOEyrAm2HX8LvRLAzu0OqWmk4m8KME4r
 eSx5vTtbE1xezjACqoaAfBP0Xj8tXGBjrtH2kQLWNAgLh2JMc0hrE4o6m w==;
X-CSE-ConnectionGUID: ib/bCoG3TcWhoFGUiGWWlw==
X-CSE-MsgGUID: AS/I2rc3Q0SEkV3Nzz4M/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="85891763"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; d="scan'208";a="85891763"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2026 22:57:03 -0700
X-CSE-ConnectionGUID: 6/i9L+3ASPuHDFILw5WGFg==
X-CSE-MsgGUID: dpqE3AeTTgmYWc48lq4ZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; d="scan'208";a="228417452"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2026 22:57:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 21 Mar 2026 22:57:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 21 Mar 2026 22:57:02 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 21 Mar 2026 22:57:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6boVFjmtEQMSeuzpD6jwPs4awQHT8NKqNL6MB8HPW5wKsGFYdQTdPAk7FjOGBR3i6Kk6uPAKzvIMCAQQzfsiyNMWV6RaN/DvfPKvEIqcvRIb9VOKeEbmr9q2nrHDOZbA1Vi9b912rBCmfQ1IcRYOeIP2ry/gElev0bjFW5oE/9CYcO1GYIUAJyaLgkNSHYIh15EvtaAAFDYCmLMrtny0Mk60h5oHdiE/A7QH4jwRuAtaNFladm9q/ijbnrRPeS68KUBl2oal5vZN7Wl2X4ICTQqoFOzoSCxGBeQestx2wwD2B8rP4oevBJEeFi04AC72qFpSO1/VPTzpl/jNjFKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2jsHQAqf9lXbO7cl+1DUACvGbpiE4+aG3qx2oFHZH8=;
 b=jSQ6xgt32+Q+DU3c2WegTQr4MPC5Fuk4mUoT2Na33HcuvkZf4JdjwxMdngYXmVqlAqIusRiAcI2o7FlBYwV/+hbmTJp/2xcG4xQVcrbQFuZCNXKmUSdCqkx1EMWPa7kXh3nj150ESUhEqTajEfAyPSdC0QjHKjY0o1l1Q0mTNilbntUDzf2CKyWHoaDq/a/4tU9KokMkCXru0WLzT5GAVRRHaUOvc7BRD2BHIDfLLWEMQuiSld0hG01av3NWLabzXsAPGFMNRpv9ZbaFonzDpEenf/yVbJ3ocmYEdrmk/G5mZb0zG2bJrEWOVr+MOLmkdaxHtqWBHM6V9EX+5c7HMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 SN7PR11MB6751.namprd11.prod.outlook.com (2603:10b6:806:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sun, 22 Mar
 2026 05:57:00 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::b36e:ab4:9ded:1305]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::b36e:ab4:9ded:1305%5]) with mapi id 15.20.9745.007; Sun, 22 Mar 2026
 05:57:00 +0000
Date: Sat, 21 Mar 2026 22:56:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <niranjana.vishwanathapura@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add min and max context TLB invalidation sizes
Message-ID: <ab+EqQFFVnf0MeJJ@lstrano-desk.jf.intel.com>
References: <20260319210534.218992-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319210534.218992-1-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:303:b9::22) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|SN7PR11MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f606dc-e1f1-4f5e-28fb-08de87d7d575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: I/rLSZhdcBCARrQGbOmyprwr6ExvxNv5pnJnxvakmMtoU22brYUuCLbx5wsE2imzdkyqC6gngDyg3drLXQx+NemF3/MT6vmKCIn058PpMAnKBjgph5KkNwxc5JIcEDQgYv83050J/xeTgNsReNgs0/UI1b+D//d7ZHCpiwBfyIKyAustGXBK0WTaJU9c1+JMYaQiq4oaVzKRmAhxo+Vzn0hEswyL/Y8GQVi1PffE7xTTw7ZJ1S4mDcHNOcQYcjNcH3kmW58ed5doUwocpIfpU21BpA7tE/wnTDoLNTDqI+oNxatorb9wt0DWN/XjyiySi3WRzKGduYrnUy6woOBlppszkKTgspwAEaGHtpDZo+XmSSyvyyguXazKicBaiKCngPDdcSKBrf9TP4NqiBo5deQ0rbfF0K3mDtqliw0V5axtU9ZwtLX5uCytX6b1xIbICgYdvtH7HIJ+6wpZTtqrvS2x1Rsy+U0PXnYV2VX8pkuW5coUV0V48eFpjHh8k7vsGfTf6kRIsd7hw6JuWhJwtC5Pbz4SljihMvMl3IrZuo0+udE2mfmgd4CXN+yeDQDyG7JIMeY4d73gz3BTkgKWo1b2fbFKiClMZPTOOYMi/FTLBmNRD5Pv1yxkVQJ04nt2KYznAr8Hf+nzc+Y1XcsFS22y1B9Au2yYxIyYwQV4tE0GNz55lUlts7SANKj0Jko7c9i8J+PhHZHw6h/smwZSHXbejPTbPQmcK4YN/3TZ6FY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1ZCVGdILzFjdWpVUng4L2FkTzBuZVJYQ1lRVXdlRUswOEpnVjFQcUpUek0z?=
 =?utf-8?B?dndSL3Z0VmJUNnFyeHZ4TDFnaW4wV25FWEJVMFFycHZ2VnI2OWh5TUtDS3Uw?=
 =?utf-8?B?Uk1QRjF3aEtxNWVEUE9lczNrTlVVY0wwYmRhRkpVa3RxTmZxOEs1UXIvS1Fa?=
 =?utf-8?B?a1RMT014TTJ4d0FWSld1ZUVqL1FXWmhLZHNzNkxzYTR0dnVHdEQrZVBHWFZF?=
 =?utf-8?B?Q0RhUk1LRzhiaUFKZ01Xb1VNcDJHNGVHQ2dlZGE4bkxkWk83eUNVWWJ4Rjla?=
 =?utf-8?B?cHh1N2VGKzh2UmtMdXRnRmN2c200U2srTExub2U0NkhMMEkwU1dTaGJTcG05?=
 =?utf-8?B?VkZRK3FCRXphdG00NWR4czNPc1hFdmF3SkFOOXBQSUJ2RC9qU2NoSENvVDJJ?=
 =?utf-8?B?S3VVQktKTW0vYU9IQnd5SmsyNWNJc1NoL3pyVHJuNkgxeWVlampRTjhId1lR?=
 =?utf-8?B?WHd4OHZMTGV1Zkh3eUNGZUwvaHFYbGhOamgvV3MxOHRrZGcranAxSzlZTndG?=
 =?utf-8?B?NFBYYXYwRTNqZ29EbU9GYk1ONGtaSk80UHh0UHNIcy9JckYzMnVKOTZXY0Vq?=
 =?utf-8?B?T3B0RHBJYjdaZXViOWlIWmFuOGVEM21kNXlQVkRpQjVXVS8zdGV1Y1pZVFB1?=
 =?utf-8?B?UGhSZE1QVW5YaXR6ZHMrMlVud1JvM0VvKzVZTStOL3Y2Z0xrelJneDJaQkhx?=
 =?utf-8?B?N3ZjaTJuZDdrNnd2OGN0VkRCRk9TcFdmSXMwQ05NZzI4cHVXUllza0VKcGZq?=
 =?utf-8?B?L3ZQa1VoOFRWcFpGMUtOTitMbWRJWloybFdSU3NESUdEZFlod2hNSjhpUUxG?=
 =?utf-8?B?RWw3MlM4bUdQZlJKaS85UnJYRVFFQXZXRzZQL1lyTHZZeUNyS3pSNnBTQTI5?=
 =?utf-8?B?dnNxam9jRUJuVXFnc01uV1V6RkgxOTRYeUxhd0pVNUNtaVRIZFNVNUlQYVNz?=
 =?utf-8?B?L0o5eFgyZnpKNEx0QUlHMlRRb0x0VlJscGVsMXdIdmdIMWtZbGUzWWZ0Yjhl?=
 =?utf-8?B?ejc4TXhrbmcxaGhJc0lxRUFpTk9XbXZUc0Z5eUhDYk5qU2tBMnZtakg0NHlY?=
 =?utf-8?B?Ri9XNWtJSVloZTBPdEkvV2wxZ0ttdnlhbCs3YUhyempzZ2VDZlF4RzZNMW9v?=
 =?utf-8?B?RExlWU9LUloxT0NyUmRCNlFEcmFTSnMzQkJPSFhQQUYvRXlLeDVCbWxNWEd3?=
 =?utf-8?B?eUl0VHpxNUpDNnlSQXRQaU8xTUJLVm1hbTBweG9aMTkzQ1YxUVhFNGdtblVr?=
 =?utf-8?B?a3k5dm1nUWFVTUdUWVk0cEJRRnJXNWFFbGlNREVQeHppbmFlTXFoTDZGWUZO?=
 =?utf-8?B?RTdZejBmUGlhVC80MERGSndyNmR3bDJxZldPVVhKcXpPbGxGZHhGbVBhT1NL?=
 =?utf-8?B?d09xV2JRMUVrdXRELy9GdWptRmZ4K1gvRG1peUpCK1VzVG9rOTZJc0tTUE9D?=
 =?utf-8?B?anJGd1pJY0M1bDNDSk11eXlyZEczNmpLbGR0blNFeFhZa01mODdndmp2RWJk?=
 =?utf-8?B?MUxNQldpeGVIR1BQVmVjSkJkamxud29SOVUzZkpuMDFYV0FMeHNRRlk2aEtO?=
 =?utf-8?B?UGNNd1FSUUkwWUF6c3FkckVST0RhZ2piQ0dNMDgyTmNWeEg4U2J1OXYrTGhn?=
 =?utf-8?B?aGNFS2FXc28wdzBVWk8zak1YZ2UyaU10OW5pZHY3S2t0ZCs3eExsRE03K05G?=
 =?utf-8?B?YkZxbjFtZjJMR1N0cW41NTBtQTBWRytqOWFoUVVteXJMeHNFMS8xUVpISDFa?=
 =?utf-8?B?MFhlMVRwdHpyd0ZGR3Yya2VvdWhPTm96Vm9zZDF4KzJoWHpTVm5LaG9lQ2xw?=
 =?utf-8?B?ZmhUNkxiL0MyWDhPTE9waGUxNEdDZGpEeGo1cFR6dGNkNHN0NEc3YWszaTBy?=
 =?utf-8?B?MFFqMFhSZ2NTa05Pa2hxSGd2NEg3ZTdNMno4b2NML204T3p2ODh6eHNZckFH?=
 =?utf-8?B?dmtmMWRVeUxhK3RpSkZuOTEyZE5lYWl4WFV3eWxtZWFpNGt0REx2QTUrQndD?=
 =?utf-8?B?UzlBVFRHamtRV1Z0RE5hU3JRdFF4bTZsczh6WnhSc3dlZWFUcStaRVdGUEVU?=
 =?utf-8?B?RzdybnRYZ2M0SElhbUlyeXpHQjFsZGJLdzhxWjhMT2hZWlZkdGRQVjZUQ3U2?=
 =?utf-8?B?eVNqVkhVV0h4TXdXQTJHMGRERkF4aVRHdC8zTGFNelpDbDNZYjY0eFkyZkpV?=
 =?utf-8?B?S3cxbGhENjJFQURKUkVzVnhYRkRKdllRWGNDUVB3OWVzRjJqTW9CV2FBVndG?=
 =?utf-8?B?MSt1cVI4eXRkekMyUCtWMGdka0lOZmduMk5HUUV6eU9HeHF5WUpHeGYyLzJu?=
 =?utf-8?B?cEtPdjFiSHYxTGtGcS9mNlRFVldnUG9Fald3L1JEU1ZwR3hGdUdrcjRITkdw?=
 =?utf-8?Q?0qc9RhQgtN+f2yjg=3D?=
X-Exchange-RoutingPolicyChecked: S3HWbphQIpvS4QiPX7DrUXtfcP9zZYVstHd7uwt3Gtq1SPFYsTMg0BdDSioIk6Ooz4fhzBOzLrtNESGU9fwR1reOVP8TsWM2+zH7yuuNuJDFPzQNicZ0raOV3RDHgW2aMz6wK3VYk5bFtVYMjL3+kQr2YyLtisfErNLOeGxjKxiBLM04fqv2EJY4wySx7u8DyxGjKuwgNIEQUcMGE4/DqjI7CsAyNFD9QSsbltkE8FPdO08/1u6NIqf+mAZqVzSud6aSLmK80lde13R+E1//5VIVH3N9bJlGgrQYC69tMqUsb8cbUOaRS9Mq4GNP7bTpmWuzttiZFKKggDc0s1DM2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f606dc-e1f1-4f5e-28fb-08de87d7d575
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 05:57:00.4428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Fcq+P9sV+bmY6jFML3UvOQcPwYqWt2DiMLFKwOZziv/oaCicanTDlDAqp/fOGjfhdfg3vJK7XBCexXHRm92jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6751
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

On Thu, Mar 19, 2026 at 09:05:32PM +0000, Stuart Summers wrote:
> Allow platform-defined TLB invalidation min and max lengths.
> 
> This gives finer granular control to which invalidations we
> decide to send to GuC. The min size is essentially a round
> up. The max allows us to switch to a full invalidation.
> 
> The expectation here is that GuC will translate the full
> invalidation in this instance into a series of per context
> invalidaitons. These are then issued with no H2G or G2H
> messages and therefore should be quicker than splitting
> the invalidations from the KMD in max size chunks and sending
> separately.
> 
> v2: Add proper defaults for min/max if not set in the device
>     structures
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h  |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 20 +++++++-------------
>  drivers/gpu/drm/xe/xe_pci.c           |  3 +++
>  drivers/gpu/drm/xe/xe_pci_types.h     |  2 ++
>  4 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 615218d775b1..0c4168fe2ffb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -137,6 +137,10 @@ struct xe_device {
>  		u8 vm_max_level;
>  		/** @info.va_bits: Maximum bits of a virtual address */
>  		u8 va_bits;
> +		/** @info.min_tlb_inval_size: Minimum size of context based TLB invalidations */
> +		u64 min_tlb_inval_size;
> +		/** @info.max_tlb_inval_size: Maximum size of context based TLB invalidations */
> +		u64 max_tlb_inval_size;
>  
>  		/*
>  		 * Keep all flags below alphabetically sorted
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index eb40528976ca..7512f889a97a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -133,12 +133,12 @@ static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
>  
>  static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u64 orig_start = *start;
>  	u64 length = *end - *start;
>  	u64 align;
>  
> -	if (length < SZ_4K)
> -		length = SZ_4K;
> +	length = max_t(u64, xe->info.min_tlb_inval_size, length);
>  
>  	align = roundup_pow_of_two(length);
>  	*start = ALIGN_DOWN(*start, align);
> @@ -163,13 +163,6 @@ static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
>  	return length;
>  }
>  
> -/*
> - * Ensure that roundup_pow_of_two(length) doesn't overflow.
> - * Note that roundup_pow_of_two() operates on unsigned long,
> - * not on u64.
> - */
> -#define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
> -
>  static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
>  				u64 end, u32 id, u32 type,
>  				struct drm_suballoc *prl_sa)
> @@ -178,9 +171,12 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	u32 action[MAX_TLB_INVALIDATION_LEN];
> -	u64 length = end - start;
> +	u64 normalize_len;
>  	int len = 0, err;
>  
> +	normalize_len = normalize_invalidation_range(gt, &start,
> +						     &end);
> +

Maybe not related, but is there any way we can pull
normalize_invalidation_range() out of send_tlb_inval_ppgtt()?
Context-based TLB invalidations call send_tlb_inval_ppgtt() multiple
times, but the normalization step only needs to happen once. I’d include
this as a “since we’re here” request.

>  	xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
>  			  !xe->info.has_ctx_tlb_inval) ||
>  		     (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX &&
> @@ -189,11 +185,9 @@ static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
>  	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
>  	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
>  	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> -	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
> +	    normalize_len > xe->info.max_tlb_inval_size) {
>  		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
>  	} else {
> -		u64 normalize_len = normalize_invalidation_range(gt, &start,
> -								 &end);
>  		bool need_flush = !prl_sa &&
>  			seqno != TLB_INVALIDATION_SEQNO_INVALID;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 189e2a1c29f9..5e02f9ab625b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -743,6 +743,9 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.vm_max_level = desc->vm_max_level;
>  	xe->info.vram_flags = desc->vram_flags;
>  
> +	xe->info.min_tlb_inval_size = desc->min_tlb_inval_size ?: SZ_4K;
> +	xe->info.max_tlb_inval_size = desc->max_tlb_inval_size ?: SZ_1G;

How did you arrive at SZ_1G? Previously this was
rounddown_pow_of_two(ULONG_MAX), which was entirely meant to prevent a
software infinite loop, not because of a hardware restriction.

> +
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_cached_pt = desc->has_cached_pt;
>  	xe->info.has_fan_control = desc->has_fan_control;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 8eee4fb1c57c..cd9d3ad96fe0 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -34,6 +34,8 @@ struct xe_device_desc {
>  	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
> +	u64 min_tlb_inval_size;
> +	u64 max_tlb_inval_size;

+1 on these bounds - this looks right and needed.

Mztt

>  
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
> -- 
> 2.43.0
> 
