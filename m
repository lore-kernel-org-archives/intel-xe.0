Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A98CA0EEB
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 00:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62A310E02C;
	Wed, 20 Aug 2025 00:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwVF1mqc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC1610E02C
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 00:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755650410; x=1787186410;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pQzf7HDgNmyH7+ZOZ4I+uvIi2+KBlxFMIvcSZjxDlf8=;
 b=TwVF1mqcYZDHOzdz8EHjDwSfhZ35JugsGVlY1DudTOqhJ+z2es1+RuLB
 HhyuN2JugHRlLqc/dcxVc6KFRt6iF+GcqQgp2NJld7mx3w9vCpM2mq/Hp
 Fq++lOwdW13XIJBAoBVTQ08IBjzvPHWoaIb3/l/zsUSPXHJtC96c2ssMr
 0EZVO7Yr76ei93KmyRs9HCoJPwZ3r/RrPUpsX9G0/HUfHG1ceyPsAtncE
 kqT36ouzK3Clf/fCbm56P4s9J12aUILzTbhrZVZ8iIlV6Fi3kK/W64kA0
 N7juo0IngfZjEdXlmE6lRMEjGxyOCkXjnWXXFymdYfsRRYK91vAzfYuFw A==;
X-CSE-ConnectionGUID: afWb1xvrQ3ORtOtM8SjQww==
X-CSE-MsgGUID: MDjs/YNHQKKzEg3AvrsDJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="60535252"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="60535252"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 17:40:09 -0700
X-CSE-ConnectionGUID: bTm0ggSMQqebUnM0s+GG3A==
X-CSE-MsgGUID: 4ytb3m/7QraZHRjoYAh3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="198979135"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 17:40:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 17:40:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 17:40:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.51)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 17:40:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O98p51s2fvf0SGW21MBpz3rTUl7rLF2Hd7Q9af1hZirz/Xr1ciAJeUUtc86FKUGPMBmRV0b177aS5qzuLGirhOtEmCpC2WoJaIc37Wx4ccRabkKzpYroSrdBymT79wTnRfQlU+Q02I0MB8nJJo8tj4TsgHQqjXR5xTRz0sNvwvq/5Z8XosdXrAu/hm2pCypnlit3xPBoCjhybV4Jzz6UTziGtXC/MAsxLSLv3XeVnSl2+sXF7WFCfELi7lde0TYv7EKY86YeBLUjMgAu08yt77+U43XP9ZmPIvJqWQPKib7m7uKXmynRek86kH1NY4f4PpocjCUhTcVsFckeczx1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apYrlTBflnUTNJHV2B/mQXIrWeEg0IKYb6tuNvp1rYc=;
 b=AUPPqx0nZ41ARGcL81BmtfbBR6tcvs5NDP7jL5gB/j4fDWvB3PfCjgRGL389V39RdMkqEyIbKa7sJuyA1cktCG1pxk2fannSigwtgJej9X30vMj5MieyftXmmaUhzg0ULUU1hVDXHKXjMl6Es6kRzKiJ15QHJc7f8B4wt5hLEgWv2/0B0Uvi6AO67UslP+NvJ/6CHhAwCV6BCx3DpjPBSK+kliBFnoAM/CSr6aEwKH+TTBINsQfFIezOXEzYbEw62EfMyPwdBePs4J24um3D5T2vtPIpWid9NJwSv544sVFSBCHDcR3YBI+yaKPPKUdtGWWd9fZIMnZGjm4svzbq9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 00:40:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 00:40:07 +0000
Date: Tue, 19 Aug 2025 17:40:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe_sync: avoid race during ufence signaling
Message-ID: <aKUZZGMS4WRd4Byc@lstrano-desk.jf.intel.com>
References: <20250819184402.1761459-3-zbigniew.kempczynski@intel.com>
 <20250819184402.1761459-4-zbigniew.kempczynski@intel.com>
 <aKUYOzi09QwH/bgt@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKUYOzi09QwH/bgt@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0247.namprd04.prod.outlook.com
 (2603:10b6:303:88::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a33712-66f6-4685-cd9a-08dddf821c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wlo5SW9WZktzVG96cWZUVjhXVU9VOGtocDJXVjZjb1JoN0FBdXpQc0QrTVU0?=
 =?utf-8?B?Vk1hdUNDK3dqSkNtKzVBUm9MTlN6L0x0OEtVT1NEZVpvWld1UDVxY09TbWxj?=
 =?utf-8?B?U0FhS1BTOFVlU3Evejh5VVlHWHF4L1IxbnF0Y2tRZUl0dXRIazZRTGlTZ3Y2?=
 =?utf-8?B?bGVJRTh4NmNFeitHK0U0YTRHenBVRUhSUWpzNFlOdi8xUVlpTHF2M3JTeG9x?=
 =?utf-8?B?ZTZmbGRBcE1PNkQrM3cxQmZFUmRVRUxVbHBuOHdna1dPMzVWclBGaml3aHVm?=
 =?utf-8?B?eVZmSFpIOC9qWFM4VlpFSHNnNWExQUQ4eS9BdWUzbkxOcUw5VnVmblVObGpn?=
 =?utf-8?B?VVR1VHloU1hJZ2gyWmlnL21MWW4yc2N0cFJtcktFV0kvbjZsMXpCcnJQb2Nj?=
 =?utf-8?B?NGNuckpGSjdiNnhsWmFJaXlQSi8zdFRWbU94dXZ0M1M1L1dIb0tTNzN0V2VY?=
 =?utf-8?B?dUdoOE1HUkRVdGtJSS9WZG5Pd0V4amhobk1hWW9WTHdsZFo3R1B0Qk43OHEz?=
 =?utf-8?B?VjBSTVdEakQvMFlpVi9aTDlVblNSa1N6MXRWckRqUG9QM3ViNC9HcG4rdDhD?=
 =?utf-8?B?YUxQL3RyeU9ZeWJna1FCYWFyTTNtemFjVmRqTnNOK1dDNFNkbTA5a3h4L3l2?=
 =?utf-8?B?YmpLY3dHMFRHTGNZZ1ZpbmpNUUZzWlVMNitTbmxHS0E1T3Q3NXpPaVViV1Mx?=
 =?utf-8?B?anV6REtuSDJBbk14TWVuQnYwN0J0dUNudFBkN1U0WG9CZ1RzVWVZbUxyRU1H?=
 =?utf-8?B?ekZidXRaWG5pSzNmUWdKbkQ0Q296WGJnc0JnbGFIT1NUK0VES2RuQ1pDbEEy?=
 =?utf-8?B?QXM3M0U4ZUo0N0hlWWJGRDVkOVIxZ2FYZzlnanZBNit2S2htZForRkI5cXJp?=
 =?utf-8?B?bzdWRXMyRGFJVk82WUZ0NFFPYVVsM1hqL21RWnpNdUZHNUgvTXpyRmpzYmdq?=
 =?utf-8?B?aE5vN0hyR1o1Z1JGMWQ3Qld5T2RGbHhRbXFmKzlzeTdjdTQwdTRxSDZnRDFN?=
 =?utf-8?B?QVMxd0pwbzN3cjVBOEZWTTVkTklLRGlEZkxNTkF4dXY3Kzh6TzR1ZkRuQ1Jj?=
 =?utf-8?B?NmtsMFMwdlJPbkNxT09IM09ReUxyVTBmd3dCRVQrSHJkaXZGcEV2U0FwT0ll?=
 =?utf-8?B?K3FTb21abWFoaEwxU3BxVkJhdW5hRFZHOWlOVGo0RUZqSiszbmpmYmNicm9P?=
 =?utf-8?B?TjJqZFE0dUJjNE1wbDJ5UnhHbHJGUHYyUVB2OXdXWHNkNWtSSHBteWxxN0li?=
 =?utf-8?B?dEhpWTNta0hOWVVpcysxeVlqU0hnSVJKVzR5U0tyR0IxWkFNd1dicnpFcUl3?=
 =?utf-8?B?U3duNHhFaW8xeDlUd2c3SFR2c0w3cXBzemZjUHJvbmxrODlocXdYS3RrNzND?=
 =?utf-8?B?dk9uKzQ2TFhLUHhnRWVvWXArNml3WHJJa29DTE41bWtGa3VxazRCdVdaTnB0?=
 =?utf-8?B?alM1TUJSRWxDSXJWN3BRWGcvLzVGRVFiaFp4SU5kUEVQeWIxMVNlakx5RG9s?=
 =?utf-8?B?d09GemVxaTZPc3ZDbWk5TjNIeUZRbnR2WnJQOWtCSlhJc1JjUGJraXZtenBi?=
 =?utf-8?B?U2E0am9IVVpwd0ZZR3F0SVMzUWRQamlBNTZ0QVVwblg2dm1TQ2crRVFuQy9Z?=
 =?utf-8?B?bTFTbVgrbjBEQmxZRVU2Q29qRHZ5bG9Cc3ZiZWpxbm9PSVYxOFgzZlo2MzdR?=
 =?utf-8?B?NlhWQUlNUUM3NVA0a3ZoSStoaGFyTVliNTducFJmaTlFRnRqRnBkSVBhV0Zw?=
 =?utf-8?B?Y2RiWTAyOEYvRFhKdVRRemU3aEpmR0hQV1h4QTUrSDdnRHlQcStmdmsyVXhq?=
 =?utf-8?Q?DTOfIQb/8Ds3t8IxkDSXYldDdtnKTPRMQBodA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGF3S2ZlZ0xiNlBWd20zYktxUDU3bXdVdENZN3ppTXRrMEZ6M1JRVVFWTW90?=
 =?utf-8?B?blJrSGJiRlB0bldvcG9oa0pMbTRXcGsyYXgrazFHQ2EzUHlsV0RrQ3hzTHUw?=
 =?utf-8?B?OWhJVHhFSmRCSlNISkV5OEhuWStJUUVYKzIzL2NSVUM2N1NzZ1Uvc3Z0aFNI?=
 =?utf-8?B?aXZkWUx5bitPWmNzbm5lQ2dxeGxhWDUyVi8yRzlmcWNEd3c3M2xDTDE5a3R2?=
 =?utf-8?B?SjhaMDdwQWp0VlJvdlMzSnhJNmxnazVkVjBmWU9ySzgzN2VZTktVTDQ1RTVB?=
 =?utf-8?B?Vm9IUlRsQ0l0cVRpR0xZNkZRZTZIbUlxQ1pMZlZZNVZhUzM0VmNpdTFBUWxy?=
 =?utf-8?B?WkFZcGZEK2g4U3FKQndOby85WUZkYi9YUkV4cWdWS01MY2lDN1V1OUIrOUY1?=
 =?utf-8?B?aHJBMEY4bXFqK3FQVG9La0VlQXJxTVYxeURlOHRrWlJwWXBiR2tUbHhBb3Jz?=
 =?utf-8?B?VUlEaTNQUlJTcU16OE5COHFrbmNyVUt4TWowa2dNNjA5dFVwck80ODFza3g3?=
 =?utf-8?B?T2dkTk1ySmhLeDlBUnlKbXZieUFvL3llbTJHNW0zRnNYUUVLKzVZQUFySkJo?=
 =?utf-8?B?cHlnQllnMjkyMDdsSkdxdW5hb0E5MTVZbEw1bWVQNE15TlQxWXRIUHh3V0pq?=
 =?utf-8?B?aGwrb21sdmt5WUtsUjlEMm5nNWI1RFhmSW5xNUVTaU5zVUMwUklWVTRXUmRE?=
 =?utf-8?B?Q2U4OWg3cERMazFiaG95Mm9KZExKQ1RaL3p4bS9wbytPT0l5eEUwaEdqN3Mx?=
 =?utf-8?B?NzQ1S09BL2ZISVgrTTZVZ0JzQ3U4a1l6ZjUySVpRZnVVYThJVTV5U1dCYTg1?=
 =?utf-8?B?bGIrREZpdXQxRmt2NEtCeXJzalJFNjRLZW5VdW1lTnpHTVhBUFhhcUx6SmYw?=
 =?utf-8?B?VnNWZ1krdGhweUE2WnJZaDBBbFNoc1FVbVhST1cvZXk5ZTVzeTNVbndmWWw2?=
 =?utf-8?B?UVdETHlOS0ZKT09OV0JaQXdUWUEvaWZjem96d25qM2NCNHFIcEZSOEJKc1RV?=
 =?utf-8?B?bEJ0aU5tNXI5dkxLZDAvdE1iZ0U1eElCdCtjTEt6dmxaSzdIY1lBUkRlZURr?=
 =?utf-8?B?UG5HKzQ2akR6aG1XY3h0SkVEeDNMVUpmWjdFcmhNWFJQTzhZMFd6RnBMR2N2?=
 =?utf-8?B?WEJ1YnVJNEViejJEWjRRRWRHUU5BdFNnV2FacU9qc2J1SVRmNlJTL1dRM2M5?=
 =?utf-8?B?UVpmZHBFMjFKTnVwdjl1U1BRd3d6STV0QUpSNk5HbzRZZXRtbGpoaTVtRHJK?=
 =?utf-8?B?R1hqeVREV0JQOWI1YlRwOEJWRDVMWnV5bEYrbllZQVM2Vy9JbHJid01zZFdB?=
 =?utf-8?B?Q3BxTG0rQWdFdWp4aW1KOEk5OEJPSjkwdHdDWlNLTjhqZ05ZdEIrbys0QStw?=
 =?utf-8?B?ZW4zOEREMWo4WnBYbzJoYm5FbVVUbEIycU1INGt1Ynhrb1h5eG0xVlpTeDg0?=
 =?utf-8?B?VXAydHJwK1RnTjQ0R3RQN3lOVUV5Nmx6WG95WTdSQnZKZ2o2Ry9CZGZaSDRG?=
 =?utf-8?B?djYraXgxWkd3ZU9BbTNVcy9vVDZWd0R2NmZ6YjJDWmpNT3JadzBpbnJtenc2?=
 =?utf-8?B?MVFXaWMzcHBWTjRGbE4xZU1UTkR3N3hsZFJqWlJBNkJNUE1pWlRjUmc4Tk45?=
 =?utf-8?B?ZjlOemFMT3JSOWg3Nzl4d3RnekZZTlZiRDhFYkUwZFdJQjNjV0tjZnl6OFZO?=
 =?utf-8?B?TnlaMS94cGppWjdnYmdqRllBNkdZRERVVTZQZ2tiQXFTS243MXh3VjhVUmMv?=
 =?utf-8?B?TDkyOVF2TWE0UUpzVmFYM0dvYkRLNXFRMUVlZ2F6V1lxekZ5MlgxenhuK29B?=
 =?utf-8?B?Mk56TkJvNzNNUGRHWFJicE1tM2JjMTBIeWlaSU0yeWNTWmY2WDJFdTZzK1oy?=
 =?utf-8?B?TnNJRlVDVkRuYXFlSk4xTHp0NGVxcXNvV2V4WnVDRGZHb2NIbEI3b3AwU2xR?=
 =?utf-8?B?WnVkZ2tmZ3BqNGRZa2k1MFE0ZUhPMklWZm5tT3JjaXBCT2tZRHdvRUlNdC9o?=
 =?utf-8?B?OVNwRENhNGQxNTBpeFRPakE3N0pPNm5GR28rbVlRZ0thQXBtZDRldDJwQVk0?=
 =?utf-8?B?VW1GZ0xaRkhBSmhVZUFqSFU3OWNEU2xUdUpncFhZRnBHeU1TeWROaHI3cWR5?=
 =?utf-8?B?Nk5DTWhMdnFucnMvZXdpZ0RIUWlJaGtNYktOQU5PYXA0WmZYTEcxMTlMa3Zk?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a33712-66f6-4685-cd9a-08dddf821c31
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 00:40:06.9651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akDpRM5Tn8ykLwugSKaXK5tM7kpJB6foOvG8CJ45hcnAN0/GbRNGE7TB1oUzKQfMr/byfvTCIDBTZcYoKFvZug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

On Tue, Aug 19, 2025 at 05:35:07PM -0700, Matthew Brost wrote:
> On Tue, Aug 19, 2025 at 08:44:04PM +0200, Zbigniew Kempczyński wrote:
> > During vm-bind ioctl ops execute fence may be signaled during the call.
> > If vm-bind syncs to user-fence it creates a race because signaling
> > happens in the worker. This means control may return from vm-bind
> > ioctl and consecutive vm-bind operation to same vma (unmap) may happen
> > on still not signaled user-fence. This finally ends with -EBUSY error
> > because even if vma operations completed fence still exists but
> > userspace was unblocked with copy_to_user() call.
> > 
> > Instead of releasing user-fences in workqueue for already signaled
> > ops put them synchronously in the same vm-bind ioctl call.
> > 
> 
> I'm not really following this explaination. I think the actual problem
> is in user_fence_worker() the copy to user to done before
> WRITE_ONCE(ufence->signalled, 1). If there were re-ordered, I think
> that would fix this problem.
> 

Also, as a follow-on optimization, you could keep it as you have here,
but this patch has the same ordering issue. That should be fixed for
consistency, even though it would still be functional because vm->lock
protects against the misordering.

Matt

> Matt
> 
> > Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5536
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index f87276df18f2..8becc3755649 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -103,6 +103,15 @@ static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
> >  	dma_fence_put(fence);
> >  }
> >  
> > +static void kick_ufence_sync(struct xe_user_fence *ufence, struct dma_fence *fence)
> > +{
> > +	if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
> > +		XE_WARN_ON("Copy to user failed");
> > +	WRITE_ONCE(ufence->signalled, 1);
> > +	user_fence_put(ufence);
> > +	dma_fence_put(fence);
> > +}
> > +
> >  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> >  {
> >  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
> > @@ -244,7 +253,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
> >  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
> >  					     user_fence_cb);
> >  		if (err == -ENOENT) {
> > -			kick_ufence(sync->ufence, fence);
> > +			kick_ufence_sync(sync->ufence, fence);
> >  		} else if (err) {
> >  			XE_WARN_ON("failed to add user fence");
> >  			user_fence_put(sync->ufence);
> > -- 
> > 2.43.0
> > 
