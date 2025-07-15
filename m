Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE66C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 19:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5237610E630;
	Tue, 15 Jul 2025 19:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7AkNZGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D5E10E630
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 19:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752606805; x=1784142805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=25FHj16dzHG+wmurnxlwUqJhkThi8aOZFrsOSSgoZTU=;
 b=L7AkNZGD/hH7xh7nwykDgyp5tv/nRwsm9jWPXskWmss4JLUJ5UZRC0ee
 JgeVQ+L7FxhKI2GC/ftxHNva+o3EJVqiZ1zs3/EtystZXKVTndLIznDYU
 9KsSZHB0pMpDX0ib+WFTrVoxio0JXiR++u/D5r9416/NRqIusPpaGJehX
 WwjYfD5yDvZv2gp5ntcblZ/+NdWg3yYMHNrot5YGxR/azfjmA7Q+euDEk
 nRtX9aauQmGrHvahgeLNXoRTWcb3n53eMyg1Hm+bMQET/KHJ6E+yK6iA7
 Z6dztNDM6Qr8awNLmABkQHpRPBQeLSaTUEGi55gwgfqRm0nYMjFbFamRu A==;
X-CSE-ConnectionGUID: tXfcz5+DQkWLUSOAaY+sPQ==
X-CSE-MsgGUID: j+dNN3cvSWuQpzqmQ7VtDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54931550"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54931550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:13:24 -0700
X-CSE-ConnectionGUID: kCUyzyWgT5uuo9bOKT3xOw==
X-CSE-MsgGUID: YcGWQ+jPQneSQ2NfJA1q9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="157654284"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:13:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 12:13:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 12:13:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 12:13:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQysvKZleTcgVeVOopLnR6u9hN6y3EL09kBXuTsXOhVSwZZFscWWRGFvjZYnOUF87eUPio/+RSSDWVA3xB+Rn5htJMVKtSPKn7/uQXPboXxa/sUxYaZ7IiU3HhLKPAUasQTTRZxT3B2uvbfIni9gpeqAOnVmWfqqP8iBjxLGVFRCCFZM1CdF5JllfQkvHT9Pxeyda1k48rtifGldqb6h2Yi0SU1wsyPqpGfqEEuTPcTylY7ngcHVr6bq7WlvJY58KeoduMMWvB/rALH65HF7cx/M3nYu7QHL2B8stQ5UNPB0W0eDimJ/nVREpOkc9IrmRFXd3iaAH2JgxhjMxaqocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dT2Gg6P6GNRee8PjTdLYshCHXRfTsCXUegHvwmtQc0s=;
 b=NZbwBhdwskscrHUpc1gseaNyFLlSbmu7NvSQ/4cDv7R+H/O4CvZoG7340t2Jg/lBBuNNQhhwOS2JbQlRmVnA3VmhFyrD7h5GWyg/Sec/n3KqolO2P4BFCH0qCG0Ur5KnOuJnkPDmI2QZZAT267ncynrm5T6gdCtQM4OghSZ44x0ctXpNiO7ACRG/Rh9zdQAVnyoRk2JOxok0M3L2SLxyuM6lPL3quUmPNzDyqAz99rMPzIFpoUbVljudEpxAHW2KqKZZCeEohhjAKvV6nLqGJAW/V6t9e8GImw9znFk6+BYBwhhndUUroNEBm6Bzq9xlnlV6bfvxjuRCfIsW/GiNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7393.namprd11.prod.outlook.com (2603:10b6:930:84::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 19:12:38 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.023; Tue, 15 Jul 2025
 19:12:38 +0000
Date: Tue, 15 Jul 2025 15:12:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: DC state mismatch during shutdown
Message-ID: <aHaoI6XGTtVnVBmX@intel.com>
References: <22a0d36b-cc96-4e51-9b9f-e387e7707b8f@hogyros.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <22a0d36b-cc96-4e51-9b9f-e387e7707b8f@hogyros.de>
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: af2f2cd1-0df8-408a-17f0-08ddc3d3903f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hmUIshgTjH2l9voskB1IMUYMxdv1l73cub0hwdmRN5UxRippi/nkFegbx0Zf?=
 =?us-ascii?Q?vuEThiJew+YIjopu/jwq47SO3hZQo1vTo8GHFIPkiihp8uJLhstBvwfoZ5fp?=
 =?us-ascii?Q?nPDFaT8L7OMuF98B9ggnre43607/DaxiwtFu6EZL53T3BN1bC79avS6+Uow2?=
 =?us-ascii?Q?4FvSr2lSzmfTvFTZuAr8ryGztdcax2y+zIPkid0/nDFl+zf7z2pPztiggX9p?=
 =?us-ascii?Q?MSJIJWhaRwMBkr/uNK5TorC7SOaWGwgAmZLNVu7irnDa/LO7CYYocXWdH6sa?=
 =?us-ascii?Q?5QkistAsxG5nSFQfZGZFrF/4t1QbZ2aH9P2GHrn2y8fwBfvSc3wn9uYnXtb/?=
 =?us-ascii?Q?QsSOffzYFb0RHgFaZqY9oQhpHwvnESp++gEQ0vOK3EC6Wwt5ieh1FyYRXQn8?=
 =?us-ascii?Q?YIBqPtHX0FEEqpg6aff9gGh5p9mwkbrYOGy91N5qq//jkGaQNoEfFl1XkVbx?=
 =?us-ascii?Q?6WfQh+a2V87WaIQrItJkvUMA4XqMHeAsDILF0rhkXfBhM2rqoAC+s/DnPwhu?=
 =?us-ascii?Q?kz3YrxsCcM22GPSUUUaSej4sk6rhJFtAM2ZT2HbTxh41eU27snhY9c+h23As?=
 =?us-ascii?Q?Eu+uRYMlmH5mLrnzN2ZLzbfrgLo/cr6O06MRrP4MqxnAdscGe5FWTGFslLgz?=
 =?us-ascii?Q?TIGHMDdHZqExwNH+yH3H+YZPxoCUEZHBnpEw/gYVKqRs4dbtkzOnxjYCZkTj?=
 =?us-ascii?Q?VOZKWV+ZFChBtIFuKpqeKUajUtOGvOoaeMLzZOFaNTYjKmHBir17NiLLUMMK?=
 =?us-ascii?Q?wKBcaA82yRSXhgSm3aT1Ec5JjJflteINa3eUmmBV9cDrVk1dejVtl2FuB6MQ?=
 =?us-ascii?Q?Ug93+mobyocI73Dl0+5BG3w7uj/xmia9UtvdAqQ3ycqMCtNU0a3cgd54ksEi?=
 =?us-ascii?Q?h+tFTssnakeqlHZndNuGZ7ts79OvxYFAtmhC0I9RPwYQEVDsg3qDtaNKn9jZ?=
 =?us-ascii?Q?g8q1W/3sUhyPeMsI+uFiXCCvN3aACSWB0JfWPbVZibqzSxAtbBKlSD9a5xwO?=
 =?us-ascii?Q?bNTra4g+w3RlxxZrrmrJ8phRpzsgBTkUh6UOuStMtBW2i1xSqr/X9DwPHvkI?=
 =?us-ascii?Q?ojbCL4zd4Srl0cSIgxSrTkABEqebbn5MMkD1bjMinL1IxEbpNA6lKSBwQEr/?=
 =?us-ascii?Q?7NPOjDQnkvITJxqb61Dg0HLgm49NHXZBcB/lQH+0f2pvndqLkekiHQ5+GhN5?=
 =?us-ascii?Q?xNUelzNGm1hvUnsfDovZ4ZvDBKrkp/i3HmfkyzkFBJhN88TanmLYijPGpeNp?=
 =?us-ascii?Q?r/knz6b+ez2EYKc3OY/TIebNJwSQ76jhj96XKyZToxfiOhL0vx6dyog4Wo+y?=
 =?us-ascii?Q?KQofqIO1/M1jaYJB1PahGWG4MYxuh5SFbL1Nxxvq08QpCQ/EUieZn5qGh0N1?=
 =?us-ascii?Q?Qc/zLYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vNICSDMTjVFSLv8gqGHnPV5+X7FXcXif4KwrhEyqB+T1YSHmWFsrujwDCiWD?=
 =?us-ascii?Q?Lj5gPWnp8ll7zLOZQWIWWCUwou2XkMjhxI1H/hgzcyKAzeDvOJtA3Yq4scW4?=
 =?us-ascii?Q?rbBHScaLFYaM0ZARvm3PHJG8hzC0NsJIaeFAim0a4WYPWP97QHFmJ4hPpdEK?=
 =?us-ascii?Q?Q/VA3KvI4wpRHSyBnm35LzcMyj0ZWZTqgShy1+oreudn7/k7KWbDZr+oDX/+?=
 =?us-ascii?Q?fJ34MwiP6o8t3on5V+fI8cxKRRwdi1T4ukUR/Yh2BLfjdpNBGvqVG8/LW/fE?=
 =?us-ascii?Q?TvG3jxnMwr+KigK7VDMpqHKwSPkWF08MCoxmqRvwpolCpnVdhie1ulnTXdYM?=
 =?us-ascii?Q?D7yQWd2g5FwuhyxvozpS4/8ZFCt1X7MWWXoCUOnm46J5ou1bGmRSTB5PSBGR?=
 =?us-ascii?Q?RLJ3J0h/On6ZKupDQLl9Zlir4qbGhqN7UAJXrMD62b5pYMby9qgWIxJZMpMh?=
 =?us-ascii?Q?nDgyGOxC2sPz6LejUxjsP7c2h2dhUxbZai90xnS+2HWN1WVueYEIse2tmaQR?=
 =?us-ascii?Q?lHX1jwh+KXmJ68SLMTHlO58pVp0pTNy+4qkZEqYhDQtG36ypGst8w3OdoIve?=
 =?us-ascii?Q?e+8tyMarhSpHh44wNTgh52FZGxqP1dMOySdjJhRpHFnC9YphtR6O3r/M9a8+?=
 =?us-ascii?Q?f0zZAF1lsQOtSrG+PqataDlTZXIX4PQTnnKHIzovCIdSfDleFXC8TPciHU8t?=
 =?us-ascii?Q?MN0sBV5ww175+oXDwRLRJWUGN5J7KRzrSDW9dQu6opKwbAJxRAu0fJFVLj8T?=
 =?us-ascii?Q?JF348BydOCMGX5nSvQcB7Vcs3Q0tM7wYytH5xdvJ6IjRSm2T16wYFYve1cxS?=
 =?us-ascii?Q?CElGBufCgk9aOWvS5T0NLW7Tho0iD1rVWpL4IGTb0Bz0c7jTdv7+r11IyiTR?=
 =?us-ascii?Q?NwnGq+7G8Fpy+Y8yD/FBwsAG0OtWC08gPitJwpSr5UIVEVA2TPw13veAPOjn?=
 =?us-ascii?Q?+5CGYV/47UH2jDmbI+91IPLItkH/mb9RiEdJA3jDChvie8bUdqnDEohKF8qN?=
 =?us-ascii?Q?nmIgrgxrB6Xf16pgiFboKVcGVBeWBJeeONXxm+u9j4Y2zaC8s/Pa9EXkMPfZ?=
 =?us-ascii?Q?wCECT8KuVfPD9BRCj+15lVhki4APl/nyMpjdqCG/6330A3FUWZ2uSCLdLvDO?=
 =?us-ascii?Q?2yL5e0ZtkMhbsJBqBDVNLHMtlX+FWaXcnEMdiSVaQlrHeGm2QjcCOgcdB6BR?=
 =?us-ascii?Q?KKafT9Y3kzqhFB9FoFZf+51rGcSCV/cnY0I6OC9pJ9azyTxs8z+YmBfIS9m8?=
 =?us-ascii?Q?f9pe9MS3qZKekyTj9ZWVnLKmwzf44RMsgH/2J8NIxJVA3cXPOPJoLYTWsKB5?=
 =?us-ascii?Q?Q970hnXSxZPKBzid0Fl32mHoHFTULePrq/YLrPSVKOaY4HYxD54ch3stQj6M?=
 =?us-ascii?Q?+8Yu0TktULQ0B/+ip4x3yspdf5tewbPL/XaM+XT7V8/DH3VMqaEanVFRsC+x?=
 =?us-ascii?Q?AsUKiNWBGFv9vlAs7zgRFDEcvii62SWtRTAPIxGYRd+2JYgeMpCH30rG5p8y?=
 =?us-ascii?Q?8STb/u5ZTcWXQVZA+jaMBfU1TMmZ2VobtFaCyqv/LOIHvdtV1vgrMm8OhPsz?=
 =?us-ascii?Q?mRBBSMPkBZH10yV5POK+Xe9d+WgQ7y7PmP5CXTlUXIt7YPg21LFR6AlidnQF?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af2f2cd1-0df8-408a-17f0-08ddc3d3903f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 19:12:38.3787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4Tvsg+fgh63QvZjOEeooG0N+aZ6yR742vS4GvX/968ssm1uU2boEp6bn2xQWmVT6f8X9Z5E+9+sWo3PkFa40Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7393
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

On Tue, Jul 15, 2025 at 05:48:47PM +0900, Simon Richter wrote:
> Hi,

Hi Simon,

> 
> I have a few error messages during system shutdown:
> xe 0033:03:00.0: [drm] *ERROR* DC state mismatch (0x2 -> 0x4000000b)
> xe 0033:03:00.0: [drm] *ERROR* Writing dc state to 0xbffffff4 failed, now
> 0xffffffff
> xe 0033:03:00.0: [drm] *ERROR* DC state mismatch (0x0 -> 0x4000000b)
> xe 0033:03:00.0: [drm] *ERROR* Writing dc state to 0xbffffff6 failed, now
> 0xffffffff
> xe 0033:03:00.0: [drm] *ERROR* DC state mismatch (0x2 -> 0x4000000b)
> xe 0033:03:00.0: [drm] *ERROR* Writing dc state to 0xbffffff4 failed, now
> 0xffffffff
> xe 0033:03:00.0: [drm] *ERROR* DC state mismatch (0x0 -> 0x4000000b)
> xe 0033:03:00.0: [drm] *ERROR* Writing dc state to 0xbffffff6 failed, now
> 0xffffffff
> xe 0033:03:00.0: [drm] *ERROR* Driver-FLR-teardown wait completion failed!
> -110
> 
> Before I debug this: is this a known or easily resolved issue?

it is hard to tell from here.

Could you please file an entry in our gitlab issues?

https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

Thanks,
Rodrigo.

> 
>    Simon
