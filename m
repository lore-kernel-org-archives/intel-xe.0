Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D35CD342F
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 03:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E5210E144;
	Wed,  6 May 2026 03:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0hAp/vp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5015110E144
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 03:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778037950; x=1809573950;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d018xWI4117kjgftim8yqyk5v/BF1oU8zuQGvHxEFuU=;
 b=H0hAp/vpigUSlev8qYzy9FkYxtXDhyIBzsRLDSmwPW/ov+kOrMmcued6
 2upkXUVEcUuvQ/3K60E99wHoj/r0CqDMWo6GCn3Dc1BVl1wHzLAU2OEJT
 qV98wKLRvsw9Pp3pcXpCL/FI+pHjYD1IEKMiDr+PzjWN9C8ZhhFEXUqOG
 ynpShuFvvjcoAtIZt0H9YH+9HhkfIQnpBwwN5S0j6fXYtXHcvq8T5E2QL
 bB2Qu/qt8l0zA1oVtnt7E5esb2/pU4oXPcU4+Q42xWluxTz1tdx4bHSnZ
 z3uw15qycSn2z8HEsS2zuPRAh4mGqRejoo/p+2yismaIlFXWjVaJN7row A==;
X-CSE-ConnectionGUID: 4730dq3HRKiTDC9If3zQcw==
X-CSE-MsgGUID: Odriy/c8TjeTmzbO/shzGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82533976"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="82533976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:25:50 -0700
X-CSE-ConnectionGUID: Ble8CMauR9K5hjToeZJ01g==
X-CSE-MsgGUID: YAblMZkETY2vvBhxRyl7xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="240306862"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:25:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:25:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 20:25:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:25:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzeGNDkj1kY6yDTRaXUb8QtGFYmPK5+LEcXiMAj1NBsx0dxx/SpPEJ8CAEXt4rxRHBkKalNGaq25Zp5Y7rObTvr87qxBrfmGyagJgT4jCJtSFkvV5Mi2E82CAQT0Facc/DY6JusAPMAUYeGJrsmuhqUUECeZ7m7wlidqw5kHgSyzJfoqooAsfge3CQ8Vkv+18NHvnwTuqS14BOrB84Vm+0L/x95/9IG2mhzqyfm14pGBQOcqZrjefZDc+ZBPZcS7iyx1N4/RNJWuRcHYxfPeV3tzWTEs/Ad01kmtR1bC9kJ4O8htASNW10XjFs7kzeRc0naDzAKxOwabPXvk+YFmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExKmKhr3RIllhHlnLJhaA/f2sqst8dZhrU3U0Ch8xv0=;
 b=C1NliJpt4T4zCLpmeqTvNsfP5TxehIFYtF8hD/C6WbDRo0bVH8M73GBqS37AQGb7rgCkVn/JSLME6ouxsmLfIIorhMqQR9nMoxvPXf7JKY+dsrozZoX/XM6rkNknSBtOkFBjxpC9Tl/P8lVd6c7P3XgIxkssXKdlIUf8MlZw7qANzETBFePOPkuN3n92gI00uykQqWLE05y3WVK2+lXfUxNWXMeZGJtTZp7Xu2bTbK3XVrtVoFNHyXdI4D0dFwOVpZ6pJH8RsyEb3KBrslp1Lke6LTKxP2O2TxTrKbNjQVwShvKsui6QLUTuoXh79oBsFwPjyWrB5qyFm/sp0KHxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DSVPR11MB9695.namprd11.prod.outlook.com (2603:10b6:8:351::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 03:25:48 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:25:47 +0000
Date: Tue, 5 May 2026 20:25:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 06/11] drm/xe/multi_queue: Add helpers to access CS
 QUEUE TIMESTAMP from lrc
Message-ID: <afq0uAVxN4-11_qC@nvishwa1-desk>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-19-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260505234408.3552147-19-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DSVPR11MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5cf7d5-eedc-4b73-7b8e-08deab1f2a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: iGgdr4cTuiwrsdQg5dLrwgcngQFjXtNH6ZBZhGeu9wUW+3Gppqo8S5RMFklsvrTP/W/PyC6B0vb3/a6GGZKsP4bLMjHc2mphGwD+KJA/aRau9/pM8ihTnZS003roqdsMwCqka5vhImXWDIC0mVJnnsYA/9/CL0mHWfBCJ/BIJIOEX1TZTvSHawOErw6qT6mMfgEjZjhkOTxy4yuKNkpQGwvY9HvASo4OTS9fW5aPDoa8HYGoLmPP8FdfueQPKKH+1wpZRyIXRsKTjbrSrHc+CZIgIzdIgGKR2vqlz+DKNZ4JfnSnXepQR+Ng3SpBqB0vaNQoKERb34jiqXHkRB65wAubaOOpTffSlocJbdKPwn6vuBWikpPyk4IfzLxQGtw24KcqqU0XmRqOEWg91Xytbk/kCaGw8ro3+JTDSEo2QkQsG4pYMBxn6G5m70LG1d1ALtCr6KuLdUdxd6iDCPREcFgM6hqFdlEcmUFo22vhhFzrptGeFPZ3nX1DFP8TR/6ZHw3aUcC9eXo8X37fwpJbJTTS5aYNlB0CUmk1KWYXdA/k51z5w0XgvZZV0E6UFbLG7DIC6EQCOtHy+IgrVTr0SDcazFqhFidcg6nNZjyPD8GfyaZb6OS2cuhzr7QG31tynYyOrIgndl5t5zfNcia8aZojbOvNE3AcNVQQotFGlTXSfW/rys5mEJ6b9MSPM/Hd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fDMnxr1o4xTVGmHB9Wu0IhD7lFcNHj6HoiReN3RjJsHsiY2WPTxk56MBefJZ?=
 =?us-ascii?Q?sL7atXrvedjT0HXxfvAQRhCQK472Q2dE3bLl+1EFSOFwxhRgvJUuZd94SMFS?=
 =?us-ascii?Q?GfBli1r2oe8s0NgAJiP9ISxemAiFFw/1woL4ZqEt33DqtpC6Qn58/qSElM/G?=
 =?us-ascii?Q?tXquH6hdFGdqqbteOWwzU6xTXVxi0+FPj9dQ7eg/arp7f4G3Iktbx2otsNOW?=
 =?us-ascii?Q?qk4pQPDLxUzzLbe8Egc4LBUwnc5d6jfvGf1gV6frUn8twNzgtqwU4gr08/DH?=
 =?us-ascii?Q?AJ3T1Y+/9glzszArqwgNj/FJDW+YzT/nBEgnVYedbKCEg06eAqH89jhkF0nJ?=
 =?us-ascii?Q?E7HnFkzl2ls9nEDp9UcnUCBUEDHFjiN1DfgaMurSZvmuNVkLFR+UjVZlB3nr?=
 =?us-ascii?Q?2oHXBkeiClL8PW1m8dkOy6jyPnmhnSnfBgIvjJt/Q5EFYeiJpS79d257qCce?=
 =?us-ascii?Q?khwv2q2cQ1gvnf78ocGFuF8CTHCZvAuagtgSh6MajkCYEsvDkaAWo6BEaRLs?=
 =?us-ascii?Q?4uPT/aSC9rGytxektjzJcM1XxRH71fk1qP2ZE3ROV07r96nRkixLBuGFcU4K?=
 =?us-ascii?Q?PYplbR8c/cj31QT0yL2KaXTUseRXS/A915PmhQqcLCJSqDXb2O5adSJULW7D?=
 =?us-ascii?Q?qGd6nnSXuv5rz3WL2YsSglR8bIukYgS4d9fD/A0A2HQ2Ou/JLbYbWAIQHfn5?=
 =?us-ascii?Q?9vJhkO89RDzKaUTvYTigeqiexopvvYxZkux6hAHHVewjkUKOHh5egAMjkYqT?=
 =?us-ascii?Q?4Sd6uqUpED/Szeozp8jXuKVQ95UWKU/Dg/vDOa+TgFZ0f/D0/lZrhNQazIY2?=
 =?us-ascii?Q?GquG4W/vLtzjj5FGFuF0wO9SCT06qEVsXoFOmXHyrLWSu/wJMEU4z4HyZIMo?=
 =?us-ascii?Q?2iYiekGKK5fQjXVGr2JXcxDpWlpKvHhkZZNzmJQep9k/VYraOfMw/hsj+Tm+?=
 =?us-ascii?Q?CXRAhYrLvGyxpQv67ywbBUybtBTGwbCtyuMNcJWVpL1vqnu3VKQPDNd1F17X?=
 =?us-ascii?Q?R6bh3vTktwaUMup+wuZk/GG4WOofUrdcKqTscq49MTibJtKR0BupHi921byd?=
 =?us-ascii?Q?z+imwAjjzYRm7XqKBYDCncVG595/8XZJywFixHa5wg/Qi8/vOIsd8ifRzX1T?=
 =?us-ascii?Q?imloOgs7VD8tJmsjg/VKvmB7HIF40I9zgTX9qc4l9fB/+6KSwSz3WVlYAX+b?=
 =?us-ascii?Q?Q9WqLSLqZiW6X9tRnGJmNLR8SdRmQNTnGNxO8IZS+xGrYQD9TP8l8hxKhQ4r?=
 =?us-ascii?Q?oquWWtT/tcIkwnjF0gx7EMOFtwh3dlu9HggwMhZuXdmcPV5J5NpYkxZXARUK?=
 =?us-ascii?Q?kmG+iDED2xrgJ2kZBN0tAWO/6wmkf3FGFOLv+jS9BE5W7yp8caR0skXJs4vc?=
 =?us-ascii?Q?69EJSepw9WlEU2oXRcIWLS/z1SuX/ialYIUg0jGcuiAhM51ZHOQVno/6dSiO?=
 =?us-ascii?Q?k9jj6/b8qZXx9XaQIqKU/f02Mhxi6aw92Be8ZBCakePK203dAN8540DZ/YDm?=
 =?us-ascii?Q?16bHmRGINl1wrHxEYQMj5TCZVVxYSKT92WtWrrXAF3heW3vwG389NnZwu77b?=
 =?us-ascii?Q?M0DHqebFJqoQqjym54M5pDLc5x/VX9w7uL5QpkEo6Y3jmCzuglZViw21FdL1?=
 =?us-ascii?Q?S/t1AMGUMxjeYHTXv5PXK5qVJtPnrGzSR24yFugmUZsk1iggQHSZOAO6DAPz?=
 =?us-ascii?Q?T8Jc3/hD8AGPxcYxIazCzDgMSzeiXo69veilbx4Ql6q4lkl41s5Z3omf8mds?=
 =?us-ascii?Q?kKf0O+xgoNneFMiNfIbh/9Ogf3eZxygYfNX4BtdMIfjBFWpElLwH?=
X-Exchange-RoutingPolicyChecked: Oedq2jUfA0tsXqskTMYFakNEVLKRfJGLIAPnvUyC5kGDMqaddfpfncaHA1aaojJQnBGhcJSE+a+tZb/NJifJ2FTqga7NghV4kw0lMRmo0aAVGFD8vjyL1GrsIf6l00SSvHaAAZ7k8fy1on1aP0DU7N4KtaUS0yk6kU+F1gZA1abpHHq2xGE8O3RrlFnhnHNM8fm1deu8VNpk9DWhTvxoJGcWJ/Rq41tNXhW1/3pxTR8OdRITYIazuW/F9foRiijJDc9xuc9TTOYxX1uYj5h8CtkTO2ehlihM2cIOLJMrWsAAoAEEwcNnA11VJqBH/W/8MqQCIi/vJktMWmEh3GoagQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5cf7d5-eedc-4b73-7b8e-08deab1f2a53
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:25:47.8147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trrzNHE3l8R/I/REZqK4zJZW6GtKndbYd8Dtjd9WaYy23aIIFycQiSoZdC/NRd1QL31rLcvno86zW2WpwhpbbrZCopTu4cZQikRk/6NNDEd120wbSbU4WQbU2ABPHjNH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9695
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

On Tue, May 05, 2026 at 04:44:15PM -0700, Umesh Nerlige Ramappa wrote:
>In secondary queue LRCs, the QUEUE TIMESTAMP register is saved and
>restored allowing us to view the individual queue run times. Add helpers
>to read this value from the LRC.
>
>BSpec: 73988
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2: (Matt)
>- Add BSpec reference
>- Make queue_timestamp snapshot 64 bit
>- Add a snapshot of queue timestamp in ms
>
>v3:
>- Replace xe_lrc_is_multi_queue check in lrc init (Niranajana)
>- Use assert instead of check in xe_lrc_queue_timestamp
>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 46 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.h             |  2 ++
> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
> 4 files changed, 54 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index b5eff383902c..4ab86fc369fd 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -34,6 +34,9 @@
> #define CTX_CS_INT_VEC_REG		0x5a
> #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>
>+#define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>+#define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>+
> #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
> #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
> #define INDIRECT_CTX_RING_START		(0x06 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 3b6990d68a5a..127a2ebc3679 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -777,6 +777,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
> 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
> }
>
>+static u32 __xe_lrc_queue_timestamp_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP * sizeof(u32);
>+}
>+
>+static u32 __xe_lrc_queue_timestamp_udw_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP_UDW * sizeof(u32);
>+}
>+
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
> 	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>@@ -826,6 +836,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
>
> #undef DECL_MAP_ADDR_HELPERS
>
>@@ -874,6 +886,29 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> 	return (u64)udw << 32 | ldw;
> }
>
>+/**
>+ * xe_lrc_queue_timestamp() - Read queue timestamp value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: queue timestamp value
>+ */
>+static u64 xe_lrc_queue_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+	u32 ldw, udw = 0;
>+
>+	xe_assert(xe, xe_lrc_is_multi_queue(lrc));
>+
>+	map = __xe_lrc_queue_timestamp_map(lrc);
>+	ldw = xe_map_read32(xe, &map);
>+
>+	map = __xe_lrc_queue_timestamp_udw_map(lrc);
>+	udw = xe_map_read32(xe, &map);
>+
>+	return (u64)udw << 32 | ldw;
>+}
>+
> /**
>  * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>  * @lrc: Pointer to the lrc.
>@@ -1538,6 +1573,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
> 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
> 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>
>+	if (xe_gt_hwe_class_supports_multi_queue(gt, hwe->class)) {
>+		lrc->queue_timestamp = 0;
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
>+	}

xe_gt_hwe_class_supports_multi_queue() doesn't mean given 'lrc' is multi-queue.
The 'lrc' is multi-queue only if xe_gt_hwe_class_supports_multi_queue() is true
and user has opened that exec queue as a multi-queue.

But yah, we don't know whether the given 'lrc' is a multi-queue lrc here.
Perhaps, it is ok to keep this code as is, as it doesn't hurt. May be add
a comment above explaining it.

>+
> 	if (xe->info.has_asid && vm)
> 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>
>@@ -2466,6 +2507,9 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> 	snapshot->ctx_timestamp_ms =
> 		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
>+	snapshot->queue_timestamp = xe_lrc_queue_timestamp(lrc);
>+	snapshot->queue_timestamp_ms =
>+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_queue_timestamp(lrc));

queue_timestamp is only supported if lrc is multi-queue.
As we are calling this for all cases here, xe_lrc_queue_timestamp() will assert.

I think we should do,
if (xe_lrc_is_multi_queue(lrc)) {
    snapshot->queue_timestamp = ...;
    snapshot->queue_timestamp_ms = ...;
} else {
    snapshot->queue_timestamp = 0
    snapshot->queue_timestamp_ms = 0
}

Niranjana

> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
> }
>@@ -2520,6 +2564,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
> 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
> 	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
>+	drm_printf(p, "\tQueue Timestamp: 0x%016llx\n", snapshot->queue_timestamp);
>+	drm_printf(p, "\tQueue Timestamp ms: %llu\n", snapshot->queue_timestamp_ms);
> 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>
> 	if (!snapshot->lrc_snapshot)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 557dce004d48..0a3a611391ee 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -39,6 +39,8 @@ struct xe_lrc_snapshot {
> 	u32 seqno;
> 	u64 ctx_timestamp;
> 	u64 ctx_timestamp_ms;
>+	u64 queue_timestamp;
>+	u64 queue_timestamp_ms;
> 	u32 ctx_job_timestamp;
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 0a5c13ec2ad7..53ef48feebfc 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -64,6 +64,9 @@ struct xe_lrc {
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>
>+	/** @queue_timestamp: value of QUEUE_TIMESTAMP on last update */
>+	u64 queue_timestamp;
>+
> 	/** @multi_queue: Multi queue LRC related information */
> 	struct {
> 		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>-- 
>2.51.0
>
