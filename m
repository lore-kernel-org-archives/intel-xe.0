Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E8DC282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 18:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF5910E03C;
	Mon,  3 Mar 2025 18:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehWR5nUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D3110E0D1
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 18:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741025415; x=1772561415;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cPN62LZaeoEZYfMfXNIgD2cIb205AfwXHolu6tqyZoA=;
 b=ehWR5nUoIQJeVLJn79Ps9QTCakGDdscdqP/bhoohNzj/xh4xJ/P2B/Lk
 zpcQe8zt64AtfqtMEkEvqZI7naxBxUuEJRO5/UI7y8y7IfeyvRimEU/4G
 zc/MBukwV2Ch5LJqNu2BkH1Kf8SL0Y5fjP2MD7D26D0r3zIGDoEaAVvOS
 KL9WLNPKoXuqqRsHEBSlqjIlslNfcze0EgQn5wmvl5/+qQ3MI7+t696Em
 aAAYXpkPk6YiCZ/opcAmT77mrGkL+CFv2OVGnf2GF4h5SSHhmeSeIeZ9g
 Mvo1q6iYOUhu5rBXMmeVFjyREFzqzkTU+xCBXroOw3AGe+1is9txixkRU g==;
X-CSE-ConnectionGUID: qPedli0iSa6POyYSbe7hLQ==
X-CSE-MsgGUID: oBhWbg8lQTCocMQgB1byzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="67286897"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="67286897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 10:10:12 -0800
X-CSE-ConnectionGUID: YlnqFbIOT2O8J1eAnjQG0A==
X-CSE-MsgGUID: 8PwVkWi5S7uXcZIzts62nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117971721"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 10:10:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 10:10:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 10:10:12 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 10:10:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YU9JJEMQYwjw/47HqlyWBXViMukNXJrUHYn99piTUxwi2x66U6T1/8/XDXQiK82xMiRh8xmSfGM95ZSGg27+FmtXMKT9CjDkHLIQlI9CNLQ+Mpgi/za0xkw+7Ph0cgF3sYhEZ4eAXfeYina5z4tJDKi153vQBINNsZKDp7pcWXcDgtK75DXxwM0/c1Dr6nLasMZzsbh85OKMkSzZ8rODR3xdc7steqWJZ2ySi9hLYrdJDrUoiziwCynholOgiQrrLuXFM0gnDagXF7GijDFvWZCYpdrz8zQktpx4KEWnkSN2TEXP556S1qAwWyOaB6hAk3FbWkR/EGrlAOV+iW7BhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPN62LZaeoEZYfMfXNIgD2cIb205AfwXHolu6tqyZoA=;
 b=KmBSacsD6OCQKbIw6uBYo7XXlVUEave1UOnRX6mJ916F9aVuc1TYVhEHidhITyP+wq4VJrWAvtYH553wzy/GcPtRZr5jk7c0Pyp/1Eqo1vyLhq3beG7+ZCIgCas2Kb4cEQAlx9uvFSMLhAexKEb7dHrL0DAxMXx3kyf7QodS2oU04ViG+0bipQfMjVUWc1LzVjA+4F/lXUN8xBf+/uZUxN2I39oLbMdFh3neNfuuaaXUfGAYHT94YqW9ohfH7au2ZxgAUNSlSzYB4wouZJ8CXSpIMEQjW/U2iW42Rzln4b3AcZfMS6u4mEyr+dm7JXCMNPg7UbfjLqbgHLu9Jn0SSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Mon, 3 Mar
 2025 18:09:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 18:09:52 +0000
Date: Mon, 3 Mar 2025 12:09:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/vf: Stop applying save-restore MMIOs if VF
Message-ID: <tmzge7vvpcxer337bmxkrzuo7rdlucextkqpbusai7fovo35e3@feqiccsayboz>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250303173522.1822-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0305.namprd04.prod.outlook.com
 (2603:10b6:303:82::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: e53a934f-2c25-44c5-d631-08dd5a7e9880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F2VbWO2vBeLMeew/k82rp+1uG1AmPygrzvDunVU5b54I+URq2uSFGs+8MYuZ?=
 =?us-ascii?Q?bW8uIe1ZRvovpR5up6q9fsuphX5a5feJK8y0Bgc4ldsjoYD6/KO2j5wpPUo3?=
 =?us-ascii?Q?kZtvgME6zl0X8cgE0I9LQj/HEaxQGG5Qw+qb7uLNIWV1+8yqY2mHn5Ibgspc?=
 =?us-ascii?Q?gxUSXPWagZfNrZfMjHwFuY2AQqoeusfSjfo7YLCYACJky1ieZ7TMy1meqsma?=
 =?us-ascii?Q?DYWItuqexw4kr24a2RGslVbXcD6Kr8FPxXtR3ALIlmYRDB3QU0gH666pHJ6H?=
 =?us-ascii?Q?1KVhyctrnIUNu6ixNdIfb3W2F/7aOeeinJHvJLdyuuwZLBel8Nek4qv7nVKJ?=
 =?us-ascii?Q?NU4vbbRSZlhicSvCT6d4jPgFS+RXvSnGTHxnjoZIar+XM0yhJhM0fI0IJ6QR?=
 =?us-ascii?Q?rg4bu0fLvAtTY9ck8KKxh9VLFmpHm251hgwgx5aN1y8wtsxeTrXYHyfwGT1D?=
 =?us-ascii?Q?wqsZg/jGXL4HwGuNc3o/7EEvmkHdvoij1K3Gfe5lEb49wDsTRW5UtkpX+25r?=
 =?us-ascii?Q?yMfzNCWWu3TK3fgjQb74I5qIF9y9duvsd4hq6L77s6BVNHFUvyxboMCG9qf1?=
 =?us-ascii?Q?8XXYEEbnY9T1vKgshRiC3ge7igvLlx0TMYTVoaaWtfUuVeVssvK0QsGUFnyh?=
 =?us-ascii?Q?ngZJ8/Iw048CiCqsJFxHGWW4j/8/4n9fkeO8zCR5UZsr3uUBdbZPQiiDSlKL?=
 =?us-ascii?Q?p87xaV5jC7ApQ/N+M1+qerY38Ux8JK+z9wjADju876mJHjPo997Pwhu0JUC7?=
 =?us-ascii?Q?JQ3kwIudltPIeRJJxYxRlqyoGEnXdsp/AkRWnG3feJRYCh5RtWp3VhDro/pj?=
 =?us-ascii?Q?sEy+jZMPggHeVgKHYmayPwMkrz71g0dG7sM0QxIVkVo+NgqOk0MPiN2IsrFI?=
 =?us-ascii?Q?6ezAIa8JLI2ClE4FxXAbwKJjY1fjlKw9Z5JVu0u/CdFZZkvE/o9LKFT7nKwM?=
 =?us-ascii?Q?r8Q8fN1SAL/JxmNojkjrzwOLfafifZ68oQqC4VSFLHhfUj4llKE5qJwLYIMB?=
 =?us-ascii?Q?3OfJ+42ujFQbgriDvelmNGH5mb5zM+Uip12PXiEh+ixIGoVKesi9eFGxPzft?=
 =?us-ascii?Q?7STMiRpgIlyy0YMFj50ulZI2WBxrtbpVzsEyuP5dMxZyQohOFFCAB/c2vlgC?=
 =?us-ascii?Q?3yErxQr4DPMgWQy044sCftOLqsQ24h/kuDiN0kAZLUKcqQqbytuJ5w2TA9dc?=
 =?us-ascii?Q?f7Oyj31icM6iKBpUFEdxyUNPo8XIY/1sqVq19scxZXY2rsLTQNc+vZZ185iH?=
 =?us-ascii?Q?7L09PCjZEtSrGZnT1U+Ivk7USMB32hm7nQ4Q9EmlCi+0Hni7kgHFRRRhUeFo?=
 =?us-ascii?Q?zV4k4tEHurNOm8rlbXC1XMNJw6Q8YgSOtZZ2VaELArv6IUapnfySwpV6NV9x?=
 =?us-ascii?Q?lm3J83yjDgGk8M6eqpO5krSv8qjcZ4yj4kA+Zk3rMfsY/kbhSBx9a8ef/HxV?=
 =?us-ascii?Q?gaLkOZnroIA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NeijdiaTDFKQ9tbctFhyWcZXxcpOQlfPuxofHCKGNp6BA5EE+L3eCsgT84w3?=
 =?us-ascii?Q?86/Yx1ZCU+vVj9FP66qiZ6XXoH9A62iN7GsJRQ2Ik/QF+yhfEYluLzaPmtVC?=
 =?us-ascii?Q?z2pSgAYC6uAAlXJrH/sBOaMz9vFcRbz95dBEBAZ0hp7fOYX9ybNDTIdgOS6J?=
 =?us-ascii?Q?EYyOiqYcCqi1Q28vFRuQ0Pm2+3iN3G33j6G+i9XW/xlJSSfK3NhYkoOUc8HA?=
 =?us-ascii?Q?Yhkh796FEmRFPIsVMzk/ThrvoYiyP1RiGvHoVTebNQ1vxdx/lPizgoDymb6C?=
 =?us-ascii?Q?660Kc31+KKMNGW+wN2oUXOo9LyXlipszz8eSWOtBIEKIfy6MShg4Q3nmiFYg?=
 =?us-ascii?Q?7ChGdLAMjycQUcOR+Yml/ZFQM4XVwQbv0x2gEA67jWLKwKV0PX8fCGhL0Hmp?=
 =?us-ascii?Q?Ymu4p+3Xw4S1Jf6U1+JvCG9jT9mDY5nhdJpxyMoDbVyHspIs8ykFXiDwRlC3?=
 =?us-ascii?Q?aKRC+B5iNcfqzL1lAz//cnWvukU9yjCZ1kybi1XItAFnYDBVyen3vHMs16gS?=
 =?us-ascii?Q?ROijFZnasM7f6Jib+4VeLNMJRw2ocv881/S6NmcIFYoONU9F/SOeO+lLCj4p?=
 =?us-ascii?Q?CtUjGXIKUGyUwJT4c7GXmrNst2wIanFkKp0rVtwdQgH2XC3A5SWcMvc0b5Ax?=
 =?us-ascii?Q?wjylP6DQGZjLRdEkb2gLuhFePrwNnXqu9uoA527UAZb40p40nUP7W6sb71Q4?=
 =?us-ascii?Q?ip7q1cI7DaZr9vhJ45Gqq8v+qnQFoC/4w7cEvPJ+wL//6jPftmJMjzQdajcS?=
 =?us-ascii?Q?JgCn/9KQd79vM+kqAMCqBoide2agWuSqL+ZzQ77I2M93BJXplu+G6XSjIrwy?=
 =?us-ascii?Q?r0wQoNSgJ0QflxiLvIzYaDk39UP7vdk3aZ16snGP04CDGQb+Edk8Yfb/FsrZ?=
 =?us-ascii?Q?EQ8xAOq3nig2Zu8l6KFUI20fkjMhFYUWPJkZpk5SkxxpOeZLukpmXC/qxgos?=
 =?us-ascii?Q?bwk71TNFwfHS/7+U0vFNMyT+MWZEWrD4nBViWpD93A5udUrbk7Pont700mek?=
 =?us-ascii?Q?NSAg3P8MUUmieqZmG9X0QLxd2z5U2RA9jV4WfbBMQD3sPZ4e9hlAAdfpw7B1?=
 =?us-ascii?Q?uAhuieue95EjAdL/ZziseC1p+zSpbVKFmQEybjHhpCNwo8LPLzLMP+If/UbR?=
 =?us-ascii?Q?vavoe+jzlUAxnWWga3atUikcD5zXXWOwJFd2Vilk98azziNO26vzViuVAz97?=
 =?us-ascii?Q?wvTfw+lFMQECh1A4vt42XHGRqAHqFuPwFbQjZ/IkAaQoiifliEfFAlqEHVtM?=
 =?us-ascii?Q?iqvcvCBZE8UwwgU+srYonB1KmXu6JLJgQ8pbffSPqUkgLKmjwUuTpcu3jJHd?=
 =?us-ascii?Q?bcOpknAMQLsDIJOCQJYFZYX4JcNxhTf1dtbMKd3hiPD+gcsDHWcjZt+gb1TE?=
 =?us-ascii?Q?1qu/BcBCebhd7hFHBsUhb/iWzmVDYMQ8WtnQVMn5kVb9AouVu8z/3E7rtjrs?=
 =?us-ascii?Q?u4F3N5pdv+FqrUqQKI3VZ5o4XdStl50hwj/eTixFiHOWRnGGOWQ01g64iBwy?=
 =?us-ascii?Q?ekoK5D+M7zD9DVsJ6q/6stwjk3LEbukvzdAbTEjVXMFpvwfjrOo04C8ZWOqe?=
 =?us-ascii?Q?dAKDdYdDGGW5kGstzpoQbETl5g/d2930EUglxMZeoVR8/SYW2YFvJYdJ0Gr7?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e53a934f-2c25-44c5-d631-08dd5a7e9880
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 18:09:52.8669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68E7n22kee+7WWq+XkvoqZvx3baGPRd6jRb8bt0pjtKILXFNSTh1zDV+iKMB6mUgKWLKvXG1BSgjMAPtTwA7qkXJCQ8nZa71DcoIgKZ/E5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
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

On Mon, Mar 03, 2025 at 06:35:21PM +0100, Michal Wajdeczko wrote:
>Currently we are blocking processing of all save-restore rules
>by the VFs inside the xe_rtp_process_to_sr() function, but we
>want to unblock that to allow processing of the LRC WA rules.
>
>To avoid hitting WARNs about reading an inaccessible registers by
>the VFs, stop applying save-restore MMIOs action if VF, without
>relying that SR list will be always empty for the VF.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_sr.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>index 9475e3f74958..fc8447a838c4 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -173,6 +173,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)

couldn't we simply have a a generic xe_reg_sr_apply_gpu_job()?

If we still need to filter registers, we could probably add tags to the
xa storage... ?

Lucas De Marchi
