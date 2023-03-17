Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4512C6FD1F
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 00:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F1810E012;
	Fri, 17 Mar 2023 00:25:58 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA37410E012
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 00:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679012755; x=1710548755;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8x5wROWc/osiQoKFnoQ/O8lSYs2STYhEV5GY5VEIdQA=;
 b=MxJPwiQvSk6ny+l90wnfiv98kytNeH/qT1H9u9PEN05XgPmGG9p+8q9D
 YL9ebqSbjSQv2x7yYKK6OpQqedhc5wVuXpWIx37LE5wAzwSOz0yEjhWQI
 ZUm6/a/co0uizMnKO88yfX7I1Zc+/Q92NNuUrSwOela6UWe8i6wnXdnbn
 49e7dpG/9Pfl4qpTIYbA7r5Fp4NLNMhfJDsIQYGCknu7v6C2V7jxQxsjR
 nKYhboKiZiSIUortip1jlZULuNXCsQbXkBYArOwpLZm8VFYJghwicZsJh
 d6IAi2/mlVgRDlDe1UPh3pUECfqTTkD6JRXOzNP/t6zhTPR6mI7zoN1F0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="340515663"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="340515663"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 17:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="803934202"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="803934202"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 16 Mar 2023 17:25:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 17:25:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 17:25:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 17:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ngj8SM8UoeId5TMkaxZFewkZTlw8zryLlECBDcJ+xy21Lx+49heqUfol6W0lUmtPQmdrYq6J58EStCoCG8LGydcQk5VMTpVPqGlrIuNWcjbF484DwD94n5gA3n33F3s4ScRnrdvH9d1wYAyzlg4Ib2+I0NBMB1fyY9Uwm726XPn7obsJx3QAB6leFobZT64CV1e6/ml/McHnQnKAwiE+kvRfiXDcXVAaFtn0qzUoUJxVPrU//f3QUdBcAH39vW7T3M9p0tTgoyEyMcpDG2p3+YgtBui06NmwufeRibHOtUX0IRpKfCeXSDP2zvcNvA/uVXMU607nNvQAvEU8uz6NkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWQ0WdTH/XS9l7Drj7QsotxYDfUtFQnjOsgIYRBl+i8=;
 b=O+leHifrBNs6M/7wiyY8WGzz3wAWjRPUdbMK1jubr7VxbImFnkZ5LDHkLKtydJGAUzmOwP5bRx4YWczQxvUBT3h732ztoDrAEuKkQ7se/tz6TPEEN57b7/WBnu7pWaF+MH2ocTo0NAzZKgmXhzeujPafW7z0IlSJocP4lx/tIRCDdis5hyK7uwCCH9MhCgzGL/85AMlNCtcvLlJkqduNue7PyO854vjPW51HKJQ6GTNA6fGM7Pd/coX9Litq4woEtNr/+wNCtZ7tlcYivACgJ4Ejeq4sOriB7dbWxgKyl8/Jw67/8u79hHqbWtFaVAuJwtignuMEeGgqA0p4xw7AZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Fri, 17 Mar
 2023 00:25:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Fri, 17 Mar 2023
 00:25:37 +0000
Date: Thu, 16 Mar 2023 17:25:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230317002532.6jo4eeyfmi6sqbz5@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230316040543.1616473-1-himal.prasad.ghimiray@intel.com>
 <167894023932.19097.16683198436365022489@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <167894023932.19097.16683198436365022489@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: ceca20d1-ad1d-43e6-065a-08db267e20d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mcNVfYl97osSEgFUrsjMki8op+h18YF5EpdfOVhfuWnkU4nKWqZDxu3MK3u6NTmJn8m6LpKFAZ9JJfTiAsFf6yXYq36IuoEr5fwDHouJCvrf1lrDTjo/u9S/SIPpLjL0BNjrjLbYYwMOcfTihlma/8F/lplVq5IWV0jnbc/RlnRZay/HUXmhM1YlDiOUHJ2NR4hTEpFIzUnrvStj8GWiCRxuaMGaRi5xY8HmgQt7oFIBjfnyXtT9SRyHPTT2hsUCjN3eqwQfz02WRXwwhEcZXh0bFizjvK/T6AunVu8XX8RpsDpo+wIJYDpqB/DlpV843cenju8ef1lzvwsj5pQbQ1wneqqQDw71WmiByr+GJU39K1ISFS1sg2gFeV3eddGMYoxf86l4Usya3bMFjohrMmHrb/YHKMFFd9DM+nC+Q70C1V0EgcJdMzvQRAuPnA5K0Iq4ojcRLZmxGHOTD/ZwhIf5yT2W+5YA2Qv8MCTgyTNyfGdup+dv27/1fEZJbDh8XzTqLSuFqiyvM8YKaewEpupxBTz5vwe/LcAaNB9frS2n3CLM/3Ovx3vi+sVnKoG1gK9xtf1rY1zWEmk4ni1l9sHnpxs4ZQA4Z5BwBkGqdyU5mI9+Du9DSryUQbo3X/Pi8zMRe9TnPx2gIcjDSqOLJYLUlB2dbeRFv+/APi6MV+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199018)(8936002)(4326008)(6916009)(5660300002)(26005)(186003)(86362001)(6506007)(6512007)(1076003)(41300700001)(316002)(66556008)(2906002)(107886003)(83380400001)(66476007)(66946007)(6486002)(38100700002)(966005)(478600001)(6666004)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OHPaKRomGAeFj5Sh8wn5zTA/bXJ8oxCZ4Dl3fRxcLhKnBZR/loavceS8h5MV?=
 =?us-ascii?Q?bFDiqP9i8AMeuEgZPXmFYTJfLK9FT5inX8lGTcgknnTzF8IYHpQ7Yu8cRtnS?=
 =?us-ascii?Q?EB7yLEakYYit8KZRXTzJ1mbCuAtKnhNdB4o83bZBfi7cWsR0PMu7cG8ZEPVR?=
 =?us-ascii?Q?G2Hm2mCY9fkQU8s+72grEDOwe2aCMILsnWOYO+iyzM6oC9oFAZ4qFdCTg87J?=
 =?us-ascii?Q?tu5scQDcb6B7ijKsI1K8Mz/zrBDlC9AleKsnjq0KPng88FHAVd1YKVULbVtS?=
 =?us-ascii?Q?68AYrNesTxJz9tVeCTBy8GpdbGB2sEgTbytCyoZrQ36SZMux04czMQNPMR5w?=
 =?us-ascii?Q?EuxnjBExnTY1yWxkU63ED4vm+KoIrr2/TrwKbzM407FDw1q4Plu7rQUejS1S?=
 =?us-ascii?Q?hFp1+mCTcD4lLIk3j7Sd7jfRZdPBXuGgLA1CLoK1Sxl5azY/KMd+KNttFTQn?=
 =?us-ascii?Q?AULS8T5u12GwaCsa43uvsKTgJD1zdNXXzZUFe9xY2uiMwvgz60ox+9jxQXn1?=
 =?us-ascii?Q?xvzmYuiGRUCOWMVQGCT0cD5CKDsKNICfa7YenvpS2NB9PWNx8uK22g1nlf1q?=
 =?us-ascii?Q?QVpMCso7Z8XcjLs2qzsHLmEKytNq/ldY5YUu8qqnX8eOaq66uVhHPapHrIPr?=
 =?us-ascii?Q?OJC8+fzKCs2JPvPQsGMCoaD/5uGdmUQ0aiBMpOou8nBaChK2KVpPaXJeceGX?=
 =?us-ascii?Q?Rr38mMY12QPVn0I5Q2MeNXeCKkt696dP/tYIT//S5XV+/UiqOPRrui4blMNX?=
 =?us-ascii?Q?mwgks/oc+pIrTkG06XUkb6vVthtTHVww9apHexk15/htPUPBhRZF8TNdUdTX?=
 =?us-ascii?Q?QR/JJ5JVpfK63icmsin92dX7B4c2+5hlGhDXsgvYNMbZpSk71VrYkdx3HbFZ?=
 =?us-ascii?Q?lCEGVAgMufakUECPQPysDssvpUNheGe6/Gb72tqMWEQtGbTZFM+QcEeFP3BS?=
 =?us-ascii?Q?IPpsclVqTM0Hr2KD4T1hW0gpbeZ2TFjs85dObrpyDYMcA5wfjno/vTaR/pDO?=
 =?us-ascii?Q?2WRP6jEMPbHK89ifqop0hPpxFv8Rw88skTQsZeRvAmroG943Qw3VxFFVREuJ?=
 =?us-ascii?Q?qZORwJ99KD8yvznWX9N+E83TKIW3TpH1mAMJS+dCO2jkmXFIqtsASCAJ8HxL?=
 =?us-ascii?Q?k9G3vnNt/ibTc/MuGF61t7I7TcqQ7wJ3f0qHegAl5bmlos8IrdMk4XjRF5gk?=
 =?us-ascii?Q?hocF8Sv2C3nYMiKZNBW6Pl/KTSN2uT3LI2egYT3hPlWFf8k+qK0Rf8Hvjwk3?=
 =?us-ascii?Q?GSM3e95LGOHO4uSh7OcCATO8xtiLAPOTuMVagzz40xXH6+OWxcxPgGRtt8r8?=
 =?us-ascii?Q?B5BTFnkPefKdkipj5Jb7O9+on8eqfjKOY+vxsRHrYskOOZKF/UotsCPXM1Oy?=
 =?us-ascii?Q?032sQg1/qSPP8cfcFPevwLDLdQ9/DyAsZQHoxcrpAH7ec8vf2AuAhMpOcDT6?=
 =?us-ascii?Q?yS9UxBhpFICxiNzmia7hB9f+mopLq+d9p5V5+juYhojW/ILyaGXeIp3S5ycm?=
 =?us-ascii?Q?9JCh/hiN6hOMTKzGAsHO0XENLYTCvWJcsP7nDtS1dkHxUppJnsihhOd07qfB?=
 =?us-ascii?Q?kuwFBsUuxz7etg3ju5RIFUGDYxgKf9mvXePGxmf4sOXl/2litzw5+Avwr9QT?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceca20d1-ad1d-43e6-065a-08db267e20d5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 00:25:36.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FS/DS0PAsWbYqv6fnVXXBDJepaHJ4eHXmURvNQ64cAZH/9GOnWrCEJZTo5Ewngy+LWTkBKpfZfP7MTJAMm/Dfbdzwtopc4oOhE5nhKwarf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe/RAS=3A_Count_SOC_and_SGUNIT_errors?=
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
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 04:17:19AM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe/RAS: Count SOC and SGUNIT errors
>URL   : https://patchwork.freedesktop.org/series/115233/
>State : failure
>
>== Summary ==
>
>=== Applying kernel patches on branch 'drm-xe-next' with base: ===
>commit 8f6c3eaf3f9daab25b31e80c8ba277877fd10547
>Author:     Mauro Carvalho Chehab <mchehab@kernel.org>
>AuthorDate: Fri Mar 10 09:13:39 2023 +0100
>Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
>CommitDate: Wed Mar 15 10:28:56 2023 -0700
>
>    drm/xe/xe_uc_fw: Use firmware files from standard locations
>
>    The GuC/HuC firmware files used by Xe drivers are the same as
>    used by i915. Use the already-known location to find those
>    firmware files, for a couple of reasons:
>
>    1. Avoid having the same firmware placed on two different
>       places on MODULE_FIRMWARE(), if both 915 and xe drivers
>       are compiled;
>
>    2. Having firmware files located on different locations may end
>       creating bigger initramfs, as the same files will be copied
>       twice my mkinitrd/dracut/...;
>
>    3. this is the place where those firmware files are located at
>       https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
>       Upstream doesn't expect them to have on other places;
>
>    4. When built with display support, DMC firmware will be
>       loaded from i915/ directory. It is very confusing to have
>       some firmware files on a different place for the same driver.
>
>    Cc: Matthew Brost <matthew.brost@intel.com>
>    Cc: Lucas de Marchi <lucas.demarchi@intel.com>
>    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>    Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>    Cc: Daniel Vetter <daniel@ffwll.ch>
>    Cc: David Airlie <airlied@gmail.com>
>    Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>    [ Mostly agree with the direction of "use the firmware blobs from
>      upstream at their current location for these platforms". Previous
>      directory was not wrong as the plan was to have it handled in the
>      upstream firmware repo. For future platforms the location can be
>      changed if the support is only in xe ]
>    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>    Link: https://lore.kernel.org/r/20230310081338.3275583-1-mauro.chehab@linux.intel.com
>=== git am output follows ===
>.git/rebase-apply/patch:594: trailing whitespace.
>	
>.git/rebase-apply/patch:597: trailing whitespace.
>	
>error: patch failed: drivers/gpu/drm/xe/regs/xe_regs.h:92
>error: drivers/gpu/drm/xe/regs/xe_regs.h: patch does not apply
>error: patch failed: drivers/gpu/drm/xe/xe_gt.c:606
>error: drivers/gpu/drm/xe/xe_gt.c: patch does not apply
>error: patch failed: drivers/gpu/drm/xe/xe_gt_types.h:66
>error: drivers/gpu/drm/xe/xe_gt_types.h: patch does not apply
>error: patch failed: drivers/gpu/drm/xe/xe_irq.c:639
>error: drivers/gpu/drm/xe/xe_irq.c: patch does not apply
>hint: Use 'git am --show-current-patch' to see the failed patch
>Applying: drm/xe/RAS: Count SOC and SGUNIT errors
>Patch failed at 0001 drm/xe/RAS: Count SOC and SGUNIT errors
>When you have resolved this problem, run "git am --continue".
>If you prefer to skip this patch, run "git am --skip" instead.
>To restore the original branch and stop patching, run "git am --abort".


please make sure you are on top of xe-drm-next branch

Lucas De Marchi
