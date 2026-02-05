Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4C4ECD983
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 16:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E2B10E0E9;
	Thu,  5 Feb 2026 16:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbjIngmR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B32710E0E9
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 16:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770307288; x=1801843288;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UM4VfJeoUPP46DZETc+WK4YBv6A1g5HapSYsYddHpVk=;
 b=cbjIngmRf2DbDx6hTQUAK8v5H2AJZscm12aFdND36TiVe1ql5CoOMAHe
 l2ktAREr8ytMXSUStwmlfp+nATYTNC5QnexlCLwjfE+8JtytjZ2zaCaq9
 rmVIkSlEbS1a8yg0nCg8IVkqqHzwMmQIq/0MlUKBJUWBYermCRzWVo7q3
 KhcGGKkWpSExA0r2nY2Ael4qsJC/ksIbqF6IF8vROGFs22TJIfsfcMkHq
 wioBjw/WPQ3VGgZLtNOUy5ohDiFNWm63GsGUn1RoYKCuq76ZdsOx75lHX
 nYeGsMKkJjKjFeZTNZghXi0ESOq+rJwFixZI8kGZPwJAkuaF06cY9AJCn g==;
X-CSE-ConnectionGUID: gJ8Dmt93QPe1rS2B6e7oSQ==
X-CSE-MsgGUID: 7xbWqpblRrOrmUk6mbdADg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82246399"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="82246399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:01:23 -0800
X-CSE-ConnectionGUID: nLiBov7fSo6BCog5eD9F0Q==
X-CSE-MsgGUID: cklFJq9IRfSZCIvCW/aCUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210620652"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:01:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:01:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 08:01:22 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:00:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abJmlHs4LqEpsiGAN7CRXTNBZpJBjD3mNB1nKJn7VNjUOvbz7BwHjbl1XnX2PAaY8RDkb2cjqhZthxb/owS366YuYOkCW/A7nnNSrysB0SvXzmmPQsjVq5BMAhndBV8cq/Le/rS525ShcAtSImEV7srQXUC6foGD76SoL7pyifjHfbBzx38fSAP39+PA2W3vBjxD3ii8ekoHdfYUZfPQMy3rpGKwW+PuTdselN18eoT7EyULKa8MTzLtX6KmjKcM/4bj+UpZQV9/AZ/+/9F/lZFzmyOPOjEJSecuoJxpkZA1vJOzg1z0XbQjk0MRgMEBDais3in/LFRIE+UzMOqoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnERdDhHOLX3QOngC5DqfoXu6HlmVHBdFCqU9beu0sE=;
 b=zIgAm32JsKoqXTB/QCo9aduAhwqRga0lfbDqrSWzToO8kW+3GAnbNNCHsrsOtkVQC4aIIMEpA8QSMu92QAal/Ds1g1kD605RDJtEC8qQ0YEL3g7F4sXIswWjjbabxYn8JN38WTgToKxSbkdAb8F+7UeMinzzkrpn0LANhpEjcatF/wY4t0bQM0eRie/iWvt1LVzDvWZ5ZgcobS61VkHi+BHuGMYSf/PcpOPRBE2joyW0XbLWCHdmuORKW+6ZellAi07in9Qz9m9EaAvRvsgBtzatRUdtwja7QR2q2iDjR92R4Odor/A8LmVirbN2akERpavPfLFsOVwtSRwkRqVyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6142.namprd11.prod.outlook.com (2603:10b6:8:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 16:00:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 16:00:42 +0000
Date: Thu, 5 Feb 2026 11:00:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <carlos.santa@intel.com>
Subject: Re: [PATCH v2 02/22] drm/xe: Add EXEC_QUEUE_FLAG_CAP_SYS_NICE
Message-ID: <aYS-p0gljFBw0W0O@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
 <20260105040237.1307873-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105040237.1307873-3-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: ae176c09-3e14-48a1-9d90-08de64cfb6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+sltY/ytnDJxTOp1lxypjAn+xOxdiygB8MQkXnGposAi3He8bpZ6KBFQHMHO?=
 =?us-ascii?Q?HLaHXWxCb+kM6m+fURUpAv1SPX3dVHhBWyRtnZA1A7RaKS7qw0Y319I1uREo?=
 =?us-ascii?Q?XtmYuN4rIxQ13vVqLBV79AdmOckWBj3P+9QYHKn8ZcqZjH7fIv72gu2wvHhf?=
 =?us-ascii?Q?x05/jSpjC05t2tN3E0Z1y9xYD6VUwYfRs0k23APe1YoXRTXHeelgKUDa3LCU?=
 =?us-ascii?Q?G7SYIOZZ30ELrsu38v/z5aCwjwCTRPDeTwtvMIRNZHwAD1tsLsaljH2fi9X4?=
 =?us-ascii?Q?N+DX/eKBkg+6Dnla7OKn0CRJoylNmePDmII6QUisiSjGQeIeNJr78Q7v/7Sj?=
 =?us-ascii?Q?l/OqScGylq0sX3NorLK3OYk9U4WQRWX1wYNW9+2JtzugmnBLrB2Q/II3fJrg?=
 =?us-ascii?Q?rRlr49poEN2gUntDTlvIZTBNWfS8OBxaw0a5HpXa8YvIRnvP0GwCkEEnizre?=
 =?us-ascii?Q?Fh0sY6ijGmElWRL25qWv+gCa+cCHkA+tpgb0IVP0XG8RM19m9+xkOjEKJ/bB?=
 =?us-ascii?Q?OJlbdDcL0AEZ6sYiRLZuSfysaDk4+PrQRSHl+KvXVvjCK8zC4lS6loygKooU?=
 =?us-ascii?Q?fva/8F855LMyPal6GZ253FKQeOYOiLCRbtyzSJ6zVnGGuEtrWcFtThu1Vgsl?=
 =?us-ascii?Q?gmhtHctFp2kD12HJcI/ey0TC7U8Jp/WPSMhhlMWceYq62eyvufOTSLDHMWVk?=
 =?us-ascii?Q?8HU3pTqumPjvE9x6DocnW3qjc2/obN1+OEtrPA6PBac24iiGlt1nMYGFxovS?=
 =?us-ascii?Q?Nvn2mTKMWvnqRGeX03oxoAGtFub7dW+oO895wd2nmSW8YyRGHo8O55sAgUU/?=
 =?us-ascii?Q?Al6C39wvIHVnHydsa0Of9sHMR/P3v16Rvn6S1QnnTJy49v9gxrI4aSFhbj3b?=
 =?us-ascii?Q?/WkyZXEHI44W6aRyHULi4w9F22TQk34LBmKrgU6w+c0fJUPQ4aNXwQMNv32r?=
 =?us-ascii?Q?kWNf2DFPzlLeUJR+/TdnLXavJuIyeNL7/LfpO2S9Dcx6FE+k+GN7OtN8Ab7y?=
 =?us-ascii?Q?MwamCMZUCcd9aUA+zwC/a1RN+SOG09pbmBFOZfFIxOsgUeDLlBu4ObI+IOt2?=
 =?us-ascii?Q?H0tDbfLsDVZFpVDyRUG9nUmjSn2c9g6jIg6nZbyoe4UNmr0YLkdihdzfHUJs?=
 =?us-ascii?Q?3a5pVB94b/4rWBjkMWJZsS9MhrB/S1fliuafCYFVR5SYMSaVMIPGBw8I8Gh6?=
 =?us-ascii?Q?n1c2nH4l1PnMmggpHE/YjpaQLvjApkZim4eWSsK/PGO4nA7LuP4k2qOlwkx1?=
 =?us-ascii?Q?vCSNadJ+woKtCIuZGcqdOvjGFipKmbT+iLWPLaNkJTyCesSg+EPCStjRo7QQ?=
 =?us-ascii?Q?N/ksaGu6EcyFd61ckYTlcBvMH+QykNy+8tNJKkOpnO08KXTLNx/JLwZa3nWY?=
 =?us-ascii?Q?CVpZyMmOmZisnqXM0bYINGmSLNgA2qGlFmckyXjO4uTv4nDh4Mdk6uAgrdws?=
 =?us-ascii?Q?agYoUrTDcrqUJFsv7OZmkhvxIY7yIR0AFgY8W6yzGDusvN+y3atMSJZ6c0k3?=
 =?us-ascii?Q?/jRYcfic/+uLvBTRj+Rcxtq3sVoH/VT6k5xtxDWnB3dVmjKIXcsvZKb/NQVf?=
 =?us-ascii?Q?L/GXNhgyNS84wv0sdJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ze1uhWfDITyDMrCJDSahYGPpCsKQeBqyA+wnhHEwnZMPDALXFlAQPHzd67Be?=
 =?us-ascii?Q?90FKmwl7hckihfz1hOYoA5QCvgBs66vQhp/Eqg7qH/U5wSN31Tygpc0gdNBv?=
 =?us-ascii?Q?hA+C/sZbsGkODsQFWzHQrAkqcWgmLCnI9DYWSK1GqzYsjN95Ki7gP2h1T3sT?=
 =?us-ascii?Q?w76FvmnmWtcX8LdeTaaCKLLolua0y6ZwWdYfCMbg50IKeoKG4Z0eZ+JylAa/?=
 =?us-ascii?Q?iCEPpmYEtaS/P6+ybh0JNrisltBRK3BhbUsMvecMOErzQ+A7gP63yXbRGRA5?=
 =?us-ascii?Q?rFQi4QBgUagpu1aZn3Wb3h6KvfT1nC2fieCtSWdBdpJCBKP79w72+PFuFMa6?=
 =?us-ascii?Q?4DrlDuYh2EUxnbtMSYzNT58gH/G+Yt2uqlBH6mbFqKvzp97/3Uufk2kFK9Vo?=
 =?us-ascii?Q?Acz8ooA85dEZK40+xI2o8yPouv/k5AerARtR9e1UyoLVminRD2+ZfLya/OeK?=
 =?us-ascii?Q?qVyJhzNY/lMl56JsPeeKoCiXOxzULrb18hSm4/+XpIGpoAkodtuvgDqIaurN?=
 =?us-ascii?Q?S4BKnx7zuHYVk4AbfYhnhN3YE74uBPVxIQDmpLhfuusfI1FQDmroSu4ZxDEJ?=
 =?us-ascii?Q?ax87Sww8G0TJQXajtEeajjX204JzcXnJSkhDXgtp51w5A/IrVxIxwVQHZO1A?=
 =?us-ascii?Q?+vy8NfHPgEDdZlOvmoxcLYhayqH0T/9U4kJujpjr6q7vqAb6pBx5Ag/+wWlB?=
 =?us-ascii?Q?ObWnAHwtcw5fKcezL9s2gYTSoeyB0Pkt6aGLgLJXzfTINi4ztEAvJtOGwHDm?=
 =?us-ascii?Q?5o9OBrdnyKPGPmQzFlxIKXWERy853CmwDf4TQVh92lwEkvkGfHUCg88OgsED?=
 =?us-ascii?Q?z0hyd0bltmZ6jkH3+cLnWYyVqeJejI3hBS0B6enEfUSO4sF++ijP9NduZOi5?=
 =?us-ascii?Q?VaFrnG+GwFdc2RJnLF6bvYWq286QsBmcNw72SjXq/6qkmPqlxbjPyFE5W1zd?=
 =?us-ascii?Q?n43fUZegQIphXyJssAOVFEMnHTZPa6HA5OCAm620K20hrert1BOZfOt8DLZ/?=
 =?us-ascii?Q?z7+YHxuxlUsI0rqUz/QZN9HHtuHPs7DCMjXVeldQHVkU8T6fhSqrtt4Y5j5A?=
 =?us-ascii?Q?OV8AsJRlZW2nsxYRIRXe53gz8xNlpIw9b2jKqOisYSUv8GKJ53n+OYI/APoS?=
 =?us-ascii?Q?B0MZ80hsuRW1ioM5VXRy3ztIShf3/LYAUkmZ7VQGzBBqzgkoBCBll6ccfTYA?=
 =?us-ascii?Q?Vd2bOGM8oGlqIfCh0lXG62bbfARMUAX1EcTnA995Zhz6XfWqJy9DK4w8LFSZ?=
 =?us-ascii?Q?aOruxNc7QzwYGw/KhYezkOxI8e1qIxuLZxxi8TfDy29uM7A3RmPt34FqDxUB?=
 =?us-ascii?Q?rZqnI2OPP95WQVdYJb0mc2kInAYGMXfktNI7ENEoC438ZXxH9oOPc8AwD6Cl?=
 =?us-ascii?Q?RhcHEfFTb1dRSq2Dvvv+E0RYDFoS/PxWobyJiYtb//9/gdI3DdIw4znKzrSh?=
 =?us-ascii?Q?vq7fd9B+ATKnlD0/IGyMzPz5fAwG2ZghwRSDrweObQEHcBR9RAW2DJaGlG8A?=
 =?us-ascii?Q?0l4Rf/YBK9gcwG1CucmhDd5b6kWBul2P77RsQlixk60lXKGI3NlaoFYY46Oc?=
 =?us-ascii?Q?DMD5JWDzds0NsMVRnL2ss1ReP9KKMByPMSMskZvZi1L0ao+gZTz3MO8fLX3y?=
 =?us-ascii?Q?z8MsoOJRzfDCPQ7NSV3YCQk2ljSWjiocs4kwhT7g7DaBU33S4Tqu9ldAfjus?=
 =?us-ascii?Q?jnkMPVlCKr5J4BfK9GYtpxaYK5JaX+FxkuMMfJSoTYEnBX0R7bDYRu4X8tJu?=
 =?us-ascii?Q?IfFkIFYyuA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae176c09-3e14-48a1-9d90-08de64cfb6d5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:00:42.5054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JS9xHHirKiM2uY/Q7RrF8aZP9HbBQ1iQTsxN+5AoQxTTMNc5nD4a8+s7VkYKlKozIge3UgOWAAEZbXlYACcXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6142
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

On Sun, Jan 04, 2026 at 08:02:17PM -0800, Matthew Brost wrote:
> Store whether CAP_SYS_NICE is set on the user process that creates an
> exec queue. This will indicate if the exec queue is eligible for higher
> priority levels under deadline pressure.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 3 +++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0b9e074b022f..a9b981591773 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1158,6 +1158,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
>  		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
>  
> +	if (capable(CAP_SYS_NICE))
> +		flags |= EXEC_QUEUE_FLAG_CAP_SYS_NICE;
> +
>  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		if (XE_IOCTL_DBG(xe, args->width != 1) ||
>  		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 67ea5eebf70b..cd7a6571f5c6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -128,6 +128,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>  /* for migration (kernel copy, clear, bind) jobs */
>  #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> +/* for user queues, created in CAP_SYS_NICE context */
> +#define EXEC_QUEUE_FLAG_CAP_SYS_NICE		BIT(7)

So, Let's then already reconcile all the already existing CAP_SYS_NICE into this
new one?

>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> -- 
> 2.34.1
> 
