Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9802E81A3C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 16:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAA710E0AB;
	Mon, 16 Feb 2026 16:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRnDhd3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ADE10E0AB
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771258466; x=1802794466;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qVv3KDyMnrYRUzuENJtxo5h2+m5qFzINLLazk14EXMc=;
 b=kRnDhd3HFjbL1sT8rnNvzeztFFC7N9kP7AQaabV2wvESQXmZLCwuj1Gf
 7eujSzkV81O0MTzxCA11aIQZbWUxOCXgBXTzLKjT1m0jGUP9eWHbXHJwU
 iUUCn8olzCqn6HkmgIFhRlx/9vjveUiTlglpKwOGjbMXwzE3+2s+Y8Tsd
 xhXSHDvHOYxvrWHp+Z1oqNy9kR90KJvrWk5pD/pYxdn2lj+OCqYtuJxlc
 kBtFQXAWzj0LYcTrX+6QEAA9MxuSBwEH5sdi7gmtQkuckCNcUV5LvgixR
 kmn5BT0Wmf0+i8DBIShNKfbSvepxcDvqX0xHtcTnEwxM47NEHbqynylGd Q==;
X-CSE-ConnectionGUID: r1XdKVcxSYCvvHE/gty3HQ==
X-CSE-MsgGUID: u9MTASKbRDW8gz7BoEtpXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89752030"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="89752030"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:14:26 -0800
X-CSE-ConnectionGUID: ScK6htSUTVGZR1MvNCH3KA==
X-CSE-MsgGUID: UYb0wydsQC+F8PY+uM2KZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212615541"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:14:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:14:24 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 08:14:24 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:14:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECCq5hFkREr0AsiI8IEFyxMe39En5KP4Roe/5gYtSHl0UEU+CuNlCBsbycYduN08wYuCXH1zzvDlcQJMYu3hmLI+7/xd4WNG8Ak7uVgh8/VAoUmhRplNN4XRVSJxZpTNOEV77svoAvjm8FlGWQScfH2M7R+WzU3iIiB/XcZZkkGjTa5fLwZ91od4ktIhqoUhdyahqo8Hv+JcSrPQNJAz6m3auIPKg08HQVR+WsC2bOJfkjgBDdHHAANx74HOynXVYiqcX/sNEfB3gEBQnUKTWDw+tpioUzdykjVDwcscwB6GsJZjgpiitScxjnZ4ikjQMA6l+rUpe8PawORMJ+3a/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dp47HkXF3kA5N9cdEZ0GfzzwJkLzFwN3G6Uam24nzrQ=;
 b=ZBKFULwKtIWlTDhO9bbhVqZKwGOrE2D1CEVVjlJaBFHKi47l+IAV7lIQbulZZvkVcmZHOcyFvFK0TSIV/UKcDfP2GvLSCjS+zdomnN3age86pRv+MvCtDFAWmEgNV8wPwYyLuVqb/IUJsN5wxVPui96BUdELJcS7rv/+zJFiXYQuq0VKMqHDpPueI7QQ4OBnP5lrQCAxmwNzGhueNftXxYzM+8bzoTmj5jJC60fCMx9ksW8rFYwywVLB5fdrty7p64B93SCdJXkeCzRW9iHUcm07jxQw+1NKCgouf4nqoINKxZSIRXVeY7C9xJLwdSrfwvj3kz1kgjNX+cWBM8t77w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 16:14:21 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 16:14:21 +0000
Date: Mon, 16 Feb 2026 17:14:18 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/9] drm/xe/pf: Use migration-friendly VRAM
 auto-provisioning
Message-ID: <20260216161418.grmul6n3t4voclia@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIZP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 38159758-f5fe-46c0-733d-08de6d7671be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXlpb1M5ZzhrZXBoUXpNdTN1R0RITlZiRDJVYU1hdU5VMFFUUW50Z2RQaWp0?=
 =?utf-8?B?WTVkSWVzU3dHMi84V0k1RWJ3L0lOTDRiRlZtVlFBOEhPc1Jwck5SNWozTFJ0?=
 =?utf-8?B?dFFFL3Q1TUl2bE16Ym5FQ2MyRGRwRGpMWTYrZ0tuZUpja1JpSEFPb29zUVdD?=
 =?utf-8?B?dXBoRnRoVW90UE9vNWVhN2tWdkdRV0t1NTBVeGdSWTJxU0l4QU8wb0NscC9k?=
 =?utf-8?B?OExrc211L3BkSjFOU3hpSDVPaHovNzlxbDJyNVNab0NDOXhuVDBhcWptRnpq?=
 =?utf-8?B?cW8wMTJLWEI2QVJ1N3A1L0VvY1JVeGNsaTJaRVhxcm9iMlBPVzkvZ0RaV2Vu?=
 =?utf-8?B?MHJtVGEzT0ZYZGRJcVpGWUpvb2dnL0NUS0tZWlpnOXNnU1RKKzVMUngzYVpE?=
 =?utf-8?B?N3IrdWhIb0pmVDFwK29TNlZqa0JpUHVGL3M3VXA3Y3o5YXFyc0dyUWMxTFZK?=
 =?utf-8?B?bTkrSHkyZFhCZjJjUndOc0dBdjZZUTJ6SzZNOTljNXErZ1dWM21pa1dXQlE5?=
 =?utf-8?B?SGhBKzh3Z0lDWWhVZUgzRW1uWnJrNjBtWEl2UEtnb1dENlhiYnN4bHRrc0Zl?=
 =?utf-8?B?NVE3WkZ6OWFvRU1GSjBKT20rNDZVSnVoOWNJWHVuOVVtOEtBY2RUTkZpcVI4?=
 =?utf-8?B?NDJXWTdNMjRpZXh5eEZFYng1UWNTTVpXLzkwTkJmaWxOY2t6SUdBbWNiVHZk?=
 =?utf-8?B?ZForZE9ObTlkbUZ0cnQ4WmVxelM5NFhYTDAydzJZM2FLcnU2YWs0d1RQRnNq?=
 =?utf-8?B?UCtGaXBuNVdSSm0rS3piZWVkYiswU3IxSlJ1UTh4T01GNGk1VXN2V1RXYUVu?=
 =?utf-8?B?WVZIUHZYNFVIdWQvaGNJNDNIL29sYkp2dS9Kd3ZkY3Rhb2ZUQ1RleEl3VDcy?=
 =?utf-8?B?VTcvVG4xUkZOZ3ROZSs2QzB1blc3QWMrdVNtSXhYbWFuaDJnV2NLSXc5dFpL?=
 =?utf-8?B?RktWNmVobDUwM2MydTk5RlRCUWsvQXdXVEFuM0RWbVkwY1AwRVpLYXYwVjZU?=
 =?utf-8?B?MXdwSTdHcld6bFJGaWtJYkR3QkdxbW5MckhKdDNlNUI4RU9TWGlURTk5VndH?=
 =?utf-8?B?dkhzamZCSmVIQks0TDVXek12R3pBUFA1UGJDVWtLUzk1SnJWSk5PQnA4WjBz?=
 =?utf-8?B?TUVQamYxRVF3MVIvd2JoVjNwaUUwMjJhNDVzM1liUXowNlo5eWxwdHg0N0pP?=
 =?utf-8?B?QTBZbXJpQ3BSMjJOQ05rYzlrcTdwYzFaWUhRZW5XUjNIOE9CRksyUTlNRWZN?=
 =?utf-8?B?bmVIcU1jUzdWUGdPYlVaN3loa1BRd1Q1N3NOcEhNbWtGUHFMYVJzbTVPNlBn?=
 =?utf-8?B?OGtMemJjQXFEdVFkMnBaZXRuenVxK21ZSDNwMklFUG05bGRTcXorT2dZMGdO?=
 =?utf-8?B?dHJ6WDJtbWxudWNoNWorbnhxM09vdGhZVU8xOEsxZFV2UmRlWXBlL1IrWTRa?=
 =?utf-8?B?Zms1UHh2cEoxaEk4V2hXc0dkTTlaY0hCYXI2LzhINm8xVGRUNzdJM0ZZZHlm?=
 =?utf-8?B?Zk5aS05qNi9ySUZwaHpReGRwVW55M1p4aWFmRGlTNUl1ckNZLzltV2RtVHVP?=
 =?utf-8?B?NWQzM1Vac3JSMlFWSURNRU5JZ0xBSDFZOFpGZFdyMHpYdno5T1IrTlVVSUgw?=
 =?utf-8?B?Lzd0dFRVSmp6Vy9SUjFIbW8wS2hDejQ4SjFuc2tZTFVpbkxYaUdwRVdvcWdZ?=
 =?utf-8?B?cUFmRnAxR3JUd2tTNmJoQ3BsaVY5eGVmQThweUFobE53cm41M0NDV05HR1Zv?=
 =?utf-8?B?aEt5cUoxRCtTZ2xnOVpFNEJ0K0d1U2VGcmViU29LWjlpSTJwa2ZTN3I2TTJK?=
 =?utf-8?B?Z2xRYTF0NkdNREZmRDJLaTZHSGQxTXlUVkUrQUljWlVmdS9HWk9HOEV3a0FK?=
 =?utf-8?B?Q3ZZV1RNNXBkSmR1TE80QzV4anVjQ1RvQWhFKytFekFUNW1SQVJJejBzMGx2?=
 =?utf-8?B?UGZNTUxJb1pSUXVVY2ZlTXhKcEhQSHN2OGVKbDRGL0xwaXZsQjdPbi9VVGVl?=
 =?utf-8?B?Tk5KRUNleTV0OXFYb2ZZVUFZMEZKOG1QMTMwWTUwalEwUFlHZVd6T3k5c0Z1?=
 =?utf-8?B?QWxrWDJtZzF5bWpLakFqRTkxQ0dQZEt2bkZjYUtjdkFibllTZkMrSVp1YUlG?=
 =?utf-8?Q?S3hQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkU3SmswcDFBQUlhVEhIb2dXZ0RvVkZZK2h4VlBUUjV2TitKWUhSdm5LeER1?=
 =?utf-8?B?QzRBTlVUUERpWHBUcENEeVF3cHFUeE5LY0Y1YTdoNUZwTjE3dFpubEh6MmFY?=
 =?utf-8?B?RTg0d202ZnNSUi85VnFBWFBqSHhwd2hLKzVuazhRY1Q1UE81ZmFGN1pneVMy?=
 =?utf-8?B?QVlodnJRaWRDOTRvNUNhYVB1NEJCVTZvZ1RqaThNa2V6Z3VqUU4zdzRtcFRI?=
 =?utf-8?B?RmYxVkV5UlNPd3NkclRrUEhiaTF1cUVNM0lldFVab2k3UG4zOVlPL3duQTR1?=
 =?utf-8?B?RVRCUFhqK21tR0JwcmRZTmhlMkh1dVFYNmNQc0MwcDZiUHkwSExiWWNKK1Nr?=
 =?utf-8?B?UnZmR0pkUjhGZVltaWVpWDd3Vy8wc3FrMVEzZDVGZEExRUhmZWZDamtZaGp4?=
 =?utf-8?B?NTEwL2gvTC9UZmcyUm40SjBZWDM0ZWZKZnUxSFFVRVRMTDlXbjdqVStScWww?=
 =?utf-8?B?UkhYWFQzdUNIbFhLUEY0MmZ1ZEd1aVdBdHlvcFJ2RE1iYTNzdWN4azYyQ3l0?=
 =?utf-8?B?MmIzNGRwOEd1Z1V5NWVYdEh5YzJwbWhuYmlSeHM2RVNLTkxyTzF0N2hiWHJV?=
 =?utf-8?B?S3lUTXU4WmozTnNNYm5DcVVZRGUyeGpMVW9NSVlZTFZuNkRwSUM3QXBNcWhB?=
 =?utf-8?B?ejZTRTZEMWhYZDd2bm85R29tVHBCcmZNVkJTa0pHVXpBVk51WDJVVVMwcnhy?=
 =?utf-8?B?cFRqT0FGZkxYb3BZS0NyNTIwRUJ0YURaaHhUeHNmelJoWG56bXRKZCtJYUxL?=
 =?utf-8?B?V3ZacTlIRDJzN2xJOVBDVkcyRmF6NzAyV0JvUW9MeVRTUzN4Z3FFazBTK05J?=
 =?utf-8?B?ZEhoNUNrcCtjaTl1c3pnT0tGRlFIU0ZRQW93QlBid0x3cWJyekVvUVZaUWZn?=
 =?utf-8?B?QitiVGx2U0xnTUxrVndzQThUOE1STWxtUDVuZktlNlNjMXhpNlo1U09tdFZU?=
 =?utf-8?B?NmFnMDExZU5aQ3ZSQ2ZHQXdHcHBwL25NU1ZrbHo0YlE5QXFhSzFsUmp4REkr?=
 =?utf-8?B?ak5wODJ6ZHFIMUZGN29CNzlBMmpqSHJMck9ySFJqbk5KOGVLQ1BiWkQ4OUVm?=
 =?utf-8?B?bUxuV3pGV0ZWY3pZYnc2U1hUTDdIZmJQSU9HYzBLUWJjWE9DcVllOXZhanpQ?=
 =?utf-8?B?TTIwY3FLYkREcXpTYkhYWjUwUVh0TThIajVaTVNtZm1zS3p4VHE2dkdzemY0?=
 =?utf-8?B?YjR5bHBOWExDeUE4Y3RkZFh0cks0b3lHb2VUVzRWUEZtZGZOWVhGZWwwNHNz?=
 =?utf-8?B?MXcrOGErMldud0srdG5JdVd1aDg2Mk1lL1VzMys1ODhzYU1rdXV2a2pUR01l?=
 =?utf-8?B?QnhmUXQrRjhpVVd1VnJ1NDNBaTFsK2R2cnJ1WFlBWmRvMjU4dkFSR3FISHh5?=
 =?utf-8?B?Z2lnb3R5bUVtMHlJTlppbzNjLythRWF6SjFIamlYYzFsZXhJZDNwc1duVERF?=
 =?utf-8?B?aG04SDhNZTA2MjladFlBRE84c0k5YlZXTCtZcWZHc0JnVjFPamRrTE9BWFRn?=
 =?utf-8?B?VVA3VW11dG9VZzQ4bTJTTldnRlJEWHA2eHZoRmZUSzZNR0tXNnFWVW9wTERr?=
 =?utf-8?B?UGh3bWFLaGc0MUZzVDh4NnpNZkh5TlkwYWROWnBSNFZod21jL0h4dzJWQnRq?=
 =?utf-8?B?bHp5VHhjdWJ4cDM5K09IM0d1aHFFbWpES2htY2g4R25BNkN0dUVZZVFsbEcw?=
 =?utf-8?B?OXUwTkRSVmFRSUYyM1JaTU8xMGJyR3c3dkxidUtjTERUZDA2T2tVVGMyMnZs?=
 =?utf-8?B?TGpNTUZTQkdqam56SEM2TFY4a1F0T1luWkRnT3RGSnpTNFdNQWxWMGc5RFJh?=
 =?utf-8?B?TytKSE9jZ0VGTVplR2Y0VE5Ha3BtcHppMUpOOHVJbStmSS8wcG11dUk3cHdq?=
 =?utf-8?B?UGxVV3M5QjE1OU83K3AvSmYraStoRDdUYWhjWFN2OW1VTVRDSnh5TVBmb2FQ?=
 =?utf-8?B?RnJlaExyQTFWS1g3K3Biekc2NWFaTnRTejdHZzhQVHdjVG9Zb3R5RjFJb2Zi?=
 =?utf-8?B?WldiVUdpaW5FWTVQTnVQY2FIVVYxSVpuUVErQzBCd2doUW5MKzBHdXFTOElp?=
 =?utf-8?B?N2p2OGJiVFRnVVprRERLZWZtOUYzS2pSVFg0U2tXMXY4RWRUUHhTV0k1M3Y0?=
 =?utf-8?B?c0lldHN2YllDc3NEclJUNi9QOG8yZ05yblc2UC92YlNLRVlwckZVUzQ4ZFZG?=
 =?utf-8?B?WkVVSExVQ2Y3d0tLZ2Z4OGErV2o4Vmo1Yy9iZktzeDQ5TzZMTldmMVhNbGhn?=
 =?utf-8?B?M1NCREwwT1RLRUw5WDVEVFU1RU1PQU5TdXRtMTB4dnVTRUtZbnYxVVpnbzMv?=
 =?utf-8?B?VDFOeTl4ZWZWRU92aytyUFlRcE1udVZxM04yb01sU3hpNFNMd09zTEpId3F1?=
 =?utf-8?Q?B1CTtfGxJ/3UOp1I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38159758-f5fe-46c0-733d-08de6d7671be
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:14:21.6131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VEv/hozgbHzt3GwZFlVz+xih8N+2Vou9FseK8u4gCcIiTsRRgNFyIb8kc6tzwdU4UxasoCS9zPQYeIbTXSfamuE4tELjKptlp5eemzo9RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:18 +0100]:
> Instead of trying very hard to find the largest fair VRAM (aka LMEM)
> size that could be allocated for VFs on the current tile, pick some
> smaller rounded down to power-of-two value that is more likely to be
> provisioned in the same manner by the other PF instances.
> 
> In some cases, the outcome of above calculation might not be optimal,
> but it's expected that admin will do fine-tuning using sysfs files.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 23af49dc1bfa..43041af81518 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1919,6 +1919,26 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
>  	return fair;
>  }
>  
> +static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	bool admin_only_pf = xe_sriov_pf_admin_only(tile->xe);
> +	u64 usable = xe_vram_region_usable_size(tile->mem.vram);
> +	u64 shareable = ALIGN_DOWN(usable, SZ_1G);
> +	u64 alignment = pf_get_lmem_alignment(gt);
> +	u64 fair;
> +
> +	if (admin_only_pf)
> +		fair = div_u64(shareable, num_vfs);
> +	else
> +		fair = div_u64(shareable, 1 + num_vfs);
> +
> +	if (!admin_only_pf && fair)
> +		fair = rounddown_pow_of_two(fair);
> +
> +	return ALIGN_DOWN(fair, alignment);

I would add a hard guarantee that for admin_only_pf, PF will not be left without a minimum
amount of VRAM.
Currently, under certain conditions, it may run out of VRAM - although this is unlikely.
I have already discussed this with Michal offline and I am leaving it up to him to decide
what to do about it.
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_set_fair_lmem - Provision many VFs with fair LMEM.
>   * @gt: the &xe_gt (can't be media)
> @@ -1932,6 +1952,7 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
>  int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
>  					unsigned int num_vfs)
>  {
> +	u64 profile;
>  	u64 fair;
>  
>  	xe_gt_assert(gt, vfid);
> @@ -1948,6 +1969,12 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
>  	if (!fair)
>  		return -ENOSPC;
>  
> +	profile = pf_profile_fair_lmem(gt, num_vfs);
> +	fair = min(fair, profile);
> +	if (fair < profile)
> +		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
> +				 "VRAM", fair, profile);
> +
>  	return xe_gt_sriov_pf_config_bulk_set_lmem(gt, vfid, num_vfs, fair);
>  }
>  
Apart from what I mentioned earlier, the code is fine for me,
In the worst case (highly unlikely), provisioning will just fail.
So still:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>



> -- 
> 2.47.1
> 

-- 
