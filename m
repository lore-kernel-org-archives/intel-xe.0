Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC63C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 19:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3935410E172;
	Thu,  3 Sep 2026 19:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJq+FDbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C901B10E172
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 19:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788463081; x=1819999081;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xKi72KW9LeMaAOOkRGhJwBuFCXanrx6qIsAtO93CWLA=;
 b=IJq+FDbX8729BxyK8JIboXKMcKUI4J5QNWN3KayE/jfLv/ocz62RB2ZQ
 uc2qxoatBnmuBZpjK6oohiZcMr2MTb4B07PxyEIVZth6224xTYTR7+Z9Z
 sq8s3XxwFS1csCmb9y/Yu1l/e3nC7aMyTaYV24pEGuYP2U9sBLhJkQ8Ot
 7Hh2wk93URh+kpqsvN6rDlG9vpjoIhGeMClRTXMNAD5l713LycX6ScQtJ
 h/fSxJAysPmA084ItDSIoSdTu973g783uZ2ePL4HO8BRSE4F56usLBBHS
 pnYmgjsbK6Ws+8LhGcNZkZtXKZcu//KD3nR1JkPd5tsB9ikqKj1VTU7Mm w==;
X-CSE-ConnectionGUID: DFMwcef7S1+OWByqJQrQBQ==
X-CSE-MsgGUID: HElU/EG2QmuJ15zypLxCgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99288446"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99288446"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 12:18:01 -0700
X-CSE-ConnectionGUID: 01Yiv67xRJO3je66ojbPTg==
X-CSE-MsgGUID: RWwfwWucRXqZoCIiZUQ6jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275089246"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 12:18:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 12:18:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 12:18:00 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 12:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbSEuahr+KmdD3E56/u8e0nH1BLQbls+sNAswgCDpm0vAJ9lCSG872w++LVyrcjHT4ovgOx1uJ1z+Uz2nIAdol0+9CaqonW1YQuO+SM8c7hbybDazlLOjUo9O/SlBI5pc1Z90CxyKBeJToGg4S8A81YyR3CHbe0ENmop432nMT7P3HgdlBW1EuwMftRqbVVme1jzzmVP+dwB8weE6tNkGdstQq6N5UqblKanxIOSrn50cj4DB/au1lc6fz9QeNaGdVvVwMlZiLkvkY2jvQ6DgXIaVuISgwJGuR8BrZDxFqZCvRB7uUl15L/VdqAHffwyz7o7TfEgWuPjRpAPyYiHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5axKbzNSpYWsP5NNzaZ8P3rKoj6csP0jLO30LPg++w=;
 b=GX6zfHyTl2EK/JaPmDvnGA/kIOAZy0iDS/Zo99qmfVj0bDQkB80o5wSprTp0f+u5QZC4NOEDO/oIf51DwwecH8pSco8OycGx2+y9XmTHml4nO7dioEweXSv6ldqggFIaSPbt3xlV/ExYkEk1J0/Eg6NvG1OhYLvJIIxhpsl223/P2zerMld/y9Fo7RTXK1WkrmaXpgFhA8PY8cA8w/Yk0QH8K1KQu9CssHoZsLubHzO3aJAW3URTOvpNAZ04VwRFpnyCC52zt0Hj6flgOkcXLWFDRO1h6+VADuhKh1XK6SMH18ptzlkQctNQNI6ygS9nuA6hRDsA2IFON4kIVna9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:17:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 19:17:56 +0000
Date: Thu, 3 Sep 2026 12:17:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v4 1/4] drm/xe/sysctrl: Add System Controller get
 application status
Message-ID: <apnH4aA3m1B7UAkM@soc-5CG1426VCC.clients.intel.com>
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
 <20260903140340.83500-7-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260903140340.83500-7-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0328.namprd04.prod.outlook.com
 (2603:10b6:303:82::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: c2be9782-bdc6-4ff3-3b01-08df09f00f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|56012099006|3023799007|6133799003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: kFCMzoQJVPueBjvq+AHj7KxPNorA3/P0ZhuuB9/b+Hw+nyLVrXsnhQe8lOJHn/L121NJy1Jq9X5aj1PufphXTaJWx5Q/r1cvOhLxG6XHU6u4Ld8k+GVfpXAkUMNV82e6G4llUsP/HRLnxzuF9MILaLImoI8PW6D4eh17JaZQMiDrLb5LAesBLTWLsOF1lgoM9LfLZhrYWfF4BV/T2Ijvs3BenlK+BCOQ62kM2cj9df9iHoOt+UIrBNK4q4tyVewohk1XgJj0wlTl58ntGPOPGuuFe6CThW5E/QWNu36wkry6AS3XqGoHSzSZDHaPWeDP6HsXTMwEY+9OXaVVaRZ/7CBXE8f5g/G5lkiN56mDCg9ZK6PT6eOi8+77t04zxQKrfHt9PAVxw5RkbWuaHnlqdu9xVeLrRlA8ZTjHvsgsbFgNjUdcfToeiSIFQlL5z37T4+46uy83ZWrJUsju1Ngj/Kb5sbRz4wAUxjOhrOoBow2MxHpLArlEGPXkjBMfVlmAsORveQX/W5h4f2mJxMcrhuMWMH/kZP14v0ACC+90HUWk7tCGEg9EPW+WU6WVhYsJqyWGod+GlHdeg/lPGH9wyPGdbMybkzjdcYNQmczagG+tksJazApyW+OQ1n2FPTRkK3LNvdhlv6OGwyBV+4e6EVsdBmsiCnuxqmpNjga+u0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUJXeWY4Y3hiYjBiQjUwcmNQMGVaSlJFZkNMVkpsWWNhSDI2UzVWWmpkcFpz?=
 =?utf-8?B?QUovYVhzZ0g0UEJma0VPM1lGWWZWOXdoR3lEbG16UTQ5N1NsTXhoVi9hakdJ?=
 =?utf-8?B?SHg2OXVobmU4WmlocUhYZ0FyaFg1NGZKZy9Pc0JhdUtZM29MY2tyZUQxcTFp?=
 =?utf-8?B?MVRmeTE2aEdtVVZtMVk5aHVUNExRNDdMeHVQanA5MmlVTGJ0Z25hVk81aGJH?=
 =?utf-8?B?WU4vcmdiNm1PMVZ5aUFnOVZCYU5aWEVOZVdIYlZHZEFDY1FEa2M5VzFmSVU0?=
 =?utf-8?B?b1hKYndOc29YSmNNOVpJcDRFQU1weWdIRmxjNjljaEtOVHFuL0FJUHJjNlRU?=
 =?utf-8?B?anpiTmxSV053SUN1aks3VkRQdWE0YjZYNk5GYmtjaUQ4dmpFa0FlbWFxd2E2?=
 =?utf-8?B?dkU2d1g2VEM3MXRjRkRFVDBicVZLVjBVQmhrSUJ3QTRrbnEvbXNqbGtzeUNn?=
 =?utf-8?B?b0dZcVRqMlU0WVJiWEVpWFdNaysxNlZPWkRlUTdQOWU0TzZmdkpCcmRmcExk?=
 =?utf-8?B?VFY2WWJPa3hyNE5lRk1GYUMvSis0TjJ3RlBHMk1tMGN2SVdMZ2c3NzgwSmg2?=
 =?utf-8?B?N3RNZzdjcWl4Q0Vsa3ZEQVZsOFBPTnVXQjIrKytJV1dmQnRrQ2g4bFMzbXhn?=
 =?utf-8?B?cE9FanBQczNadG54RmdRNm5YYjlza3p0ZytNQVpRNkhFS09heGdQdGMxTmF6?=
 =?utf-8?B?U1ZMVVpZc08vUGJqRXJxMm1oM2x6TFRZZTRNMm1lQjltMmc3cEh1dTAxWE5s?=
 =?utf-8?B?K1R1OFV6WU9UTzNTNXJIc3pyWXpIZTM2bHJoUlhRZW5wNjRsNjFLcVRQdVp6?=
 =?utf-8?B?d3AxREJWcXJkUkhWbldQU1hHNVlOWnJ4dGJ2bmNoY1hoYVA5bGlnYkt4Umcy?=
 =?utf-8?B?ODhsaUFsQ0FVSWlKeDZwbVcvTVM5dzZCSFJ6TGZ3MGl3UmgyQzU5amFNaERu?=
 =?utf-8?B?T3FnOWxLZ3NrNWFQWm1QdnRwV3RFdzV6YXpBRHhmOTdLZk54U0lwUW9tOERs?=
 =?utf-8?B?eHh6U3hBMUlCSlRHTTIyVDZvZERXYkYzTDNvU0dzQ05Qd09sdEtFT0xOVDk4?=
 =?utf-8?B?OVVHZm5IMWt5NGlkdDJPV2svL3dFZy9Oc2ljVEVHT0hETGNVZ3JjRDVBUXFt?=
 =?utf-8?B?emh6M0M3cXlTZVVQcllhZXRyc0ovOHZHUmRsSnlGYTVSWnZ3YVVCNFFkaFlE?=
 =?utf-8?B?dGxlelYyTEdjVFh4REVPMnRjVkxVSldES1IvL0cxVStiZ200RFhNZHV4U0d4?=
 =?utf-8?B?M2pFWXZRVmxxU0pIU3kzU0JKb1k2bUNjSFRCVFhhYkc5T0lybmtYR1YrUm94?=
 =?utf-8?B?TEx5Zmt2ajNrSm5jaTdDWTZmd3R1YURrclRhQVZ1YVZjNTBMOUt6K1lDZHRq?=
 =?utf-8?B?ZmIvdzNycERxbFNoSVg4THpPVHF6ZjJsN3VLbGlkWG5xVmlNU0lFOW82YkYx?=
 =?utf-8?B?dTBsKzZTWDJpRGFrZ0N2ZHlaZnozT3NCOExVcTJhS2FaZmk4KzNXRmVSQXVI?=
 =?utf-8?B?VG0vRUJNTjFlZE1kODU0L2FkM2h2UVY2R1JqSWhTU3M0RFpVeUhBMDhKczNO?=
 =?utf-8?B?eGhYY3hYd0YwWXNjZlNYSGVvRUxRdVNZckpIVE1GM1A3eXNoVjlTVkloUHJW?=
 =?utf-8?B?WnZUUEg3bU16N1h1aWlFUGZPOUl3YzNNS05qczYxNS9FN0N0MkRGMUpKdlFO?=
 =?utf-8?B?R0w4ZTc2NjV1aU5RKzlNaGZDQXZpZzlPcVZtNDZCY3BQa1d4UHk5V3dZK2ZC?=
 =?utf-8?B?ZGIrQXVSdE82SDJjSDFsTWRhV2N2c3kwRm5QQ2dDVjNuSGYvQm53bmNVWmxD?=
 =?utf-8?B?b1J4d2NNR3RwMVFJNFJOSEl0ZkhGSGRQcS9OTTJvK3hzZkxCd2cwR2ZrbWFX?=
 =?utf-8?B?MVRLWTdvdVpENFl3MThtWnJuWklWaVF1TDVZN1NpeE1TY3p3WmZsNS90bGVT?=
 =?utf-8?B?WHBHZVV6OC9vRGVyMWVmaHZvcG9FV1pvSXNKbitDWE1ucXRkeHc0WXpGWE1j?=
 =?utf-8?B?b3JqSlpIWWFYSWdYYys1bXpQenoyMUtFR0JZTmVvWEk5Y3hHdW5jcWg3enJL?=
 =?utf-8?B?Rzlqd0VjTk5SY20zT1FSSC9JL0ZvYTF1anlNZHl0d3F0Mk5WaGIvR0NveUZu?=
 =?utf-8?B?TmRvYTdwdEMxc2xBVzUvMWRoS2Qvd0M5UGozNEJONmdYbys5elNoRHFZRnNq?=
 =?utf-8?B?dHh4UFhtKzVidnNBc1FtOTJ3alRBbHFHdVRIcmhoMDN0TENYa0VpYTBlWDlh?=
 =?utf-8?B?UXZ1VHZnaS9sdDYvcVgvMTF1K3ZBL2ZYSDZXU2FzSjhjR3dmTmRXWVFUKzM3?=
 =?utf-8?B?c0twVStkc2ZZSTArdE03KzJ6S01VT25OTjd5TGFrUWE1NjlKZXN1Y0I0M0NM?=
 =?utf-8?Q?KnG+QrNKrfjNn/sjtk6lRfOZ0gXBp95HirsN6?=
X-Exchange-RoutingPolicyChecked: kYe8OeC0GykkKkrm/sdv0LqoLuTOzRjdPAQxC+OP4Dv6PusiFfav+wqehleaRoEiaXBtbzxFavL7cjddwF/rsJKx5N4aDEWO663gae5HDfzXWXc603n1eOLf75r1mIkdlgwf1zBabla9UmI+tgBnsqy9cZGUa+CHNFdrKdHKq27EKvMTjEbTRADLPirtebhTf46PhqotAWfOT2JVsxAh3tHg+O8QE6FHP1ChoKRLzwbMo+emZDuc27zNM4jMwyaha2zcvWuVTUcayjOutdEQ6Ms1PxXBtTPqSzG/VabcwAmXkfb4wQs+Ir6PPDu+ml3+gRjNfbj2Rt3enzxzOGM+wQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2be9782-bdc6-4ff3-3b01-08df09f00f55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:17:56.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2948GxYhxi50/t4qPoRTRYml5kt9WWNJJ1ffhninAXpN7fJ+RaevlE0KOeXVxvfuBZ0Rmyk0c7RAP9YlakjXSxPbAfluZ5dAO6p81U6ddZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
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

On Thu, Sep 03, 2026 at 07:03:41AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add support for querying System Controller firmware application
>status. This allows callers to determine whether a given firmware
>application has completed boot and post-boot initialization.
>
>This patch is carried here only as a build dependency for this
>series; it is authored and under review as part of a separate
>get-app-status series and should be dropped/rebased away once that
>series lands.
>
>Link: https://lore.kernel.org/intel-xe/20260814095306.2482289-5-anoop.c.vijay@intel.com/
>Link: https://lore.kernel.org/intel-xe/20260814095306.2482289-6-anoop.c.vijay@intel.com/
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v4 (Rodrigo):
>- Added lore links to the parent application-status series
>---
> drivers/gpu/drm/xe/xe_sysctrl.c               | 82 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h               |  2 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 65 +++++++++++++++
> 3 files changed, 149 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 62ccc9be71b4..5da591ade4e4 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -13,9 +13,11 @@
> #include "xe_device.h"
> #include "xe_mmio.h"
> #include "xe_pm.h"
>+#include "xe_printk.h"
> #include "xe_soc_remapper.h"
> #include "xe_sysctrl.h"
> #include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
> #include "xe_sysctrl_types.h"
>
> /**
>@@ -125,3 +127,83 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>
> 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> }
>+
>+static enum xe_sysctrl_fw_status
>+xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
>+{
>+	struct xe_sysctrl_app_status_req req = {};
>+	struct xe_sysctrl_app_status_resp resp = {};
>+	struct xe_sysctrl_mailbox_command cmd = {};
>+	size_t out_len = 0;
>+	u32 flags;
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;

Reiterating previous review comment - based on the users that you had 
listed earlier who query app status, we will never get to the above 
condition, so it can be safely dropped. Once you do that, you can drop 
the status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP checks in the below 
(_ready) helpers.

Instead, if you want to retain this check here, then each of the below 
helpers must be split into _ready() and _supported(). The split versions 
should check for the specific case. It's the caller's responsibility to 
handle the cases as needed.

>+
>+	req.app_id = (u8)app_id;
>+
>+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>+				  &req, sizeof(req), &resp, sizeof(resp));
>+
>+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>+	if (ret)
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+
>+	if (out_len != sizeof(resp)) {
>+		xe_err(xe, "sysctrl: unexpected get app status response length %zu (expected %zu)\n",
>+		       out_len, sizeof(resp));
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+	}
>+
>+	flags = resp.flags;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>+		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>+		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>+		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>+
>+	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>+}
>+
>+/**
>+ * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
>+ * @xe: xe device instance
>+ *
>+ * Returns true if oCode firmware has reached the initialized state, indicating
>+ * it is ready to handle requests. Returns true also on platforms without System
>+ * Controller support, as there is no firmware gate to wait on.
>+ *
>+ * Return: true if oCode is initialized or sysctrl is not present, false otherwise
>+ */
>+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
>+{
>+	enum xe_sysctrl_fw_status status =
>+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
>+
>+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;

See above comment.

>+}
>+
>+/**
>+ * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
>+ * @xe: xe device instance
>+ *
>+ * Returns true if diag firmware has reached the initialized state, indicating
>+ * it is ready to handle requests. Returns true also on platforms without System
>+ * Controller support, as there is no firmware gate to wait on.
>+ *
>+ * Return: true if diag firmware is initialized or sysctrl is not present, false otherwise
>+ */
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>+{
>+	enum xe_sysctrl_fw_status status =
>+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
>+
>+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;

See above comment.

Thanks,
Umesh
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>index 090dffb6d55f..b69a3f474236 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -20,5 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> int xe_sysctrl_init(struct xe_device *xe);
> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_sysctrl_pm_resume(struct xe_device *xe);
>+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>index 66e7cbcc3f91..d756b50cde6b 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -14,9 +14,11 @@
>  * enum xe_sysctrl_group - System Controller command groups
>  *
>  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>+ * @XE_SYSCTRL_GROUP_CORE: Core group
>  */
> enum xe_sysctrl_group {
> 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>+	XE_SYSCTRL_GROUP_CORE			= 0xFF,
> };
>
> /**
>@@ -42,6 +44,69 @@ enum xe_sysctrl_gfsp_cmd {
> 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
> };
>
>+/**
>+ * enum xe_sysctrl_core_cmd - Commands supported by Core group
>+ *
>+ * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
>+ */
>+enum xe_sysctrl_core_cmd {
>+	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>+};
>+
>+/**
>+ * struct xe_sysctrl_app_status_req - Get application status request
>+ *
>+ * @app_id: Application ID for which to retrieve status
>+ */
>+struct xe_sysctrl_app_status_req {
>+	u8 app_id;
>+} __packed;
>+
>+/**
>+ * struct xe_sysctrl_app_status_resp - Get application status response
>+ * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_* definitions)
>+ */
>+struct xe_sysctrl_app_status_resp {
>+	u32 flags;
>+} __packed;
>+
>+/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System Controller firmware */
>+#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
>+/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its boot sequence */
>+#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
>+/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed all post-boot initialization */
>+#define XE_SYSCTRL_APP_RESP_INITIALIZED		BIT(2)
>+
>+/**
>+ * enum xe_sysctrl_fw_status - System Controller firmware application lifecycle states
>+ *
>+ * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by firmware
>+ * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has not yet booted
>+ * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-boot init pending
>+ * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
>+ * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available on this device
>+ * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System Controller firmware failed
>+ */
>+enum xe_sysctrl_fw_status {
>+	XE_SYSCTRL_FIRMWARE_APP_INVALID,
>+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>+	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>+	XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
>+	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>+};
>+
>+/**
>+ * enum xe_sysctrl_app_id - Known System Controller application identifiers
>+ *
>+ * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
>+ * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
>+ */
>+enum xe_sysctrl_app_id {
>+	XE_SYSCTRL_APP_OCODE	= 0x0C,
>+	XE_SYSCTRL_APP_DIAG	= 0x0D,
>+};
>+
> /**
>  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>  */
>-- 
>2.43.0
>
