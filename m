Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032E6CA0EE4
	for <intel-xe@archiver.kernel.org>; Sun, 17 Aug 2025 16:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E91210E199;
	Sun, 17 Aug 2025 16:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmWQXErn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8447010E199
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Aug 2025 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755448861; x=1786984861;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hi92Gdm0uPJLLjjaDsCwLpz8U4wSwhgEzGH5SW7Qhoo=;
 b=cmWQXErn6mnG5HC/y/NGZ1R46+fysoKksnD/nZGgbiJGXhIgyHI3eb8y
 uKIgtxVI1LQaiJifv2z5YgW2u6QKyAu+JeG0kVE3VAP1Ij1quYtWUmAGJ
 uibx7uHKgntGEnhTAjTFN7yqCle3z9xY2Vc5lSJPnV22y8mH1x568e2Sx
 ljiaC+eR71zxMkacRlSKIciLg41DuikwZDigwFw1KW2zCLhjUDHbytf+V
 0SFzS+TlHf07kpw2BpY86qxKGa8TOtdqhubmz0pXebxgl/3PTsMKv3Gox
 z21/WUKleEWxRei43LbCzFmB2CivmZxltG3jbMk44HmwWcFIL1Wr9Nn6+ w==;
X-CSE-ConnectionGUID: jTrtnZWxRK2VWh11M1RihA==
X-CSE-MsgGUID: o/dmuozbQ02kqK0tHH+BBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="69055802"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="69055802"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:41:01 -0700
X-CSE-ConnectionGUID: JP/epq/jQcyIcqcYeoF7VQ==
X-CSE-MsgGUID: dqHjyfj8SMexwW54BS4Sdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172606609"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:41:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:41:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 09:41:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.53)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8gmiVLJp48BelqlQAoDwPyV3At4tpoezLkzVVC3TLfHv0ZgvsgZTSmqI4RzvTyZnMCJLNJo26UcbV5tmv5YqnHc+S1sAeXBYYK4/MrecFuM+0NSzDDVKmQ0cvQForq794Mxtp4TzOqpoQHOyvnYKZM4g+EB5vpzqGosPIBlNqSSVxkw1AGsRfMIVcFSOl5m5cciER9K7/dzT21NvR+mwi1qlVaqgqmFGk3gmDV8XNwbxIw5Kv5Q08hEo3s+kAnVRwEyejHwDIPYHXyGrZLbKCZhZh6KcvAejjiwlqJnKNJHPqyFyXZiCR2YLLw9vSE6lLdaM6LyVzEHRzsHwkmqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAR1uvpVzkrLSdHttdOURyrrHuH0o8PVRkDDljEqOow=;
 b=JUZxPeB1m/JYwxVwFqMRnkBgTFwi6buPy6LzNpcVqjiWofoPkhxinBHR+JFEE8euW8rN2cTRr4BXocPJwC6CrGk3sXF/HksnknZbp8LsTfvEco/RMQ5sunNfcS/FofM6WhWYvKFHwE9btf7CHXJOw/Y44MBezPPIgVSySpowFOxDBa4X649cXlxGFrpzNtjXvLXo2dalB3OBy5Ux3X/xggxUsVsjQxjiDODMWJfgF3rw9tI7i1OjhYLNgcqT6zkIzhklrt1zK0ZrGd0ImURN97dInnW16CJzss+Pn2cXnRjeElmElGkMk+NVr/uQZjnapt/GLAnbH2P8/RIxx3Plnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.22; Sun, 17 Aug
 2025 16:40:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 16:40:58 +0000
Date: Sun, 17 Aug 2025 12:40:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Anshuman
 Gupta" <anshuman.gupta@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v6] drm/xe/pm: Disable RPM for SR-IOV VFs
Message-ID: <aKIGF3wKoK3U6bVu@intel.com>
References: <20250812163613.9954-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812163613.9954-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: d681ed4f-4efa-4c43-b906-08ddddacd809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3pqdjF1Q3k2Sno2ak5rRmVlMVhFcWEvSlFIdm9JZWdxTWVhanE4UXIrTVJE?=
 =?utf-8?B?ZVBPTVNtaDVscEU3NFRoZWV3bC9ld01NM2c4UVlUTlZMMlViRkFybW5HMVVT?=
 =?utf-8?B?MDdVaHlMTUFtZ2V0K1FDQXNhd2dqZ1AzQURIcTVCc0h2b3R1b1RDNHd2TlQ5?=
 =?utf-8?B?NzVWRm82VkF6WGlpUWFBZWNHT09LY21ncWdyTkhYcTlmdUhzOTUzaVNRTHh3?=
 =?utf-8?B?aHdDelNtUHFZQWIxV3hIV3UxZkUyd2U0dUtLbEJITm1NcEg4UFRJNFpoYjRy?=
 =?utf-8?B?MzJXYkNWb2MvbnJwWkYwNTN1OHdsU3pUVHFUbXF0bVJFL0tHTmwyQVB2MEY1?=
 =?utf-8?B?R0VTMHhoME5wTVZRVXF0SEU2emR1Mk5vcDdEbzRJUHFNZ1duTjY0VjBJSmph?=
 =?utf-8?B?Z3p3bWdPUUl4OUJCaEJvT3JMdU5DQzhPbU82aDBhTXZ4TWxZbjBLVzJ3Z2Js?=
 =?utf-8?B?eGNobVZSTXhUUFRtZ2JMQkNoVm1oMGxZZStLeUNsbDZTUGw0WEx4MGsvRnMx?=
 =?utf-8?B?WGRZNXAvcjRJR3llYXJUQzl0SU5ycWdJSUlZNUhINkRZYzB0TXcycVU1QTcz?=
 =?utf-8?B?YmFNaTBoQWVGczExN0xQSGNZU1VrcTY1akFpOUFOeVZjVzc2WlhRZ0tteE10?=
 =?utf-8?B?ekE2OGNYTnlLTTBuMXhjN2dVcnZGdUZndEdscWJtNXk1YzBrUGVxdFNjNFVO?=
 =?utf-8?B?R0xTdWR2S0hJUThjeGdrTE9YQTF0OFVKNVZWcFA2V0RzQ0FFalVFcmdUZHZ1?=
 =?utf-8?B?MXNkSElSNkYrOEFZc1lKSEQyOXNwZEFMeFIwenhFSkRMdDF3MTlUaDh4bkpI?=
 =?utf-8?B?Z1JKZUNQbVVZTDFDOGhLdXhiNDNVWnZoOENVL1E2LzhiMG5paDlUdHpuRTBj?=
 =?utf-8?B?WnJqeG5pM1lQTEVGR3hGNGZDS3d2OVZPWEVyMlNWYkhjSnpsKy83U21nVVQx?=
 =?utf-8?B?SERleVF5SUtLTnJIZkVhN0IxMVg0Vjl0ekdTK0xCQXFGa0RqT0hmcGJrVVJq?=
 =?utf-8?B?aTZXOHN3Uy9QMDdia1FjcDlZaENJcG01MG1ueEc5U3JKaFZMajFiNDZHbTZO?=
 =?utf-8?B?c0ZONGkvMkxrR3NvcFFJUG0rUXVJdmZ6VXprZjZKN1pYWk5UM3pMdFdRRk94?=
 =?utf-8?B?SU9tQmlFMmZTY1RuOWlQd2FQck92aEJkMjgwemU0OFRmblR3R2NTSldTQ25n?=
 =?utf-8?B?Z3o0b0RWYlZVMXhtWjZubFlKdUsrVzluWUJDVGRwNk5rb29LeGRvckFYSXBR?=
 =?utf-8?B?VDNOTVl3ZUlVYmNBUW5iVGp3Z0xjZGIrdmJDUG5mdmE2QXJOK3NXMEdFS09r?=
 =?utf-8?B?b2tnMzVRTVpSWEJibENadEI0QjRmdzJDY2R6VVBWMFF1WHZnZkVCMVNkMzcr?=
 =?utf-8?B?RThtQlBtT1I1WXo3VXppRE9LOTV6WnYzeG1YQVdZRm1XbnhYS1d5MGF1WXVP?=
 =?utf-8?B?NW1SYjFyaitWdy8vaVlZNk1KRUtEdmlMcENnMmZza0pHdXg5R29DQW1yR0lO?=
 =?utf-8?B?dUI0dEdaZ1IrOGs5d0d6WDFCdUt6MUlaQ1R3ckg3T3UrSjF2blZYSnBBN0NW?=
 =?utf-8?B?cGl6cEFLTWJjSExZd01xazJWdGZmZllwMGhIdjhmZGJEYXZEVURBQkJVNFZ0?=
 =?utf-8?B?d0ZxRWNXUlBqbWRaTkx0cnB2SHEveW9EcnVQMnVXRDFmcExxWE40SDhDb2VM?=
 =?utf-8?B?VldCNkdyTzhZTUN3VDRQRlh6c3NXSng1TDRDMzM1blBkSk01b3V4eU5DczRt?=
 =?utf-8?B?S08rMVNVSWJpVEsrNGhvclNjTUNLVUhXZzZlN0ZFZWRISTZuaS9Ha3NMYUVK?=
 =?utf-8?B?S1V5RFZQZ2JDVTVjSDlyeERmTHRWSFI5L1ZqYlNqY2VOa2MxWk1jNzBpQjZ3?=
 =?utf-8?B?YjFnZG9qcEZRK09qdkNtTWdlYzdUMURyY0MwbkorbThQd3o0Z2ZlYzNlWmIz?=
 =?utf-8?Q?r8DJ44DLpZE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVF5SFRPa2VJTktLNjJmajUxRHVSaE1maGhKNTNybDI1bmVzRlJJS3NkR2U0?=
 =?utf-8?B?a1dQL1h4S3hMZXk5SFU0aDZNRStmMEVQNWRsKzZnVlhYWW1wcTQwMi90Q3Jr?=
 =?utf-8?B?N1poQzJZM3hUUFpSMnpWSTJyaUdNQnJEQkhGd0JVNGNvU1NzMnE2WndhSzE2?=
 =?utf-8?B?cDRRazJyNUFDT3RYZWJrVHp6RGhCeHByZ1p6cVQ4NDhwME1Fdk9KZ0paSGM3?=
 =?utf-8?B?N0pYOW1ScTV3bjdtc3lkU1kwcTRhMUNJWVQ4N2pta0JoK3k3R3R4aFMzYmcz?=
 =?utf-8?B?NllyYXlvelhSaXBoQllNVzhrZWxESVNpWnhjbHpiWlBWU2xEaGlKbFB0emdP?=
 =?utf-8?B?am01WlViTkRuTHRHeWdDWC9XWUJEaWtDSWVoZzNSSzRTeG03Q2ZCd05uSDhm?=
 =?utf-8?B?Q3plV0c1MWE3Zm54Y3pJK3U2M09ER2daSFRlYmRtbFRsblpVUklUc1VBR01U?=
 =?utf-8?B?ZG4zS2xzT1EzdEptZDM3UEtVV25LL241Y0tVamhxQ2lKeFZmeWtGanAzSDVM?=
 =?utf-8?B?b3B1eno5NUxDYUJaU2Z4Y1VLM3ZJTXh0anlyUE02RGVxM1BydEx2NHhLVjhQ?=
 =?utf-8?B?cU81N2piWHlQcTVVSVNScXB0WXMxZStacmRGV3pBR1lpTlc4Wnd3V1hEYytH?=
 =?utf-8?B?Mmo3b1R4b245NFRsRzVBTVJ3cHNFcWEvQng0c0ZqMisyNnZhdnZvSngreita?=
 =?utf-8?B?TDFyL2ZGd0hzejRwMmZKQmI2VHJQeWcyMHpWdmU1dkhNWlNtMW9UN1IrZEQ1?=
 =?utf-8?B?T2VaSFIva0J6RkJjWXdsbEYxUndHdlEwUUJHQzAxekEvSmRWKysycGdXdHBR?=
 =?utf-8?B?Mkc2TXV3bDlpZ0ZPUS8rZExBTzI2SnBQc1FZdW5INTNhQVQ3UUFwcU9rMzdu?=
 =?utf-8?B?Z25aZFVYQVdqeXhNME56b09rREhRb0d1RGgzK25GeERFTjQwT0Vxb3FFdnRJ?=
 =?utf-8?B?ZGtBMkcyM3dSK3JORGpvcFVoQ0VqSElaYUNITk90QUNEbHY0ekQ5OGorU0pB?=
 =?utf-8?B?L1lzUU5LNkNURkhGL3ZKS1RvRUkvMkdBWDJKZTJpUDZlL3pYejd2NUZRUXZL?=
 =?utf-8?B?MWVxOTFXbi8wK0RENi9SeUhJeG5LeGhiL1dBUEVKOEt6aktEOE10ejJJL1N4?=
 =?utf-8?B?ZFJMYVpxRGpQY0wyRWJnYzVuUFZrM2pnbXlyQXB5SCs2eTBRdWdXcWJPUVpB?=
 =?utf-8?B?eXc5UkNsa1pDUVZvc0xGdWd3dVc2ekRtdG95SFVLeXlaeXgzM29EYjVnQjdH?=
 =?utf-8?B?R2htUnBMSDhIUHRNeFl1NGNjeFpVQVdPMGV4c0ZIazVJWWhGQU1vTmRVOWF4?=
 =?utf-8?B?ZmJPcjhHZzVJUmk4T0hIKzZpd3NTQWNIM1Nac1hJQkN2cDVycXFPV0lQRDlo?=
 =?utf-8?B?M0UySlk2cjJNbzFMQlRXMlFqWlVWRnlFY2hQNFg1WW5kOURaZi9qak8zZ0xo?=
 =?utf-8?B?YlhlM0IrZEFyMzRIdGlyaEJsTjArVlBmVkJLTzIzYVZDZ1B1VlBzWkZ5bzNZ?=
 =?utf-8?B?WFBGTlVqY0djSGwyQmE1ZG1uaGhJVEtZNy93TnhDWGFVbEVtTTRoaTBlRGgz?=
 =?utf-8?B?SGx0dzIxL0VQK0ZKUnErdUtmRW81aFE0RHYvdGVpZUszem1NUjV0QkZPSEo1?=
 =?utf-8?B?ZjhsL0FCQTVGZVFhNWd3RmljZkV5ZENIQXY2dnpBcnY1L1dmTHdHRWFLUVZ2?=
 =?utf-8?B?UFhaYS9JNkNXV0JpaUtGQlZJZEdwbWRvYWk3Vkc3dEJKemZtY240ZTd1ck9k?=
 =?utf-8?B?M3ZBZWYwZE9TUGRIbVd3VFN1R1dLbENtNk1TbmxQNVBkeGVwZi9tWFVlc2dk?=
 =?utf-8?B?d0JxbE50aVBhMjNMY2F3ck5CaHRPM3BiMkhMMkswM2ZsYk9pUDFKYWx5M0dQ?=
 =?utf-8?B?OWpaRFg1STE0R3BYSFpqYlAwcHNkOUYydXp2eUJPSFltYkpLZ0t4bFQ3M3Zn?=
 =?utf-8?B?K2RaSFIwZGZlSVVVT3NwM1NYL3c1SHlkZXZZM29XTkRVQ2tPZUpEUzFFWUR6?=
 =?utf-8?B?aHc0UlpDYm5KQWJwVzhpVnZvaTIrYU14ZjUzMnNjQ0pVK2RUc1JadHRURElv?=
 =?utf-8?B?Z0JyTVhMOEZ4VW1XS3V5ZUNEcHp0L0paUkdhWjV0b04vZ3lQWENoZTFmNUwr?=
 =?utf-8?Q?UeAG5ztSm9HQI2tR5sy9WM7iv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d681ed4f-4efa-4c43-b906-08ddddacd809
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 16:40:58.7122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygSDQG3P/sdsTF6A12ML+XdnSxmydr4ApGN3rzXgvgTE/wVsv2KlKP8a8zDKrG39I7C7B11JtueeSfp3XOFITw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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

On Tue, Aug 12, 2025 at 10:06:13PM +0530, Satyanarayana K V P wrote:
> VFs without native PCIe Power Management (PM) capabilities inherit their
> PF's power state as per PCIe specifications(§5.10.1 PCIe Base Spec 7.0).
> Enabling Runtime Power Management (RPM) for these VFs trigger unnecessary
> driver suspend/resume operations that ultimately perform no PCI-level power
> transition.
> 
> Since VFs without PM capabilities cannot independently enter low-power
> states, the existing RPM workflow becomes redundant:
> 1. Driver executes full suspend/resume sequence
> 2. PCI PM transition step becomes no-op
> 3. VF power state remains tied to PF's status
> 
> Disabling RPM for VFs eliminates this redundant processing while
> maintaining proper power management through PF dependency. This
> optimization ensures VFs follow their PF's power state without superfluous
> runtime handling.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing

> 
> ---
> V5 -> V6:
> - Updated comment (Rodrigo).
> 
> V4 -> V5:
> - Disable RPM for VFs without checking pm_cap (Rodrigo).
> - Updated commit title.
> 
> V3 -> V4:
> - Fixed review comments (Rodrigo & Maarten)
> 
> V2 -> V3:
> - Fixed review comments (Michal Wajdeczko).
> 
> V1 -> V2:
> - Disable RPM only for VF devices when PM cap is not implemented.
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 5e8126ca8e27..51934d5dc44f 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -247,6 +247,10 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
>  
> +	/* Our current VFs do not support RPM. so, disable it */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
>  	/*
>  	 * Disable the system suspend direct complete optimization.
>  	 * We need to ensure that the regular device suspend/resume functions
> @@ -367,6 +371,10 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
>  
> +	/* Our current VFs do not support RPM. so, disable it */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
>  	pm_runtime_get_sync(dev);
>  	pm_runtime_forbid(dev);
>  }
> -- 
> 2.43.0
> 
