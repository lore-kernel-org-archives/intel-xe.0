Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA95BC53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 19:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A974C10E9D8;
	Tue, 28 Jul 2026 19:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCVvYsfk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF8810E9D8
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 19:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785265485; x=1816801485;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OZmZoQHlJqw+apwntrwrByqb3b0hkP8e/a8ZI9oplwA=;
 b=HCVvYsfk4P2oH0eLLiXH5RK6IM9+77f+plGW7+zBPEZ5Bcz4YOe6a0QL
 V1QTlkUeN8aBnu3lmTwKkgtVLvObkqrJpda7J7mnCP1cDmjI468Hs5tdr
 kIn6t3QLJMhPnAG8HBmMhDyGTAIOTUmY6RIEm02nbvJMKz69PyDdisPaS
 ZbeugtPJydz9txhF0aI8Q0dMCY7UfRjo9d6JLKjLcREF8kxCvpd0+MOfC
 8RkzPNFQfJh3lJcP98tdb4F9Nw0+2aQ38TX+8aupif9s3AYZUw+K4upIt
 HZ7dt581lbtReVfcwkM6TbHRj3VjTS92ryv4yHp8YNMpCCiaLGRI0Pk2q g==;
X-CSE-ConnectionGUID: 3bGDUptpQw+8MViahR5PAQ==
X-CSE-MsgGUID: xB9bThEpQNC8qOBbN977EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88403203"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="88403203"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 12:04:44 -0700
X-CSE-ConnectionGUID: B/s+ljlsRKuZz0vS3zi1pQ==
X-CSE-MsgGUID: yGh9DEHeRKG2FmKiUU1/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="259224833"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 12:04:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:04:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 12:04:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:04:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaGVpC3kPj7rzlr82M9+m6jUTeziRyJn7Elm2A8SJGJshBH/S+u0lhrM0uIwwiY0WIDtm6cLyOdxUrOpkpMlSFEApSWTdDFicfJ0xH+R10fGs0bPpVAtRPkA7VFi8USKwxi+9tx/z/G047aE9XJRBq/s9UbSr8Gjj+apfUCA1WDDycQnZi4NAAXFD1P82HY4ceY2PJGUt1ONyvX2y2UngWsl0NG4kCuUEwZncvR5SmFq87FOWFwt7DDZlZu0O7GIWmV6iD9Y6vWy2wRigb1rHxKCfojfnbVjgP5ukhqo2GE5b6gHya76RoPmIY1H625aVytOtW1/Lfkm5uYiV8eP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XITB/suzbHr4fuTlxM97/oxMWlXpASVFGNZ67i6EKkc=;
 b=dlRZwQmpxpNYj7Vp0VtL3aThdv+i2H9z+COP4uksp+wbdgPm0BpW1aKwq5mIv0mH/yGnimr1nA9zTgmA52vzWmD5YzHPUZexuMoHgQDyiJOIDp87qaRXkf3TU4gCG4qmxRNjSxhJO6427W9vBR4ckiOqqz51om9Tz6DhQ9g2QZpK6z/S2lAukup+qBYg5m9zcAsNpVXSL8yRhqkDYQSh6fEf/eHH75xWeVcZHMpVCwYRwHAiNIt5hgYFal28dcqUOgoxaQy++GYxtAhm6BT5PwN6G+ClDIhkT9AdHmQgzLsKHwIqSrLUI1NfCMEPZE2nU9gyCBMVuenWAV/PADnIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN6PR11MB8218.namprd11.prod.outlook.com (2603:10b6:208:47c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 19:04:40 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 19:04:40 +0000
Date: Tue, 28 Jul 2026 15:04:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 01/19] drm/xe/log: Add structured SIGID error logging
 infrastructure
Message-ID: <amj9QjKb_On4LSnu@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-2-michal.wajdeczko@intel.com>
 <a7e82806-4bc0-4aca-b11b-7492fc07475e@linux.intel.com>
 <66d0111b-f0a3-428b-b235-37e87515912e@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66d0111b-f0a3-428b-b235-37e87515912e@intel.com>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN6PR11MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: e30bc425-a72c-43e4-6cb4-08deecdb134b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|5023799004|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 6oY6dSiJGK6hLTmAglh4XV2lrJaXW/aD8f73nq1wy7k1wooUweBMQ3Jfu32/+umrSFbBnEywMJaBMoA42CnSb9lXfm0tPAQnF/uq3Yi4qQf2ZF35A4y0a4cZlh6SDPIH6xBltgnGBqeqNe7aJ6snSnMLfzdeinUVFAxjZSwmm6up+dO4VkmnsRAeR11Ch5QMTOvEc9ZMQc8N9C+6HHugKaAKqAsG0kWmTRsJZ6tr2BAmczaBqJf0/vpDK1tB0Fc78+i24cCI6+ZnschKM3ZKpY1rLQbXfkQ0YhGRfAVS4WXJpLZCiDKDWcp8uDKbeIf4ZzZF4wxoCsUKXs0r9VkT1Z13DIizJOmJpSRZQtd9/hPX0MiVZx0Ex0O+IKVIIbg3MB5yATP3cxEI10EbQToYv6ps+a7TTbpftKub6NX9+PEUB6TXtXEEzchfHmzk2eQPHHk43+Et8pWuJu13A0v9fbxpQQGmSNzBH7w1UuDLY227L9HGE4inrpd/wOLHEq26f+c/q4PCZNAHuqh+VSxKQ7r70CEwpotVlGYGBRY/ht+tFE1Fck24uOE02yGmAQ4M1gTd5C6eW1BwLqBAc4w9Dv3uh/oXCi/Ha6ZoBX+VXpAohOlx4jHmJw1LNNqUxaoYPCy7PI79kPzTMWOmOg8BCdsDpEIuQjhAsUAxzytpSRo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(5023799004)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d/83nBy4bKsrGfu0lI/7Vmcf3x/FInyjonKgZZTr97Fkb8sDhPTeJdCDfe?=
 =?iso-8859-1?Q?88Y04wMYpGphaJpwFs07wuAaZx9jfidsg4iHR0ZS4jLWvkezqUABECMnJt?=
 =?iso-8859-1?Q?DQcKnlu63uWYsq0I13JZ95d8ae7g4SLopk2AWliu+VkqHbMSV6ybV304Jl?=
 =?iso-8859-1?Q?GOaQhaLQSizxqxnmMtPfmZk6zwzd8PG9SLo9qCxbu11lvvk1C+jGtCd0yY?=
 =?iso-8859-1?Q?L7tYfcmPg1wcKgTlKxpL1XLd3Oo3mhjEgPQOSkn0hqonCZTzWlwg0bN6bI?=
 =?iso-8859-1?Q?jNoeQKxWblm69s9DTtE0j8yb589JOUhk2L1EaoQ1PM8h7lGlhBeiEVMGaM?=
 =?iso-8859-1?Q?WX1nljt4e48TdFvyAgKq3tnVIiAPqxdRy2n72kKDorh3pQnOMKrBowS5vp?=
 =?iso-8859-1?Q?nB1t1vsfyKYiaevmqr72gUL/6JNCQ0w9hkuInpOd/umi8pQa5W9AEH30E4?=
 =?iso-8859-1?Q?mlDxMVYr2/9uXMrwJE0gM3dCLh2sJqpfH1jVPKV4w2Kml+5jpaaKnuDirg?=
 =?iso-8859-1?Q?8leUnfO+EQCEdcnz6biiYD/NRq1LaZ7lZBc9O/aNyqMeGUmOhutUsFXDVn?=
 =?iso-8859-1?Q?H5uZXuGxhCpi+38QmZHgeVXf9qo6xUGJRN3LXdywjc/gL5V0GuSmtw0iQQ?=
 =?iso-8859-1?Q?tsEnfiq/9m4so74/ikAC28bfUhGyWeWA9XBmA1fz2GhPo0/JvKCAAQqeQY?=
 =?iso-8859-1?Q?7qM86pRZ56SKxqh0G/8c949GHN2Ty0IwoeIyDFIVyTx2Uzm7nutjPsXZlq?=
 =?iso-8859-1?Q?ynmMONsImr2o9tV84gNjEe+XuQBkruuEZCXFi4IOUjNZczGMqx6DnNHQMN?=
 =?iso-8859-1?Q?MPEDqjsPMp1GK1GDcy83jKO1mHm6TCLjigu1DxRsTkcVS2nY9egCLpQPe0?=
 =?iso-8859-1?Q?tLrqHCQv3R6O8h9WUAHl6LiO/nWP2p7lZlOs/OkzGtXWVvJ+fjCWfmGjrq?=
 =?iso-8859-1?Q?QLlag5/MvmSJKYME6SMT09hTQ3eGtXKoDrMFUM7w6w/8aKjzxZnTzIW3Ay?=
 =?iso-8859-1?Q?zrgRYyhTCcH/QX3lsRiHOZTP8hKsNxL+0O+6Kb6xpQ6wA0xq45/ljQ/f+x?=
 =?iso-8859-1?Q?hVKp9WQIdsLgyg3Nu3+0cMu5b1MLNAF05la3Z5pct/rPicIOwbm9YUGuqp?=
 =?iso-8859-1?Q?aa6tO8vjyfdgBkizqIUWpPxP3edPwgjtxFTe6RPP0+F7KmUg1RbE3sOf3H?=
 =?iso-8859-1?Q?frRDGikf3BI6fx6TMJ6Gv+Ib3C3KwMg955/5rUHuknQRc5l73oL9H5ldgB?=
 =?iso-8859-1?Q?LziItXHpWpfa7UVCSDZ7NrqxXq91KP9t4f/rWkKfSegf6rkJAbnmRfnMQR?=
 =?iso-8859-1?Q?8ucSmNj03sCLO8hEu9svNO6GDoMTZdhJz8hBGfq0gNXQnmF9C4W9dM84nn?=
 =?iso-8859-1?Q?Yib96RPe2bl9xFVacNb6jxuxLrAQG8rZCgZuMtz6em2XBHBJxnv7XUHpbR?=
 =?iso-8859-1?Q?vxFvKbdWjgdpJQVQ5K0priF4fBlcd+U4sJ5usG8o+o+yhk1dQ7OIVjcI5f?=
 =?iso-8859-1?Q?gRJKyLuQkK8dfdJ989WUW+mEO6fCUGgRyB5tWcsegyowZBxnXlEmGVCepe?=
 =?iso-8859-1?Q?+YKi7Mj4hZ3boNFcRgkdO00S6jGTjap6tz96667Mc7eKAlE66rdr6qmO49?=
 =?iso-8859-1?Q?GSqtm3tfbMW3gf2vXCMT2VWymA51g5PVFzGKr6jnn48Zl87rfjHyhxUCtq?=
 =?iso-8859-1?Q?Ie/M5peNcoySSmuTWFsoRGkJx4/ilhIXgEq3UBr8+VLYqeRo9a8kOSeF4+?=
 =?iso-8859-1?Q?vai9ovUzALxpMI6bzldYtWTw2ua+KLQd9E06AkyM8nz2eKxYWrkxCClXcg?=
 =?iso-8859-1?Q?/LMKJV8Jpw=3D=3D?=
X-Exchange-RoutingPolicyChecked: KyPdnncTZFdqed+cIjMc36+MZZNGI3ZwLYAA+aJ6SBjyH35CZSDy3sAcp06h9iaY43Pmwlt8dXkUxnMSfMZwO1lGkfSK3QzH7e9Prln93ziZrF2eF5wxAs6WeafuJQqRWvPcl5JjDZq/sN5gw4YWc6fER/w5+74BSA1zWcRdDANz0YAbUUTPmX0F1TzJDt3dK1Eq/iHLn/q14qZfwngo4pwDIWx1uVfRgP+ht8aBCbj7avHvJqqx7XFNSf889/pCMyMB/Aipr/nQ/QE9kKCT1R3PbWx1ZIb5u/2saaFYnfV+W7ynPqLFRCUmIWrkY6fjSc0woO0zqV5W2CdNMXpHEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e30bc425-a72c-43e4-6cb4-08deecdb134b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 19:04:40.1647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyyuVyaJDHvE4aLD6LC92YhJohYB04ccTGJVib6yxQBUsoXYcLQ0JIyuAm1gm2udws8RNu2qW4Yx6AQBw/OYQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8218
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

On Fri, Jul 24, 2026 at 04:34:30PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 7/24/2026 3:01 PM, Aravind Iddamsetty wrote:
> > 
> > On 24-07-2026 02:07, Michal Wajdeczko wrote:
> >> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> >>
> >> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> >> strings that have no stable shape. That is readable for a human, but it
> >> gives fleet tooling nothing durable to match on: the wording changes
> >> between releases, lines can be rate-limited or dropped under an error
> >> storm, and there is no consistent way to ask "which recognised fault
> >> just happened?".
> >>
> >> Introduce a signature identifier (SIGID): a small, stable integer that
> >> names one recognised Xe fault situation and serves as the primary handle
> >> for triage. A SIGID maps, through published end-user documentation, to a
> >> description and a recommended action; the driver only has to emit the
> >> right SIGID next to the usual human-readable text.
> >>
> >> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> >> Assisted-by: Copilot:Opus-4.8
> >> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >> Cc: Yoni Levitt <yoni.levitt@intel.com>
> >> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >> Cc: Raag Jadav <raag.jadav@intel.com>
> >> Cc: Riana Tauro <riana.tauro@intel.com>
> >> ---
> >>  Documentation/gpu/xe/index.rst        |   1 +
> >>  Documentation/gpu/xe/xe_sigid.rst     |  14 ++
> >>  drivers/gpu/drm/xe/Makefile           |   1 +
> >>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_log.c           | 132 +++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_log.h           |  20 +++
> >>  6 files changed, 351 insertions(+)
> >>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
> >>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
> >>  create mode 100644 drivers/gpu/drm/xe/xe_log.h
> >>
> >> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> >> index 665c0e93601c..0247a255f7e6 100644
> >> --- a/Documentation/gpu/xe/index.rst
> >> +++ b/Documentation/gpu/xe/index.rst
> >> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
> >>     xe-drm-usage-stats.rst
> >>     xe_configfs
> >>     xe_gt_stats
> >> +   xe_sigid
> >> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> >> new file mode 100644
> >> index 000000000000..45d84a62f185
> >> --- /dev/null
> >> +++ b/Documentation/gpu/xe/xe_sigid.rst
> >> @@ -0,0 +1,14 @@
> >> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +
> >> +========
> >> +Xe SIGID
> >> +========
> >> +
> >> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >> +   :doc: Xe Error Signatures (SIGID)
> >> +
> >> +Signature Identifiers
> >> +=====================
> >> +
> >> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >> +   :internal:
> >> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >> index 67ada1d6c2fb..7ac3954737f9 100644
> >> --- a/drivers/gpu/drm/xe/Makefile
> >> +++ b/drivers/gpu/drm/xe/Makefile
> >> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
> >>  	xe_hw_fence.o \
> >>  	xe_irq.o \
> >>  	xe_late_bind_fw.o \
> >> +	xe_log.o \
> >>  	xe_lrc.o \
> >>  	xe_mem_pool.o \
> >>  	xe_migrate.o \
> >> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >> new file mode 100644
> >> index 000000000000..99717fdf74a6
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >> @@ -0,0 +1,183 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/*
> >> + * Copyright © 2026 Intel Corporation
> >> + */
> >> +
> >> +#ifndef _ABI_XE_SIGID_ABI_H_
> >> +#define _ABI_XE_SIGID_ABI_H_
> >> +
> >> +/**
> >> + * DOC: Xe Error Signatures (SIGID)
> >> + *
> >> + * What SIGID stands for
> >> + * ---------------------
> >> + *
> >> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
> >> + * that names one *recognised Xe fault situation* -- nothing more. It is the
> >> + * primary handle used for triage: a SIGID maps to a human description and a
> >> + * recommended first action. A coarse first-order action is documented in-tree
> >> + * per SIGID (see "First-order action" below) so the id is actionable on its
> >> + * own; published end-user documentation refines it with finer, cross-product
> >> + * detail. The driver's only job is to emit the right SIGID next to the usual
> >> + * human-readable text.
> >> + *
> >> + * Why this exists
> >> + * ---------------
> >> + *
> >> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
> >> + * strings that have no stable shape. That is fine for a human reading dmesg,
> >> + * but it gives fleet tooling nothing durable to match on: the wording changes
> >> + * between releases, lines can be rate-limited or dropped under an error storm,
> >> + * and there is no consistent way to ask "which recognised fault just happened?"
> >> + * A SIGID answers exactly that one question, identically across driver and
> >> + * firmware versions, and (eventually) across other Intel devices in a node.
> >> + *
> >> + * What a SIGID is (and is not)
> >> + * ----------------------------
> >> + *
> >> + * A SIGID names *which situation* is being reported. It deliberately does not
> >> + * encode the detailed reason or the outcome. Those are carried alongside it::
> >> + *
> >> + *   SIGID    -> which recognised situation is being reported
> >> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
> >> + *   errno    -> the failing operation's error, shown with %pe
> >> + *   message  -> free-form human-readable context
> >> + *
> >> + * Severity is independent of the SIGID. The same situation can be reported at
> >> + * different severities depending on the instance and the recovery taken, so a
> >> + * SIGID is never tied to one severity; the reporting site chooses it by calling
> >> + * the matching xe_log_*() helper (see xe_log.h).
> >> + *
> >> + * How to pick a SIGID (the uniqueness rule)
> >> + * -----------------------------------------
> >> + *
> >> + * Pick per *report site*, not per incident. Each site emits the single most
> >> + * specific recognised situation *for that site* -- so the question is never
> >> + * "classify this whole failure", it is "what does this site detect?", which has
> >> + * one answer. A single underlying failure therefore legitimately produces a
> >> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> >> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> >> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> >> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> >> + * follow a fault from origin to final effect; it is not a duplicate.
> >> + *
> >> + * If a site does not match any defined situation, keep using the ordinary
> >> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> >> + * or over-broad classification is harder to retire than a missing one. When a
> >> + * new situation is genuinely worth triaging, add it to the list below.
> >> + *
> >> + * Scope: software-emitted signatures only
> >> + * ---------------------------------------
> >> + *
> >> + * This header enumerates only the situations that the *driver itself* detects
> >> + * and reports from software: probe abort, wedged, survivability, driver-
> >> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> >> + * These are the only values the driver assigns.
> >> + *
> >> + * Signatures that *originate* in firmware or hardware are a different thing:
> >> + * they are produced and identified by the firmware or the hardware itself
> >> + * (e.g. via their own records or error counters), and the driver merely logs
> >> + * them as they are given to us. They are deliberately *not* enumerated here --
> >> + * minting a driver-side id for a firmware/hardware-reported error would only
> >> + * duplicate an identifier the reporting layer already owns. The two
> >> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
> >> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> >> + * observed a firmware problem, not a signature reported by the firmware.
> >> + *
> >> + * Numbering
> >> + * ---------
> >> + *
> >> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> >> + * in the order the situations were introduced. Values are stable: once assigned
> >> + * they are only ever appended, never renumbered or reused.
> >> + *
> >> + * A retired situation is deprecated in place, never re-purposed.
> >> + *
> >> + * First-order action (resolution buckets)
> >> + * ---------------------------------------
> >> + *
> >> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
> >> + * *resolution bucket*: the first thing an operator should do on seeing it. The
> >> + * bucket is a stable, driver-owned hint; external documentation may refine it,
> >> + * but the in-tree value always stands on its own. Every new SIGID must pick a
> >> + * bucket, which forces the question "what should someone do about this?" to be
> >> + * answered up front. The buckets are::
> >> + *
> >> + *   COLLECT  -- capture logs and open a bug report
> >> + *   RETRY    -- transient or already recovered; watch for recurrence
> >> + *   UPDATE   -- a firmware update / flash is required
> >> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
> >> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
> >> + *
> >> + * The bucket is documentation only -- it is recorded per SIGID in the enum
> >> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
> 
> [here]
> 
> >> + *
> >> + * When to use SIGID logging
> >> + * -------------------------
> >> + *
> >> + * The xe_log_*() helpers are for these recognised fault situations only --
> >> + * important, operator-relevant faults and events. They are not a replacement
> >> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
> >> + * using them for ordinary logging would dilute the fault stream. Not every
> >> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
> >> + * a published situation.
> >> + *
> >> + * dmesg vs. the machine record
> >> + * ----------------------------
> >> + *
> >> + * The dmesg line stays close to a normal xe error message so it remains
> >> + * readable for admins; the only stable, machine-matchable token on it is
> >> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
> >> + * text may change freely, and lines may be dropped. The durable record for
> >> + * tooling is the CPER record carrying the same SIGID (generation is a planned
> >> + * follow-up).
> >> + */
> >> +
> >> +/*
> >> + * Top level Intel Error Signature Identifiers.
> >> + */
> >> +#define INTEL_SIGID_INVALID			0
> >> +#define INTEL_SIGID_GPU_START			100
> >> +#define INTEL_SIGID_GPU_END			999
> >> +
> >> +#define INTEL_SIGID_GPU_XE_START		100
> >> +#define INTEL_SIGID_GPU_XE_END			299
> >> +
> >> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
> >> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
> >> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
> >> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
> >> +
> >> +/**
> >> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> >> + * @XE_SIGID_SW: Software component failure. [COLLECT]
> >> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
> >> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
> >> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
> >> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
> >> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
> > 
> > I do not think these first order resolutions can always be reliably
> > interpreted Eg: DEVICE_FW might need RECOVERY and not a RETRY and also
> 
> I assume that in case of SW faults/signatures, actual (or better) resolution could be determined after using the { SIGID, errno } pair for the lookup
> (as we explicitly don't want to use error message for any triage/resolution actions, as it is not considered as stable part of the report)
> 
> so maybe we should just say here that SW SIGIDs represent "areas" of the driver, and if no more specific resolution based on errno is available, the default one could be applied?

Perhaps this is the easiest way out of having to define the recovery
recommendations in here.
Or perhaps we let it explicit in this documentation that these are the overall
SW recommendations from SW viewed cases, but that customers should refer
to other official Intel documentations for final comprehensive list that
includes other FW, HW and other drivers SIG_IDs with a better/proper
and more specific recommendation?!

> 
> > driver cannot conclusively indicate the resolution for HW errors those
> > will be determined by userspace tools/admin based on observed errors.
> 
> for now, this enum just list SW signatures
> 
> and maybe all of these doubts should be discussed [here] ?

Perhaps the mention that I wrote above also ease this need/conflict...
> 
> > 
> >> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
> >> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
> >> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
> >> + *
> >> + * The situations the driver detects and reports in software. Values are
> >> + * numbered sequentially, are only ever appended, and are never renumbered or
> >> + * reused. The tag in brackets is the default resolution bucket (see the `Xe
> >> + * Error Signatures (SIGID)`_ section).
> >> + *
> >> + * Firmware- and hardware-originated signatures are not listed here; they are
> >> + * logged as reported by those layers.
> >> + */
> >> +enum xe_sigid {
> >> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> >> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> >> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> >> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> >> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> >> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> >> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> >> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> >> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> >> +};
> >> +
> >> +#endif
> >> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> >> new file mode 100644
> >> index 000000000000..7ea8d8cde0c1
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_log.c
> >> @@ -0,0 +1,132 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright © 2026 Intel Corporation
> >> + */
> >> +
> >> +#include "xe_log.h"
> >> +#include "xe_printk.h"
> >> +
> >> +static void log_prep_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> >> +			  u32 component, u32 location, const void *data, size_t len,
> >> +			  struct va_format *vaf)
> >> +{
> >> +	/* TODO */
> >> +}
> >> +
> >> +static bool is_hw_sigid(enum xe_sigid sigid)
> >> +{
> >> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> >> +}
> >> +
> >> +static bool is_sev_error(int cper_sev)
> >> +{
> >> +	return cper_sev != CPER_SEV_INFORMATIONAL;
> >> +}
> >> +
> >> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> >> +{
> >> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> >> +}
> >> +
> >> +static const char *log_sev_prefix(int cper_sev)
> >> +{
> >> +	switch (cper_sev) {
> >> +	case CPER_SEV_FATAL:
> >> +		return "FATAL ";
> >> +	case CPER_SEV_RECOVERABLE:
> >> +		return "";
> >> +	case CPER_SEV_CORRECTED:
> >> +		return "CORRECTED ";
> >> +	default:
> >> +		return "";
> >> +	}
> >> +}
> >> +
> >> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> >> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> >> +
> >> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> >> +{
> >> +	if (cper_sev == CPER_SEV_INFORMATIONAL || cper_sev == CPER_SEV_CORRECTED)
> >> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> >> +	else
> >> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> >> +}
> >> +
> >> +static void log_print_dmesg(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> >> +{
> >> +	struct va_format vaf;
> >> +	va_list args;
> >> +
> >> +	va_start(args, fmt);
> >> +	vaf.fmt = fmt;
> >> +	vaf.va = &args;
> >> +
> >> +	log_emit_dmesg(pdev, cper_sev, &vaf);
> >> +
> >> +	va_end(args);
> >> +}
> >> +
> >> +static void log_prep_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> >> +			   const void *data, size_t len, struct va_format *vaf)
> >> +{
> >> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> >> +	const char *sev_prefix = log_sev_prefix(cper_sev);
> >> +
> >> +	if (IS_ERR(data))
> >> +		log_print_dmesg(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> >> +				sigid, sev_prefix, data, hwe_prefix, vaf);
> >> +	else if (data && len)
> >> +		log_print_dmesg(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> >> +				sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> >> +	else
> >> +		log_print_dmesg(pdev, cper_sev, "SIGID=%u %s%s%pV",
> >> +				sigid, sev_prefix, hwe_prefix, vaf);
> >> +}
> >> +
> >> +/**
> >> + * xe_log_emit() - Emit a structured SIGID log entry
> >> + * @pdev: the &pci_dev device
> >> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> >> + * @sigid: signature identifier, see &enum xe_sigid
> >> + * @component: component identifer
> >> + * @location: location details of the @component
> >> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> >> + * @len: length of the @data in bytes, or 0 if not applicable
> >> + * @fmt: printf-style format string
> >> + * @...: format arguments
> >> + *
> >> + * Emits a dmesg line that includes a single stable, machine-matchable token
> >> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> >> + * when @data pointer is set, either the error printed with %pe or a packed hex
> >> + * dump of the @data binary blob. The dmesg line will also include printf-style
> >> + * text message.
> >> + *
> >> + * Note that the full dmesg line, with the free text message, is only a debugging
> >> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> >> + * The durable machine record is the CPER carrying the same SIGID.
> >> + *
> >> + * Note: generation of the CPER record is a planned follow-up.
> >> + *
> >> + * Examples::
> >> + *
> >> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> >> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> >> + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode
> > Severity cannot be optional as its left for interpretation and also for
> > consistency of the prints.

Well, it is consistent enough to me, and even parseable as the latest patch
with the script demonstrate.

> >> + */
> >> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> >> +		 u32 component, u32 location, const void *data, size_t len,
> >> +		 const char *fmt, ...)
> >> +{
> >> +	struct va_format vaf;
> >> +	va_list args;
> >> +
> >> +	va_start(args, fmt);
> >> +	vaf.fmt = fmt;
> >> +	vaf.va = &args;
> >> +
> >> +	log_prep_dmesg(pdev, cper_sev, sigid, data, len, &vaf);
> >> +	log_prep_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> >> +
> >> +	va_end(args);
> >> +}
> >> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> >> new file mode 100644
> >> index 000000000000..d475e816ee0b
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_log.h
> >> @@ -0,0 +1,20 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/*
> >> + * Copyright © 2026 Intel Corporation
> >> + */
> >> +
> >> +#ifndef _XE_LOG_H_
> >> +#define _XE_LOG_H_
> >> +
> >> +#include <linux/cper.h>
> >> +
> >> +#include "abi/xe_sigid_abi.h"
> >> +
> >> +struct pci_dev;
> >> +
> >> +__printf(8, 9)
> >> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> >> +		 u32 component, u32 location, const void *data, size_t len,
> >> +		 const char *fmt, ...);
> >> +
> >> +#endif
> > Thanks,
> > Aravind.
> 
