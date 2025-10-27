Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE89BCCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 10:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9245889EF7;
	Mon, 27 Oct 2025 10:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljnCkkYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAD510E43A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761561123; x=1793097123;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QjCLFsEEs95bBDtrkEEOvLPGO7fVvE1oJ0GTwt0eKhw=;
 b=ljnCkkYUwrYs4jbzsSEAQpRJjvRY5K1kWt9X1G7TFBi2W+iH4joK8sV/
 B/ixP3HK0qO939xZKOvodPiSqaMc2+k4aMfUUu84XaXXxHY/l3zg81MPy
 gEwqqkwcfGZEmH9uaeWtOpG3F9Fe3jYFPkpt/UlH0mmfTQIOIOYHu+KNO
 ok8sJNmjEr61Rq2Xs6pqS5UnGG4vM2yeS8E4Y60kdLhPuxY4Os0/AI/R9
 7rhomSrmo0KrYT8pOiImRVULQFQsrGu4Zwi32OIEiseRezW62iwuBIFmF
 TgyhQch4evkVxQb2oLkkGT4XjDO75g1B8/j1a1YGQfImPGj48AXewS7P4 Q==;
X-CSE-ConnectionGUID: TOYl/nFJRM2olKoqdRI/mw==
X-CSE-MsgGUID: +wTzH5lbTgGC/tC4IIvocg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67501600"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="67501600"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 03:32:03 -0700
X-CSE-ConnectionGUID: hFUB1v5rR7Ctu2XYLkA1BQ==
X-CSE-MsgGUID: bK8hQcdYRXqJeSxV4K4rYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="189323105"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 03:32:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 03:32:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 03:32:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 03:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIMYuELxWZU3Pd2vrZSSSnFfig/fdyh8DkCKNtFrRexH2P7NAPvaHxOBp9T8FuSdiOcdiKYGwkj9FoDee4NLO+qBQKGlV4WBn5GacGIHhBbPVsJvu5e9T114f+meRhXoBFbyzEr444cBM2DhB3rv0g2B6WEUgfFjTqG5Bme+vUv734WqgHAsyi2AT1Ft2Jb5QwHQ/UcYpWBzj+BnnF5mwx8N0h+fphRL8qdNEqphqf3dND38E+EkKQLEPo749l1YRcD3Lp0tpun84ittm14uauXxBJ2C01qMoeyJiDyJBjxAnVHto2MjCn2bjXEQrxib/aQ1bCbHcwEBqrU2i/GNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uX+A+uIyzvxQaBLe8MKSDr638JYiU/MWsi4+iMlaDE=;
 b=rQ/Lm03f0rjNC1VClJDBD5v7a8lLn6aquy/4dK7zvFWl2w9FD+FM1GP3Khj1a0kIUybKklwFPrMuWw8jtjdb5qKwtwur0yjr7GiI8S172FNPNtqi4zMVrXB16WRdqef52hyxN6TTdteyJX5mSASmZspak3t/JCfMxRuhYVhr+dIW4vBvaCkGo384gl66/3RyFnBekOODBl3MU81n9GEQB0vkrmraOpipTPnGfX1+C8bICoTcnSD9YyXWrLvcgD6qwrmjiI0PXMHPAKG8HHPcaJ9YB84YhnjBetiyzUZHw6kZkRwXvsWcLd1f3A542MfGtuqzwE68a5gBZBj7Zgub2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB6428.namprd11.prod.outlook.com (2603:10b6:510:1f4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 10:31:58 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 10:31:58 +0000
Date: Mon, 27 Oct 2025 11:31:55 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Fix VF FLR synchronization between all GTs
Message-ID: <20251027103155.726gxggfkvilfiwd@intel.com>
References: <20251025124906.5264-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025124906.5264-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::37) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b76e3c4-f20e-441b-6c38-08de15440ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0NOTUJKMXVhS0Fpd3FOaENqa0RrZGExQ0lLMzRoQmFCamNaMkJRcSs5WnV6?=
 =?utf-8?B?anYyamREUUFzd2QrUGVUVFdTbVNpelRtVGVuRWtMamxxNjJpOERMYXZEcWVv?=
 =?utf-8?B?V2gzTXFhVGtLY0ltUDExZWx0SExvSEorc3JJNDIzTDIxV2NLbldwYXlYTEx3?=
 =?utf-8?B?a0cwVDJnWktQb1BTSTVnVXgySUlwcW1JWExyVHBCd040Vkp3UDh1cHM3TVlY?=
 =?utf-8?B?SVhiNDZmeFRpMVc4dHlTcFA0NVVjYmtHS0pXSUV1T0dZbFR3QWZ1aDllRGtR?=
 =?utf-8?B?cnEvYmNxSlVvYjhJRjArWUF5Ynl2amFWWG1GTWFoS0doN25IWjJ4L2JkUmc1?=
 =?utf-8?B?N0VTRGhTdW1XQU84cnd6K0M2cWFjbHhWTDRHelp5WlRWN3lhbkJtQzJKQ2Z6?=
 =?utf-8?B?U3FQNkQ0QXIra3Nma2FVYjh2VHdTUG1VZjJPeUdCZFN3dm1WRHhDKzN0M203?=
 =?utf-8?B?M3J3cWI1cTNoTFN4Uy85VlpwTnpBQ2dOU1Z1VVpoNG1xQjB2cXFEVlVWakh4?=
 =?utf-8?B?UWJiUmxURFFHVDNrR2Z6ejczWFpkLzhRYzcya0tBaGFmK29SelpWQkxwY3Jk?=
 =?utf-8?B?bFdwZ3VTSFY1ZkxVNWJmczZHYjNhNlJackpzRWJkQUE3cVNPV1JkTytrb1BL?=
 =?utf-8?B?UmEyRXhSK2dtdk1Zb0pwd1RGMmxQemJ4Y2hrR0ZVTERZOUg0RVBnLzlCOXVH?=
 =?utf-8?B?SWlUVFJmS1NsQnBQLytkRzkxTytKckFLS2tPRklDVUE2bVZLT3ZaODQwRTA2?=
 =?utf-8?B?SUMzQUhleGxyTlB1bjc2cGhwczFoSXd6SzZnRTdXY2ZDZ3BjeTdFVjJmMFY5?=
 =?utf-8?B?YTJ2a3B5S2szVSt0NmpUNFl6TDhteE9hS1c5MjhWb0c1dmRRc2wzdDdlNGFw?=
 =?utf-8?B?YVI5RWFvNjIxZDFSWU5aWXUzTlpqS000dVc2V1c3NnBUSEJ3dWNvZURmTWky?=
 =?utf-8?B?aHJzclFWOHFqVmtwT0VqNXM1b1lLWm4vN1NObUZYKy90em9hYmpRWnFkeUN2?=
 =?utf-8?B?TFFDalJKK3JmZ2FuS2FaU2ZDQ0haa2F3SzFiVE55dkJoV3JWQXV2OXI4OFRQ?=
 =?utf-8?B?dGtYM2R2RFBOWFBXS3J4SWlnWEk1UTcvbnRtUnN1T2g1WXZBUjJmTmZjL291?=
 =?utf-8?B?L0JDOEk1dFhJRnExWG5qampPTnlKdTlISExuYWNYZFYxSUg4QncyUjdsblJT?=
 =?utf-8?B?ZEZzQmN3eUp5eTRCVjZEc0JDa0hKVy9DaHBIMkkyL0dtQ1djckVLT0NlS0Yy?=
 =?utf-8?B?OGk3SkNyOFluTXRzNG9VL3RYdnZ2WVdVVkMzeEdZQ2ZnOEdVd3RWeUx2SytS?=
 =?utf-8?B?aG5MT2JmQ1VvWFVNc09ydXlXeHRkUDRhNEdjRExJc2lubEpEby94N25GZys3?=
 =?utf-8?B?MUF2Rkg5dHpXUHp2NUxUVEEzYmFGVHpaTlpzaXJ6a3FHNFBVV2UraXhySDBh?=
 =?utf-8?B?L2dIa0x1MlNrZFNNcHhMbVV6bWZxT0ZuWlVOdDNnRzNzenNzMXc4RDYrMXZj?=
 =?utf-8?B?MmlFS2JqQ0trV0pINkR2RnljRHhITVlnS0VMMzhTVzdTQVlMRy9nam5KazE1?=
 =?utf-8?B?QWZleGFLWnU5Z3FzN0I4dCt3RWNpWnVkRGxRWnFhM1BWR3BUeS9tSkNaNEk4?=
 =?utf-8?B?RXltc3o0Y0NLaEw3ZERMeDBmZnRUSytHenBFcmQvZWxpdmd2cE1PYTU5SjUy?=
 =?utf-8?B?NUI1T0dZelhxcjlFWjhiRk84Uk5pYXNPWk1MN3UvTis0U0ExbUp6RTFUa2lL?=
 =?utf-8?B?KzlHN1JsTG1nRWNTUjVrek1TbWZQY2gzbFVZelpxTWpCTmhMN2grTXhXYzd3?=
 =?utf-8?B?ZjNqbGpRV0pXU2pRa1B6MWV4a0w3b3p4M1htNjlVamFZN0RVMWs1anlmSmJh?=
 =?utf-8?B?OG94NnF1anVkdmhlNFlyQUZLcFZ3cFZ2b09qNjV3b0hPS3BsRDQzSzVSSG44?=
 =?utf-8?Q?Y9rdagSCtlu8S3PAsRZ7a2t4CnC/rKPB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjByamw5b0NoRXJQeHlWdFBRNmd5TEpQalgvLzZySzRJay84YXQwZFI2WmVQ?=
 =?utf-8?B?NlVNcGNTblVLd2p5OW12RGlRd1ltMXZETzgxelpYQTdvbWJxRFNXM3NRVWEy?=
 =?utf-8?B?US9mT3FpejFaUHcwVkFzejBDVkx6UFA5enRHVThNTWNSWG5PWVlOVTg0eVVO?=
 =?utf-8?B?V0NQQmU3R0sxVjgrSlhOVDRTZmQ5M3RwcjN5eStGMTZZc2JmMXVXOG1VVTAv?=
 =?utf-8?B?cm50UHJqakNxcDZ1eXpuU25aNStDQ3U2WE5uWDlNS05oNEdsUUlYZGNDYmVj?=
 =?utf-8?B?WFlncG5jV0JPc3VTSEJIUWRtMzl1Nk1NZE9LZ2NLWEtjQXRnS0ZzU0FzVERI?=
 =?utf-8?B?aXdCSll5N1N6VkdRVUdyV0pkQ2FKRy9pYlJqOTAwWmoxSTVMQ3FudmtmaElq?=
 =?utf-8?B?cVdQL2lwVnJxOEk4UkFJOFJFWDZFT21UK01vVGJMSTZucGxzemk0WkV6bnJC?=
 =?utf-8?B?aHNETHN4dlBXTzEyZmQ2VHo1SmZ5L1BMcHRIR3dlK2MvVVRrQkZRbDVwZHRx?=
 =?utf-8?B?WFNZUjZvbnBPZW1lcGF1QXdqc0RYcSt6Sm0yVTA3dGhoaWJjNTMzY3RhblBN?=
 =?utf-8?B?R0VtcGIvSGFVbk9OcVNDaHZyYk0wQnFtY1ZSSzhSaFZJRnhxMHUxSEJ2aDV3?=
 =?utf-8?B?OXVQZFFnaEZXN3Z4M0xBeWpGcTlIMm9Nenl1Qm9xTEJhOG9wQ3R6dXQ2TTFK?=
 =?utf-8?B?aDJ5V0JEOFBaY0pMVXZ6UXdnUXdxeDVtZVlYWkw5T2ZwMzdma2MxVnR2TlZI?=
 =?utf-8?B?KzZVU1RlTFpUS0tad1A4OXNMMG43anhGMUZYU0ZQdTdjRFZVR0NaVFQyLzk2?=
 =?utf-8?B?N0NhcDNzUENCZWRiL0RzMHJhNm1GSkRZcFVTQmxwQ3pUR3Q5cGZJNlUzck5Q?=
 =?utf-8?B?N0tMSWlrRnVPUklnWjFCSnpuNkk4QUlSbmJyUDNCZmpHOUw3K2FoQVhsSU5p?=
 =?utf-8?B?NFJNTCt5bUZWbzJHMUM5S1cyQVdzQ3JWRkNOaGhqbyt5NXhIUlc2STREYmdS?=
 =?utf-8?B?OEVud2NNSWdYMzRINGFDL1hkZHo1MXpEVittcWZ0dmRTY3o0MnJhVVZYYWda?=
 =?utf-8?B?ZVhZWFZYSy9qd20rZHZiNzRQQnM1Y3NBbFV0UmQ1TFpNSE96RUVlK2RocUd5?=
 =?utf-8?B?Y2hjV0dIcTFzRWF6YVFlN01aNzJ1RU1TU1hOcjNxMDF5aU9NTkhDMTBOMmdv?=
 =?utf-8?B?Q2NMMmt2b2dJOVlndzJsbzdTYkQ1RlhnWHhwS09KNHc4Y3djekQ5ZmhBNDM2?=
 =?utf-8?B?L3JSZVBTOGowbHA1UFkxeUR5MFphNDUyK0ZRTVRvdWZBNzkya2RPUjd3ajN2?=
 =?utf-8?B?RXBuc29SOTQxREtsOWhEbzZqTzlmc2tPWWR3akswbUZEVmZvZGFKMzVyR1hv?=
 =?utf-8?B?QjVJMmVrUTNGKy9wMHd3eERnUlJwaU0rY09vYVNoV3NqalRLcDhLODBlaHZG?=
 =?utf-8?B?dGtvZEp6YUhCTzJSWDZGZG9QTWV1SE1yN1N2V1ZFSWtUSUdOLzBIUWdjMFdo?=
 =?utf-8?B?aWdBUGluRk14Z2NuRkpUc2FqVllQR25lenNHUEJudndzblhkWFFsL0VxRUo2?=
 =?utf-8?B?QkJQd0kxTUVQRlZWYklYMWcwL0hDaEZXRUdhTm5EMmNuRjRobzYrSEI0REhq?=
 =?utf-8?B?dVE2VlJ0Mi9QRmZONFVNR05nMGI2SXRDS2tkZnVlTDFuNCs2Nm14Qi9tYUw1?=
 =?utf-8?B?T050YkRJMnJLRFBGRXZMRU9LSGpaeWN6dlRaWnBNRnRBME9jS0poUDUvQ2RS?=
 =?utf-8?B?K1VSL3ZSb04xbWZ6Z2tvM0Jnb3JmOWV1L3duTFZtcWlReHlZbmZjU01WdEMz?=
 =?utf-8?B?L09Zc2IwU3pXNWI5SE9OczNZalVySkZXWE9uV3ByR0pibnQ5OGxOM3lCSjcr?=
 =?utf-8?B?RU9DYTNydHV6cEFJT1RabWgveFNYNVZ6bmswYWQ5Z2dibVFLa25FTjA2QzFH?=
 =?utf-8?B?REd6aDV6cWwzNnRpVHk1K1FyUE9CY3ErRGF6Rkl0Z1hKYmQwbHVvcWdxM0Z6?=
 =?utf-8?B?bUxkb3pFanBXWDBFZEpUcE0xOFJXL1JoZGtqMnpwQkkwRFdzUml1K0R4L1hm?=
 =?utf-8?B?UU96bUxYTkJDQTNvdnplT21lWXFkZkZ0NTlMdmdMMTFXSzhGUTcweEFoaUYz?=
 =?utf-8?B?VXVBejJEWUovQ1VRT3AwRjA0eVRwR0RBQnVJVEpTS0hCd1hBTGN5VFFPY0kx?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b76e3c4-f20e-441b-6c38-08de15440ecb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 10:31:58.5442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMFnKcAUdI8kkf742yX+YHF81OhjWsf0/jS9ZQgToM7y4IvXxC98m/weNuQa1wkjKDnEJYeKiOnfKCLFwWMmrk/5pTcOjt91TAQVP7fj0bY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6428
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on sob [2025-paź-25 14:49:05 +0200]:
> If subsequent VF FLR request is triggered when previous VF FLR
> sequence is still being processed, we ignore it as not needed.
> 
> But in case of the multi-GT platforms, one GT may already finish
> its VF FLR processing and will start a new sequence, which includes
> new cross-GT synchronization point.  However, since other GT may
> be still busy with post-sync cleanup steps, this will put on hold
> this new FLR sequence, which might never finish due to lack of any
> future synchronization checkouts.
> 
> Add additional cross-GT FLR synchronization point when each GT
> ends processing its own FLR sequence.  This should also help to
> cover the case when one GT fails FLR processing before reaching
> the first synchronization point.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6287
> Fixes: 2a8fcf7cc950 ("drm/xe/pf: Synchronize VF FLR between all GTs")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 2e6bd3d1fe1d..9de05db1f090 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -997,6 +997,8 @@ static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid)
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WAIT_GUC);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SEND_START);
> +
> +		xe_sriov_pf_control_sync_flr(gt_to_xe(gt), vfid);
>  	}
>  }

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.47.1
> 

-- 
