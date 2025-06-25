Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E78C7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 12:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123BD10E220;
	Wed, 25 Jun 2025 12:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kv4xQhqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C2610E220
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750854183; x=1782390183;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=uew1zoIlU1Q/neGKBjDwzbHG8MXAfHzQVsnVxIYmT+A=;
 b=kv4xQhqIYTNjitQnyB2d3piaAsgKOn6HxfA6QUbCKTVN/YEYd3jPwQF8
 06WGM+JFbmC9dt+RnGn9qvEre+oodunAF83M9JpkEttrVTP8U8GtP4BEn
 ALRI0at8kui86jj8Ekc7+lDkjbrEE/B59QDMdwJpH9+TysC/qxZPsKDCC
 J+wHYXz+rL1aItk0w15D9ULWSGrj13/uR3RgL9Mat8VzMU7d8epwKUBYR
 Y6nZITSjTWHuRXN30CGRZziHyDAzroA3eSQfGXTdC8lZvUvJSBGTalugx
 k/iZ8F4s+WgzcqsAcMix9dS6QlmGGNdNbQd7sUPRaP3lqF/1Ogb35Idta w==;
X-CSE-ConnectionGUID: uL/mHfpaQ+K1jUntVzZT8w==
X-CSE-MsgGUID: fy2ZXjTZTd+DJKV0q6B0ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="40741631"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="40741631"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:23:03 -0700
X-CSE-ConnectionGUID: nXonBIH9TxenaUV0S9HeCw==
X-CSE-MsgGUID: QolAk2zbRc25jlfLWM+KOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="152694798"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:23:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:23:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 05:23:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:23:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeQOAiwK82fsywPpMShMqNFY3b96O3rAJxljJoYDK5di4bY3MXiFTMyT0T7fc5k3Rv6qmzgrlexJPhFFbw+q7LH3Lf7Py6msp7bwIqNILghZVXMWGVtUpHS1YnH8bWLGdpGXP4do6Z9XLuqn3dT25nLppzEPZyHfo7T/Eilok8prmYlu0AYj6SWhKL4cPg0SWQphIGBXnU3w8dtWiVPF9kjvyfv+EInaH8fNkY42faxrWtkg83HtLCev07Kv5cYCp8VnA8zoExiPEVDzkCoWron+I65DwqLkxtGs7aYoL/1IzgKjprKu1BB0bi5TR4YdY6hTKO847ApppRBB02UU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FvfC/icmb1G4uKx13Uh8SXOGeF9uoZtRsF/oNTGEwo=;
 b=XW7iCY9paWdVFY6TtB+pgobyADszTUsIWEW8PAalU1B5JEhXaj5zVIlNznCqVX83owIWqWSp+goKFPwF0DGNalj5N7nkXXGNPbyr0MACDxFLV45SWKGAhXqEDnIyzMLzt2Oo00jyOtHkZeNEM3o72f2qrz+0v4or+67qaCcEpo4dXu8/phJpKFLTwqIS5IvaYZskjbOXXgdjF3/LKUeoxK1xiAw4Ikn1MMCx9RRiS3O35pLOXrctImwj/ZWg9CWJtYeQu6vvl9kN7Pre9/3HY5mBd49VK0MnN6YWqwJYjJahjkTI7dZccRjYIK0YiZ6S3UL/GCVHogEE8hQrDVUJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 12:22:46 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 12:22:46 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>, Stuart Summers <stuart.summers@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 0/4] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Wed, 25 Jun 2025 14:22:17 +0200
Message-ID: <20250625122221.3061437-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: f58a0c59-2c85-479c-9ddc-08ddb3e2fdc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUpack9YdWIyRUZFRUNET0R3SUtUQm90VmJoZTZIUTBXY0dac3kvYjVJWEN6?=
 =?utf-8?B?blJ6TEt3UzNENTVUUmhodmpvRVBJNkpEdlhtelNLWkQzKzVGVzkzNm9Fc1g0?=
 =?utf-8?B?T2NuMWUxekljR0UzU0czK3J2SjR3TWZ2STZUYkg4cWx3bE4xVnpxZnN2UlpO?=
 =?utf-8?B?eTAzcWJoUWo5VjlYTjA1alZYZkJhdytuYmVualY1SXJGbEc3c2FuVnFmaklT?=
 =?utf-8?B?Q3ZSSlgwNU1SS3FZMStUc1VQUk9zeXJOZnlrdi9qWkJ5dEdIbTB3RENWSjNw?=
 =?utf-8?B?Qm02NDVvK1VFZ20rRElpTVJpUldiR0JYQnVRWUE2WVNGNXdDc2R3QUlFcEhF?=
 =?utf-8?B?TmMvMTQ4VmRNem5RdnZESE05MTVwQW40eGEwaklzMmE0eFJ2MWg0MCtMeFF5?=
 =?utf-8?B?aHB4Y3BuVFRsWnBWR3p2Zkx2MEd6bFZPbFM1b042L1puaEpFTzJRVmlSL2RP?=
 =?utf-8?B?cytEcHdodW5XRzhnc1JLR2hZb1Q0UEd6K2QzTjZ1TlIvejMzVHlKajYwbDln?=
 =?utf-8?B?QnAyekUvblhkb3h0QVI0YndTMEQ3U2g3OCtXMDk0WHBTWnFhZkJHc1NJekUv?=
 =?utf-8?B?eEJISitXT3ZNL2VmMHhtdmd5YytxOWdOczVqU3J4dTRtZDZKZ1djRWRjbUlT?=
 =?utf-8?B?RXVSNjhXL2k5ZUtDa3RhQVZXQTRTTzV5OGZrSXp1UmFRWTg5K2UxV1ZtUWRJ?=
 =?utf-8?B?QS8zakV0emhMU05UZmVEMGhWT2FpYXBqOUFrT2VxWlhMSmQ3SVI0S09mNG5D?=
 =?utf-8?B?WEVxVGYzS01YTUhGUTRVWVVoekQ2VVhhTWc1L0FsdHBLcWl6NDA1bDY4S2JB?=
 =?utf-8?B?TlNnVERZWk5vQlhNTnpIT3NSR2NyaFQyNzdpdTJIejZaZnFWKzNDVjdrMlN4?=
 =?utf-8?B?TnpPNDVaWWF2YmhkT3lDTlREcUxMT3FvbzR1YUJiNXhzZFozRTFUa2dkbUxY?=
 =?utf-8?B?ZjJQcUQrTDZPUVpUdGdSbG5rZkszZkUvbm55d0w4Y1cvWmc0cUtNbDAxWXl4?=
 =?utf-8?B?cW5QQlpEWEozaGJQV3ordkR0dm12RXJBU0NuYVdvYWVmZGdLeVg1d1E5SlZ6?=
 =?utf-8?B?eVVsMFpsK1RieU85TWh0STlyNjN2Z0NaNW41c3ZxUUw5Y0hLSTZTVVN4UEFY?=
 =?utf-8?B?cUJnT2tqQUNuaUsyT3NYUm04OTF2b29IVXlsUGpnVEZTS0RLTUwvdlhYUGZM?=
 =?utf-8?B?d2MyS24wY3FCQUQ2bEgrOVdCaHA4UWFlOHN5cUJyWGhpbFVnaDJZU0JpUDV1?=
 =?utf-8?B?R3dwclozaUxFSmNnL0g1S1FQVEVPZitqako2b0lpSWZBUGVmbGozWDZvVmtv?=
 =?utf-8?B?bTd4MUV6eXk2Y1d4WjMxdkFxUk9sNlN3dVp4d1FpUU4wODBXbmYxSmJlZU1a?=
 =?utf-8?B?OWRKTTJUOGd2VnFhcjliY09aUkwybWIrWUc1d2dxRjMyVFhwWEZrb2VTdEJX?=
 =?utf-8?B?THRKcHcram90bXlVQlM0ajRUdVlnY3J3NUhLcWt0TGM3NU8zcTVadXcrMlM3?=
 =?utf-8?B?RkVxZDZQTnlscUxpUzJsUzVOdHdaSlFBUU9RZTF3UERkOFJKeVhScXFyenJh?=
 =?utf-8?B?U0xySEhibmREVzJKdVVnTDBVeUVVODhEUVhNZGlKQy9ENU04RkwzMHQwMnFm?=
 =?utf-8?B?SGR6V0ZhRW1jcFJDMTJwUlJxbjRmUGJUUklhZDlXblplaVI5RnNZc2NYcUtU?=
 =?utf-8?B?T2RIZzBtV3V4OHZYQkhhN0RCZHllZlRjNk5jSWJrdCsvWWxhZDBxUmdzd0th?=
 =?utf-8?B?ZjEvcUNQZEloOE9oK1I5MHVoZGRvTGExRmc5VkVBdGRpVm1vRG9Mc1c1NjJu?=
 =?utf-8?B?V2xObktaM2lxczhreEhkK1NtV08vSytVOHk2UitkNXE0UXNZaGlqMytWOHhI?=
 =?utf-8?B?TFZPaG1ObCtnd0xCT2tGZmI1UUZMVXVNYndIKzRWbHZDcGZaK1Z6VFc0dUZt?=
 =?utf-8?Q?E5MPeXzNAlM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkU5eUNiWWs0NWZrMGtUeHBUVFF0czgyQ3F0UG5keHpheEtSS2hrL1BHR0w1?=
 =?utf-8?B?S2pXN01KOHFKYVhxZFA0c28vU2dXejY3N1NsSjhrY1JENC9TaXg5OTlOOUZ1?=
 =?utf-8?B?aGFMU2VkS1M2QWpZaG5RWE1MQVI1SE9qWGc5d2tYclRJVnJGSlJ4M1JmdWQy?=
 =?utf-8?B?SGpGcEo2Mzh1dmRONlVhWHdGTWtlSXFIUW0wTG5yZU9tSUo5amV2UkVXaGNt?=
 =?utf-8?B?QjVNUGYvMDlsSUt6TnkvMlJDRzZIUUdzaSt3QVFZcllEbjhTb1RrTnovb0Fu?=
 =?utf-8?B?QXA4aE54ZVpHSEtoQ0ZHemQwS05ZMjdzV0dOL2djUm9BVlNDNEVPM3FiNEd5?=
 =?utf-8?B?Q21nVG1ZejdqSEFvbndwTU1wVlk1ckhKMUZCck1sZkZmRFlhSkdCWXpKQkk0?=
 =?utf-8?B?QzNOOTQwNEtzRGhTQzhZamVTbkQwWm5sWENlZ20xd2xmMFFUSnN2YlRMYU5s?=
 =?utf-8?B?M3FtSERLUWlnd2ZaMGJGdE9MUTcwMHdJYWhPSkJmMEpMSEZieTYvaStucVMz?=
 =?utf-8?B?dDZRNlFnQWFFZmZtN3drQ29tOUp4eTYya2dYaXgwMlNSM3RZV2lZU2t1clpp?=
 =?utf-8?B?N3I0YzlNRlVGRFhhRzFXS3dBQUJRN2tab05UWFhaVk5hNnpRa1Y4MG9TdG5V?=
 =?utf-8?B?bk5sWHBlTzl1N2g0T3IyWXhZR2dKajdIcmJCbEdVbE5yakxKeldpZ08xRTJI?=
 =?utf-8?B?QzlWSHdSTTUxcDViY05NOTZ2elB4cXgzbk9qQ1U0VUtUV0w0VEtPb0tRaWRw?=
 =?utf-8?B?YjVpNGtJRmU4R0ErMlkvcjFVS3NxSzZFY2ZYMllXOUhydE1TUFBPUUJocXpM?=
 =?utf-8?B?SytUOHhKakJsZDZQRmU3WUxrV3hodjBIUlZVU0ZPRFZEcGc5U2NvVWZGNHRF?=
 =?utf-8?B?RHc4Mys3RFJOc21tNEhBdi9wT3JDWjg4aTRqZHBtT2RLaXpsNUZXZGdIakFu?=
 =?utf-8?B?SWJQRnM3TjhXQnZZc0JCY2s2STlIb3FCUUNZb2QzTFhpL1d3MjhBMTBTd3Vm?=
 =?utf-8?B?REZNZytUMnZxRnptM21icnNmT2tuMENsZUl1bFpyL2JoUTZKbGVPNkxBYU5i?=
 =?utf-8?B?OS9IVUxNRnVWUzQ1RVdzbi9xNWM0V1JFc0ovRER4R3l2UzJmOXZpSHdWOTJJ?=
 =?utf-8?B?UFBEcEhidW0yalZSOW16b0NyU0U2UDFwN21vZU1Hd1dXc0R0ODlCRkJMa2dm?=
 =?utf-8?B?ZUVObCs2SjU1dFJWR2UxSjZTbm95Q3ZqMTNGaE1uY0w2Q254c3ZHV0FSZGZa?=
 =?utf-8?B?V2lxSTA0S2NETkRXSllJTXJ1Sy9FOXFKYUllM3c2K0RRR241SElOa0Z0OHR6?=
 =?utf-8?B?Q0dPQWFOOVlWRE9kWTB3ajB4dlJQcCtJT1huV3lOSGI3QVJ6NXk2R1Z4RG51?=
 =?utf-8?B?Nk4yYXdSbE9HZlFVRFJJaUF6TmVENmY4cUZlTXpqaU1QbEdYSk1FQXJLRGwx?=
 =?utf-8?B?YzZNUCtCanVDT3FNckoxbHhoNi8wR1NTUGpCRjlPUDQvM3JqMmJDQTdBVGpS?=
 =?utf-8?B?UlNOSWYwNlNsblpySHJkV0NPbE80WG9HR0VLUzVJa3YzSEFLY1Z5Yisrd2RR?=
 =?utf-8?B?Szd6SHpzNlFaRDF2dU1tZFZicTRCckxPUVA4aEZzK2ozazk1V3RrUEVWVTNa?=
 =?utf-8?B?bDVHQ3RyOGQxYXpYc2lWQmo4VDBlU2RPR1gzbk1JWWp5MTZjRWFVRU9TdlFu?=
 =?utf-8?B?eEJnd2o0MVJHVFZmWm9lUUdnbHlGbHJ2VGM5U04wSG9zM0J4MDM3cmhINERQ?=
 =?utf-8?B?aVRFUEM1VFFpcmkyNEwweGxTdFRMeEFGSXZ6OXRaUUJMbGpzR2V0R0lmaXRq?=
 =?utf-8?B?bU1qUzZaOExRZEkvb0tGVlltVlNyTGNVQUM4OUZ1RlZMSEFhTVRrMHBPNm9O?=
 =?utf-8?B?bnlwQ0lTVk1kbDRnMVhnRDBadUx4UjIwaW5VYVlmaXcxaHFGdGovRkZUdGoz?=
 =?utf-8?B?UkkxcCsxUE5ydWJabTVjb2RpSURHSG1zRU1reVkvK25iRHd1SXJMQVk4ZnZn?=
 =?utf-8?B?Z3JGY2Z0NmlWa0tmcWlvcE9ML1BLSGh5MUl3TkpjeDV4RVdCMTIyN3JEa0xm?=
 =?utf-8?B?QW45WWxGYWZBUzNOeFhaMmpJQnpHUWd6ZDJLYk9OZzUwVURQRUl2clQ0ZzNI?=
 =?utf-8?B?WmJma0psbzBCRndlU21YanZQR1BRTkVTaFplbVZZVnBuem4wWTBlNzNzRmNw?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f58a0c59-2c85-479c-9ddc-08ddb3e2fdc1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:22:45.9477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpTwUuo3HbtIJZRdKAUvTuAZnkmKwUpdMqURVrYtUKWsHnr316AN/E2kmkhdssHQT4BwLCuh36XzwxIAMm3s03EyZCXrX+lZyj2V6qNcycU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

As a follow-up to the earlier VRAM region cleanups, this patch series
focuses on further improving the flexibility and clarity of
the Xe driver's VRAM management.

This series focuses on preparing the VRAM region handling code for future
platforms, where a more dynamic representation of device and tile VRAM
regions will be required. Static allocation of these structures is replaced
with dynamic allocation to increase flexibility and improve maintainability.
Additionally, the initialization logic for device-wide and tile-local VRAM
regions is unified, replacing the previously separate code paths. This
simplification improves code clarity and facilitates future extensions
involving additional VRAM region types.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.
v4:
- add new patch "Use devm_ioremap_wc for VRAM mapping and drop manual
  unmap" (Matthew)
- add new patch "Move struct xe_vram_region to a dedicated header" (Jani)
- fix null pointer dereference in xe_assert when VRAM region for tile
  hasn't been initialized (Michal)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Piotr Piórkowski (4):
  drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Move struct xe_vram_region to a dedicated header
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  20 +++
 drivers/gpu/drm/xe/xe_device_types.h          |  61 +------
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  19 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   5 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  17 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  58 ++++---
 drivers/gpu/drm/xe/xe_tile.h                  |   2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   7 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  19 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 163 +++++++++++-------
 drivers/gpu/drm/xe/xe_vram.h                  |   5 +
 drivers/gpu/drm/xe/xe_vram_types.h            |  78 +++++++++
 20 files changed, 308 insertions(+), 180 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

-- 
2.34.1

