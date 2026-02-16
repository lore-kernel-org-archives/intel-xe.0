Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B651E63F32
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 07:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D31B10E093;
	Mon, 16 Feb 2026 07:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Anxo4NFs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C1510E093
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771226524; x=1802762524;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VY+cSwxPImLruqwKrymKB3GMEaGe6TGzX8YrheLRvJQ=;
 b=Anxo4NFs2QOYt6WgQgKIfuhMg07z2zFdgymeTeNwqebDiyWOfow9FTfi
 yt9Q/gE4PQ2JitGOO9E/s5PTsHt3XBJfDdZecGwdA9q8obW4N5yf5dPuy
 uJ+/2s0wZCguBM1XswDkEZjY5grTmD4AEdlKCwLo0eFbvEGOO9TeF2eld
 p3CLXjgdR8oEYUIH9a25jdHxp1S0adccktVx1FcbRp4QOjRF4PPTnZy8u
 evFT5HLugXKCZADAVUx0jSDC9ItHXAX3iyu7RPH57Ny8QgKeIv/solKWl
 V2yO7FHGbpvA93PDw/tXJPyIGtzBlvl0q06wLexGy3FnXOwF/V4pYNKJ7 Q==;
X-CSE-ConnectionGUID: diQ+/TzlS1W86vJzN0/fgg==
X-CSE-MsgGUID: A/DF7eowQ2m+tMhwCAFPxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="89715658"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="89715658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 23:22:03 -0800
X-CSE-ConnectionGUID: if7mwIYkQvm8ddDq70t5Aw==
X-CSE-MsgGUID: lq1Unl/5RuehepeoIMv2PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="218499373"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 23:22:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 15 Feb 2026 23:22:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 15 Feb 2026 23:22:02 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 15 Feb 2026 23:22:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQNKw8Ek0zqJL6bByc0QlWV9W5kFVtAX7HT1ar7ELJJMQhjX0vylgor3BA0t9N3zn9NhDHd03FSi9w9mVKkXcHbpgJLsDXYp0EhPsCExqB7lGP0LCLkulRtUkWqSVOj4y1elcioBJwKs+1XydCbn4yJJEMQeU1QN3AsRdjIVap4ju7KvKxegt4X0NRZOzWpYcuSorUjAwFUiyxCMk2L3RsdUVIGR8GyIKa3JC09UxdWaOehkcD7uwPl3n8PBXynW9zWWDXSu7LNpVmPHrAHJw9IjezB8tKDMA0Lv6HQL4hVbpsP1dNsdoQoRa7MECSTqDyD4h5xuu+4CJbZy2l9Wuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VY+cSwxPImLruqwKrymKB3GMEaGe6TGzX8YrheLRvJQ=;
 b=UmzNt4eyMm1kzD+W3ehtlqEYebFmE6bfDhjUcluffqRzPpIsr7J+mMgIp/nlwecOSFQ+VO2xhIejYhiL7LQXJEcwpMlxFpI253wSoFVbtcBq65I8UYP6g6fi7Sq07LiOFMZhi+myM6xOUQ0aRfZW2xrIbk6CAsEy2BRDkxrtRbjtr4kQijPoSFlN964HgnweLn2TSHznxCDdNiuFcNwKk/QqYEWnDqb5q1QTFg8RErjCuMd79uqO1Uicfj+J7EK1gzyzeozW7fLLyzvd6QSXzjPcc2DUNVU66b/AAydYshq/EMFS2vgmWmmUOU6HECncm3YsbCT9hyStXAXPOWNMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 07:22:00 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 07:21:59 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Purkait, Soham" <soham.purkait@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>
Subject: RE: [PATCH v4] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Thread-Topic: [PATCH v4] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Thread-Index: AQHcma5JIc4PAaJgwUiheS3Fz4B/cLWE9h9Q
Date: Mon, 16 Feb 2026 07:21:59 +0000
Message-ID: <CY5PR11MB6366D308B04A78CE19180D2FED6CA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20260209102642.2325804-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260209102642.2325804-2-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH8PR11MB6879:EE_
x-ms-office365-filtering-correlation-id: a9c3a27a-9d30-43a0-ab20-08de6d2c1315
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Zjd4UXVxSFpKZEVwcjVBaVdQRlZtREpRMTQ5U3BEOFdRVVZBbHRmL0VKdWt4?=
 =?utf-8?B?bTJSSms0RDJ1STJFdTdmZEtuaUFLM2hZWitzUXFLTGh2RnJMY0FBQWFMWWdx?=
 =?utf-8?B?WUlQbzhFMUpuU25XTlZwdmdYV1lrVDFEN09YUGUzYnBTWUlHTGFCZU5jZXFr?=
 =?utf-8?B?Z3hrQWtnbG1hU01FU0hsTk5Td0dYaVJKL1dZeTdyV0QzdldsV3k5Ukszeklm?=
 =?utf-8?B?T3JxYW1yNWx2NXlCS012YmNlbHRwZjYrbVpEa0ZLMW45Z1pmNFBYU0FIdHIx?=
 =?utf-8?B?Q2NxRU96TFM4L0dNclVMcnlPcnZ0OVFGNFI0MU5xWGJZTnVIRytQNks3Q3NF?=
 =?utf-8?B?eWoxNzdheUhNdDk0NnJnRmpIZSs0bXNSMjd1SjNmNGkwOVZPU0o1YWdqWWd4?=
 =?utf-8?B?N0gzSHAwVEthSEt1eXU1Nkh6S05UNzFPV2RmWGxqUTA1S003VUpaVkE2TlNm?=
 =?utf-8?B?c0VTK2I2TWlqQ1NsY2N6THpPQm0wcEl4azJldVlkam52WGFGU1RLcGIzbnVk?=
 =?utf-8?B?dU5VOWNpNFpnZjVDTktCMnlkSXJLdDNuY3kzeXVYd1YxSTMvQjBteWhlMk1k?=
 =?utf-8?B?dlUwc0JZZmlrSnRHbjJjNkNXOFN2TUZOL0EyYkc1WTFGUm1XOWtvWkR4RVo2?=
 =?utf-8?B?TkNBZzMwVU9pZTNUV0ZzRUJBQlpueDRLYWd1Q3IzVFdES3ozUFlMMHRjOUdP?=
 =?utf-8?B?Ukt1eGdsMXFicmVoTWQ5bDUwbGRPd3dkTDRQMGlPa2Q1QUVXclNlbFdLTVRa?=
 =?utf-8?B?NllzSWY0RkM3UmtJRWxxQld6K0dyZU8vMVd5YzRmT0ZNTjB1N1RKL0JONlRM?=
 =?utf-8?B?UXpOd3p0eFRKZHFrTTRXakRVeVREeHpuNlFPaVYzU1lTSFhTSXpXUC9Famda?=
 =?utf-8?B?ejkrTlpsUmY3OEFzS3dwQTB1bENrbUgrUWJaMGl3VnhvbjZKZ05odXcxVm1n?=
 =?utf-8?B?Zk5IbGtJdUF5R1ROamMzaVZWd2VCWDl3ZElxQ1dxWHBOajB1NTVwOWxteGhG?=
 =?utf-8?B?N2c2c2grWTZZOUkzaUZod3Nhb3dkaTBBTkd0akk1Zm5nMnBMTW9lbm5PZ04y?=
 =?utf-8?B?SHVoL2ZNdTVaZ3N1ZXNVU0F0bHVCb0ViZGpMNzZQa29wZW9NNXRqM05uTTdP?=
 =?utf-8?B?dWxuZGk2cVNXQ0o4VDQ5MDNsN056anZkTlJsV3JHa1dEMCtKa0NaaTNKSDZ3?=
 =?utf-8?B?OXZGVXBTUXNpeW5HVVdrZ1JjS25ERWFCby9wUUpOZTg2SUt5OExNb2g3TFNB?=
 =?utf-8?B?L0dVR3c5SllkUTNMTW1oTm1jakx2cHZGVWZVWGNqTDFURHpFbVhYNFhuQytC?=
 =?utf-8?B?NGxuQkFIN2pSNjlQRFgrWXc5d0t3R2NwMGtYSXc4U2NETkdNUWdDRjFLbS9k?=
 =?utf-8?B?dXpVNnBTWHJBZ2hCWEREWVltMEFWb2xMSkg1QnlXdDJzV3A5RE9FcUtxVEFG?=
 =?utf-8?B?eTV0ZWo5Q1JGd3RkV2xiTTRZQ0FTZGphWm9YcHN2dDV3QTNhMkFlcHdYMytj?=
 =?utf-8?B?bkNCUk9oV2VMb3J1QmQ3emowRUpyQ3VQWUdpWk9ENm1QS3pybk9TVXIzZVhE?=
 =?utf-8?B?VkY3bEZxZXc4NzRqY1RNdXVRVXp4Nm5vbSs4YnROVWtxUG9SZ2ZGeTAvL0Nq?=
 =?utf-8?B?NHgyYmp2bUJVYWlSOTY3Q3VadTlMeVpJZ09IV3I0VTJ0MVNhZm1CeUhIUWNp?=
 =?utf-8?B?OFp4Y0hZS1BkRmVEckpsTHhkUE9RN0NLU2szNS9zd0FTSXBySEcyWGowMnJY?=
 =?utf-8?B?NnVzemcwWWVDWStRY2JHZW1WZ1FGZ0d2OVNPUm5OOXZ1K1orbDU3aFQwcmZM?=
 =?utf-8?B?cUVtcE5DTm55SDhOZUNzeGFJQXIvZVNGcUJleWViSm9VWW9nWTVpQzBad1Vh?=
 =?utf-8?B?WC9xZlNnZ0xLU0JwTW40WG9LdXphWXNwZktlc3p4em9uVERTZGM2OVZ6bWVY?=
 =?utf-8?B?RDJZOXRkTGNVUWNNTldTbG03MVN4MzFYRGZ2WXRtVGFISll2MCs0azgxRkEv?=
 =?utf-8?B?RVVxUlRRdzBzaER6M3FHZXFYd0UrcEJia1daQm5IYW9IMS85VkU2S3VWeTNY?=
 =?utf-8?B?MmxpZmpxeUJOWGg5blFZZUpYdnFpOVpBOUZUSWZkYUdZUlNwVzZBYUhGY1pm?=
 =?utf-8?B?T3JlV0FqWjRkMjFVV2t2UVNLSW1ra0VHdWRpVTR6TURoRXUwRmRQYWZWR1gw?=
 =?utf-8?Q?uzq+Rv8H3cwA39MLAZT0DNc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWVMRVpJZWlCL2h1TWpQNG5aNTN4RWVDVzZLdDdHclRRb2dWN0Z6b1BpMTBq?=
 =?utf-8?B?cEpGOFRqcmRDWkZWRHU4bE1pRGxRR1IwdEZzcEl1U3NIL3ZTdEk1ejRITFVC?=
 =?utf-8?B?Q20xbTJRU05zM2FnRnJFYjRJbEVvNThQMVpqb1JLUGZpbGZPUFBFVjdTMTFy?=
 =?utf-8?B?SDZ4UU5ObnZTRGZNNjVCT05na056bUpVNVVVcVpibEhLTFBhSjRDTktzVEZv?=
 =?utf-8?B?dkJRWUlzTDFxOUxDbVdkLzYwQzVJL1FJbERtTVR0bEFlUEdOa1prQmVUOVJu?=
 =?utf-8?B?VG1lOHp5VkRVelZ2cHNJMGJqam10TVlNL0pOS242eFFsTDV6NCtidUZ4bEFQ?=
 =?utf-8?B?QjN4dTZmV1ZHUEtaSmc4VlNXQ3pKMFNHdWZkSC9NN0RKUW1rVjlQOFFxOSs2?=
 =?utf-8?B?QW44bXRwZUtYOVVYU1lIK1JFOFlRdkJPaVhJcVNQOHBNeUVmNXZQcHo5N2k4?=
 =?utf-8?B?OVRaZTdVY2NyazEwQkFEcXJCSCtyWld6eDlBK2l2R3lFaCt3bGo3RVdvaTFk?=
 =?utf-8?B?WnVwNUROY2RwZEM4SmxzTi9uVDhuWFJVY09SUk90cENmWXIvU1VNYXlZNVc4?=
 =?utf-8?B?K1hLdUMvMUlSeVhNdWE4S0dVOHpkQkJCWGVsSVZ1S1k0Z0tFMy9QVFZnc1Ax?=
 =?utf-8?B?MGpMa0llQ0E0TDdMdEpnaFp0UkxYcEZzTTFndDYzRHpkdTl3NElWUXk4OHJM?=
 =?utf-8?B?VmYwTmMxc1VXd0lVWU1sditNZVg0dTAxZ3RwRUp2a0FEdVNZMmZONTZCU2hJ?=
 =?utf-8?B?cGZ5cEpRU3lyYTNpdklhYUx2RWl6bC9DSkRRMlhTUnRheDI2Um4yWDZBTXI1?=
 =?utf-8?B?cjJRRXlxSWo0bkQydUdjZWJFRmVXSWtCTE1oK3dnOW1IQ21YSWlmZGUxLzBr?=
 =?utf-8?B?NkcxS0ZhTyttS3lTb2tKRll4dzJHeGZ1L29NS2h3dFBUclB6N1NlMTQvWEdq?=
 =?utf-8?B?YlYwbjJrOTNya2NsRnFLNzZwRDBkUkFzSDBFMVAzYWZIQk4zZEcwQXZCMElQ?=
 =?utf-8?B?SDBFYmQ2RFkxVXBzcThvdjlPajF3TzVxclhCZjFPNXNoM1RvS2d6T2VyNG8w?=
 =?utf-8?B?Q1hWclRsSFpMZTA2cG1FUURMbXd6YzBkTVRoU08zUVBYd1hPUmxFV2pIaWVr?=
 =?utf-8?B?b0ZnY2w2bW10eUxwSXNaYnhPb1VBYVdYSlZwNnh5em52SU45NUhiY0E5QWx6?=
 =?utf-8?B?R1ROMTNOOWc0ZUlibFpYazgyN2lGbDBvc1IwYjViRGw2WEFGSFNoUnRLaU1D?=
 =?utf-8?B?cHZFUXRhdVl6VHFTZ2Jibm5ySExVU0FYZWFaS1Z0MmI5V2RCQ1hDNk5iOGlY?=
 =?utf-8?B?cytqS21PdURxNEZpRG53Q3BCdDBGL0xJbnBzbmY5V25oRWNUNk9PcDB3ZDNX?=
 =?utf-8?B?dXlUWStOTDZ2Q2laMkh2MzlqaEgydk92c1VQQStmbVZwR1hpc2UrU05YTTZk?=
 =?utf-8?B?TzU3b3E1blEvRE9CSHVEcmhqbGQxYWVFYlJCS1hqNEhGSjhzWDJXYWliYWhs?=
 =?utf-8?B?TXprY242R1RBMFBZOFlMTHh0UmlXT09QbkZuNTg1OGZOSXI4MnF2dWFvcSsx?=
 =?utf-8?B?enFrQkFqcFJlMUFnWTdiWXpSMW5NUVpYM2EwK0ZTR25KOGJtTWFpVjROTklT?=
 =?utf-8?B?b1MwRGExUjhRb01nVjcwOWdrN0tzdDBkZG1lWlVXUXhLSDVGd3ZYOHFtUFNI?=
 =?utf-8?B?NzdhcmJDdldKRXB5UlJzVUE3dXcyOW4yR3FKVHRFNzNDSUNHbjE4c3I5Zmkz?=
 =?utf-8?B?bFZYTmFqdFFQZGxRWC9xenBLSW11VzI4c25XY0ZKeTRMREhkSHZqemFTNkRh?=
 =?utf-8?B?Kytldk10SHk1NkZkYnkrQ1E0d1M4cXJvaWVDeG10dGprdU5pQlYzL2hxaTdW?=
 =?utf-8?B?R2wwRWRWUmNuSVZ2VWdQQjd3Wlp1NUFpa24zUDd3TVpzOWMrc1hNTWVHYWVo?=
 =?utf-8?B?VW5JV2tyaHNBcktML1FwOEpPTnZVMW9zM2xiQ0NQUUh4T2tRNUtsTUd6S1Vx?=
 =?utf-8?B?NmlnUzJsQnFUd01iTEhLdTRuOFppaUxoZUpOQy9vZ2wzdGhNWFBSZ05qWFRT?=
 =?utf-8?B?Q2h0ekVZbi8zMWJKRVNndHhJd0J4OHl5VTg3OFVtdi9yOVUrNVpCSmp6RTVw?=
 =?utf-8?B?RDdwZDZjSzdyQ0RqR0Z6YWNXZWprNHFvSS9vSlRkZE9wbnd5MnFzdDdQQitL?=
 =?utf-8?B?UHBoMTFzbXcrVmhSRFhid3BjM0dmZ05icWJzTE0weGJkQlJwNHQ1NGROdUVz?=
 =?utf-8?B?SWR1YXN6d0NTcFVKY3c1MjNTbmt0cERwODhXNllNZFg3RzZmWEw0SDJ5S0Zv?=
 =?utf-8?B?cXVFVTkrK2poSTdqeHlsOUNKQ0Zxd2NKK3dINHBqMjBiY0NTTnZLUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c3a27a-9d30-43a0-ab20-08de6d2c1315
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 07:21:59.9104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGNEJaJuo72+aNCrmeoxwCSxGpeZ/nKrMm4pMCnITFyliNOyr4X3tvOASD5SjORe6ZrgDRaOZSmWqI32Btr2bNe7AYJAZLSPIG4ZalmQ2Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6879
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjRdIGRybS94ZS9jcmk6IEFkZCBjaGVjayB0byB2ZXJpZnkgaWYg
Q1NDIGlzIGEgUENJZSBlbmRwb2ludA0KPiANCj4gRnJvbTogU29oYW0gUHVya2FpdCA8c29oYW0u
cHVya2FpdEBpbnRlbC5jb20+DQo+IA0KPiBBZGQgY2hlY2sgdG8gdmVyaWZ5IGlmIENTQyBpcyBh
IFBDSWUgZW5kcG9pbnQgdmlhIHBjb2RlIG1haWxib3gNCj4gZHVyaW5nIHhlIG1vZHByb2JlLiBJ
ZiB0aGlzIG1vZGUgaXMgbm90IHN1cHBvcnRlZCwgYW4gYXV4aWxpYXJ5DQo+IGNoaWxkIGRldmlj
ZSBmb3IgdGhlIE1FSSBkcml2ZXIgaXMgY3JlYXRlZCBhcyBhIGZhbGxiYWNrIGZsb3cuDQo+IA0K
DQpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVs
LmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBTb2hhbSBQdXJrYWl0IDxzb2hhbS5wdXJrYWl0QGlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQmFsYXN1YnJhbWFuaSBWaXZla2FuYW5kYW4NCj4g
PGJhbGFzdWJyYW1hbmkudml2ZWthbmFuZGFuQGludGVsLmNvbT4NCj4gLS0tDQo+IA0KPiB2MjoN
Cj4gICAtIFVzZSBzY29wZWQgYmFzZWQgcmVzb3VyY2UgbWFuYWdlbWVudCBmb3IgcnVudGltZSBw
bSAoU2h1aWNoZW5nKQ0KPiAgIC0gSW5pdGlsaWF6ZSByZXR1cm4gdmFsdWUgb2YgeGVfcGNvZGVf
cmVhZCAoU2h1aWNoZW5nKQ0KPiAgIC0gQXNzZXJ0IHdoZW4gQ1NDIGlzIG5vdCBzdXBwb3J0ZWQg
YXMgYSBQQ0llIGVuZHBvaW50DQo+IA0KPiB2MzoNCj4gICAtIENoYW5nZSBhc3NlcnQgdG8gYSBr
ZXJuZWwgd2FybmluZyAoTWljaGFsKQ0KPiAgIC0gRml4IGtlcm5lbC1kb2Mgc3R5ZSBjb21tZW50
IChNaWNoYWwpDQo+ICAgLSBDaGFuZ2UgaWYtZWxzZSBsYWRkZXIgdG8gYSBzd2l0Y2ggc3RhdGVt
ZW50DQo+IA0KPiB2NDoNCj4gICAtIFJlZmFjdG9yIHRoZSBjb2RlIHRvIGNoZWNrIGlmIENTQyBp
cyBleHBvc2VkIGFzIFBDSWUgZW5kcG9pbnQgZWFybHkNCj4gICAgIGluIHRoZSBwcm9iZSBhbmQg
ZW5hYmxlIGhhc19oZWNpX2NzY2ZpIGFzIGZhbGxiYWNrDQo+IA0KPiBDYzogIldhamRlY3prbywg
TWljaGFsIiA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+DQo+IENjOiAiTGluLCBTaHVpY2hl
bmciIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gQ2M6ICJVc3lza2luLCBBbGV4YW5kZXIi
IDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+IENjOiAiSmFkYXYsIFJhYWciIDxyYWFn
LmphZGF2QGludGVsLmNvbT4NCj4gDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2hl
Y2lfZ3NjLmMgIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9oZWNpX2dzYy5oICB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wY2kuYyAgICAgICB8ICAyICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNv
ZGVfYXBpLmggfCAxMCArKysrLS0tDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9oZWNpX2dzYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2hlY2lfZ3NjLmMNCj4g
aW5kZXggYzFmMTUzMTNmOTJlLi5kY2I5NDcxZTc1NjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9oZWNpX2dzYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
ZWNpX2dzYy5jDQo+IEBAIC0xMCwxMCArMTAsMTQgQEANCj4gDQo+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9wcmludC5oPg0KPiANCj4gKyNpbmNsdWRlICJyZWdzL3hlX2dzY19yZWdzLmgiDQo+ICsjaW5j
bHVkZSAieGVfZGV2aWNlLmgiDQo+ICAjaW5jbHVkZSAieGVfZGV2aWNlX3R5cGVzLmgiDQo+ICAj
aW5jbHVkZSAieGVfaGVjaV9nc2MuaCINCj4gLSNpbmNsdWRlICJyZWdzL3hlX2dzY19yZWdzLmgi
DQo+ICsjaW5jbHVkZSAieGVfcGNvZGUuaCINCj4gKyNpbmNsdWRlICJ4ZV9wY29kZV9hcGkuaCIN
Cj4gICNpbmNsdWRlICJ4ZV9wbGF0Zm9ybV90eXBlcy5oIg0KPiArI2luY2x1ZGUgInhlX3ByaW50
ay5oIg0KPiAgI2luY2x1ZGUgInhlX3N1cnZpdmFiaWxpdHlfbW9kZS5oIg0KPiANCj4gICNkZWZp
bmUgR1NDX0JBUl9MRU5HVEggIDB4MDAwMDBGRkMNCj4gQEAgLTE2OCw2ICsxNzIsMzMgQEAgc3Rh
dGljIGludCBoZWNpX2dzY19hZGRfZGV2aWNlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiBjb25z
dCBzdHJ1Y3QgaGVjaV9nc2NfZGVmICoNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gKy8q
DQo+ICsgKiBUaGlzIGZ1bmN0aW9uIHF1ZXJpZXMgd2hldGhlciBDU0MgaXMgZXhwb3NlZCBhcyBh
IFBDSWUgZW5kcG9pbnQgdXNpbmcNCj4gcGNvZGUNCj4gKyAqIG1haWxib3ggc3ViLWNvbW1hbmQN
Cj4gUENPREVfU1RBVFVTX1NVQkNPTU1BTkRfQ1NDX1BDSUVfREVWSUNFX1NUQVRVUy4NCj4gKyAq
Lw0KPiArc3RhdGljIGJvb2wgaXNfY3NjX3BjaV9lcChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4g
K3sNCj4gKwlpbnQgcmV0Ow0KPiArCXUzMiB2YWwgPSAwOw0KPiArDQo+ICsJcmV0ID0geGVfcGNv
ZGVfcmVhZCh4ZV9kZXZpY2VfZ2V0X3Jvb3RfdGlsZSh4ZSksDQo+ICsJCQkgICAgUENPREVfTUJP
WChER0ZYX1BDT0RFX1NUQVRVUywNCj4gKwkJCQkgICAgICAgREdGWF9DU0NfUENJRV9ERVZJQ0Vf
U1RBVFVTLCAwKSwNCj4gKwkJCQkgICAgICAgJnZhbCwgTlVMTCk7DQo+ICsNCj4gKwlyZXR1cm4g
IXJldCAmJiAodmFsICYgREdGWF9DU0NfRVhQT1NFRF9BU19QQ0lFKTsNCj4gK30NCj4gKw0KPiAr
dm9pZCB4ZV9oZWNpX2dzY19pbml0X2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiArew0K
PiArCWlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9DUkVTQ0VOVElTTEFORCAmJiAhSVNfU1JJ
T1ZfVkYoeGUpKSB7DQo+ICsJCWlmICghaXNfY3NjX3BjaV9lcCh4ZSkpIHsNCj4gKwkJCXhlX3dh
cm4oeGUsICJDU0Mgbm90IGV4cG9zZWQgYXMgYSBQQ0llIGVuZHBvaW50Lg0KPiBGb3JjaW5nIGZh
bGxiYWNrXG4iKTsNCj4gKwkJCXhlLT5pbmZvLmhhc19oZWNpX2NzY2ZpID0gMTsNCj4gKwkJfQ0K
PiArCX0NCj4gK30NCj4gKw0KPiAgaW50IHhlX2hlY2lfZ3NjX2luaXQoc3RydWN0IHhlX2Rldmlj
ZSAqeGUpDQo+ICB7DQo+ICAJc3RydWN0IHhlX2hlY2lfZ3NjICpoZWNpX2dzYyA9ICZ4ZS0+aGVj
aV9nc2M7DQo+IEBAIC0xNzksMTQgKzIxMCwyMCBAQCBpbnQgeGVfaGVjaV9nc2NfaW5pdChzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSkNCj4gDQo+ICAJaGVjaV9nc2MtPmlycSA9IC0xOw0KPiANCj4gLQlp
ZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSkgew0KPiArCXN3aXRjaCAoeGUt
PmluZm8ucGxhdGZvcm0pIHsNCj4gKwljYXNlIFhFX0NSRVNDRU5USVNMQU5EOg0KPiArCWNhc2Ug
WEVfQkFUVExFTUFHRToNCj4gKwljYXNlIFhFX0RHMjoNCj4gIAkJZGVmID0gJmhlY2lfZ3NjX2Rl
Zl9kZzI7DQo+IC0JfSBlbHNlIGlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9QVkMpIHsNCj4g
KwkJYnJlYWs7DQo+ICsJY2FzZSBYRV9QVkM6DQo+ICAJCWRlZiA9ICZoZWNpX2dzY19kZWZfcHZj
Ow0KPiAtCX0gZWxzZSBpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfREcyKSB7DQo+IC0JCWRl
ZiA9ICZoZWNpX2dzY19kZWZfZGcyOw0KPiAtCX0gZWxzZSBpZiAoeGUtPmluZm8ucGxhdGZvcm0g
PT0gWEVfREcxKSB7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgWEVfREcxOg0KPiAgCQlkZWYgPSAm
aGVjaV9nc2NfZGVmX2RnMTsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJYnJlYWs7
DQo+ICAJfQ0KPiANCj4gIAlpZiAoIWRlZiB8fCAhZGVmLT5uYW1lKSB7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9oZWNpX2dzYy5oDQo+IGluZGV4IDc0NWViNjc4Mzk0Mi4uMDAxM2YzNGY4NDI2IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuaA0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuaA0KPiBAQCAtMzMsNiArMzMsNyBAQCBzdHJ1Y3Qg
eGVfaGVjaV9nc2Mgew0KPiAgCWludCBpcnE7DQo+ICB9Ow0KPiANCj4gK3ZvaWQgeGVfaGVjaV9n
c2NfaW5pdF9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ICBpbnQgeGVfaGVjaV9nc2Nf
aW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ICB2b2lkIHhlX2hlY2lfZ3NjX2lycV9oYW5k
bGVyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1MzIgaWlyKTsNCj4gIHZvaWQgeGVfaGVjaV9jc2Nf
aXJxX2hhbmRsZXIoc3RydWN0IHhlX2RldmljZSAqeGUsIHUzMiBpaXIpOw0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bj
aS5jDQo+IGluZGV4IDQyZjE1Y2QzOTRmNi4uMjMxMGIzMDQyMWY2IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BjaS5jDQo+IEBAIC0xMDU2LDYgKzEwNTYsOCBAQCBzdGF0aWMgaW50IHhlX3BjaV9wcm9iZShz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3QNCj4gc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkN
Cj4gIAlpZiAoZXJyKQ0KPiAgCQlyZXR1cm4gZXJyOw0KPiANCj4gKwl4ZV9oZWNpX2dzY19pbml0
X2Vhcmx5KHhlKTsNCj4gKw0KPiAgCWVyciA9IHhlX2Rpc3BsYXlfcHJvYmUoeGUpOw0KPiAgCWlm
IChlcnIpDQo+ICAJCXJldHVybiBlcnI7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGNvZGVfYXBpLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGVfYXBpLmgN
Cj4gaW5kZXggODVjYzc0NzhiNzg3Li40OGI3N2Y5YzYyODMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wY29kZV9hcGkuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGNvZGVfYXBpLmgNCj4gQEAgLTMxLDEwICszMSwxMiBAQA0KPiAgI2RlZmluZSAgIFBDT0RF
X0ZSRVFfUklOR19SQVRJT19TSElGVAkxNg0KPiANCj4gIC8qIFBDT0RFIEluaXQgKi8NCj4gLSNk
ZWZpbmUgICBER0ZYX1BDT0RFX1NUQVRVUwkJMHg3RQ0KPiAtI2RlZmluZSAgICAgREdGWF9HRVRf
SU5JVF9TVEFUVVMJMHgwDQo+IC0jZGVmaW5lICAgICBER0ZYX0lOSVRfU1RBVFVTX0NPTVBMRVRF
CTB4MQ0KPiAtI2RlZmluZSAgICAgREdGWF9MSU5LX0RPV05HUkFERV9TVEFUVVMJUkVHX0JJVCgz
MSkNCj4gKyNkZWZpbmUgICBER0ZYX1BDT0RFX1NUQVRVUwkJCTB4N0UNCj4gKyNkZWZpbmUgICAg
IERHRlhfR0VUX0lOSVRfU1RBVFVTCQkweDANCj4gKyNkZWZpbmUgICAgICAgREdGWF9JTklUX1NU
QVRVU19DT01QTEVURQkJMHgxDQo+ICsjZGVmaW5lICAgICAgIERHRlhfTElOS19ET1dOR1JBREVf
U1RBVFVTCVJFR19CSVQoMzEpDQo+ICsjZGVmaW5lICAgICBER0ZYX0NTQ19QQ0lFX0RFVklDRV9T
VEFUVVMJCTB4Mw0KPiArI2RlZmluZSAgICAgICBER0ZYX0NTQ19FWFBPU0VEX0FTX1BDSUUJCTB4
MQ0KPiANCj4gICNkZWZpbmUgICBQQ09ERV9QT1dFUl9TRVRVUAkJCTB4N0MNCj4gICNkZWZpbmUg
ICAgIFBPV0VSX1NFVFVQX1NVQkNPTU1BTkRfUkVBRF9JMQkweDQNCj4gLS0NCj4gMi40My4wDQoN
Cg==
