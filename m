Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3EECCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1F610E191;
	Mon, 27 Oct 2025 21:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqWPsISX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098FB10E191
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601197; x=1793137197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FeY+Nt9IDupD7YEu6ZoSpqFqlRI0Y8dYdWVbKwWpoj8=;
 b=kqWPsISXqAU4/jWdHAV90Zaf+0l/Qpz2ZTdPfAMOAImwiBJsYUCuXU7z
 XPZrIO1rNOfKX92OV6geryV/TpJlZ1jVjzdHRMVOge235IUZRNGyjVKDC
 Zt8gSTSgrJxSarTkMexz4od2IFqSEqYtXQLFq+rc6Vd6UjtbQel3oJ69I
 wtC7/Kn0DSq26+UbTGrVGY8l8rCl0TH42ToL9ty1ZnPKPdu5bpefo4Zkq
 aC7wQEIvZjEGC7xYtk6Kx3/wM2nWKwh9XdfaNGYltqvZo+1lZO9AD2prk
 HrQp+v5C1bRskV+mHjy5+THNMuh9mjFoaoYFwDZqHxmeUl+Ce5Euf8Ww+ w==;
X-CSE-ConnectionGUID: wFRAtvsFRpyIr7zPD+Wpqg==
X-CSE-MsgGUID: GKzwbuhcStiLQFiszx3F0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63844585"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63844585"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:39:57 -0700
X-CSE-ConnectionGUID: jvfIusLJRVW5XUOmehrBjg==
X-CSE-MsgGUID: g9SnhXALQFisr85sq8EEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185249043"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:39:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 14:39:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 14:39:56 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 14:39:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVfocbqR6CpWtDgbtjdAOGlwVL39svgrUU+tEJFJqHVj6t51FwqkPr5vFr1ZFx7ikk2tPjfK5t/gF0RDHSVSxiV7pmf1hWFERjkszr0XzlcoI7AvPBrUq7dfWbqZ9pCXqPtcDIkb/dcZrJpGpIFZi9FQ594osaIgFYEtNeklZVlWroJsTJRLzlbu1h7WAhrutn3k5BRhLGslaIic+2XSpFk6MwnO/Y2sBGec1sIqWvGE5izMPRbJLfXzlZtXFH724MOmwhoyC9D+182apMhlqVNluxqtWVGvMJOKxkdiAxkLrZ3362GsKmGKrwy1OQSNBB4yzNytF8l6yVwMyg4JcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hodoPMZHApRBaR6H2Xusyp9fVkZbHkaBUDj/SOQZhos=;
 b=ZBqM70eUxKSjQUHz5rqDBP0IRCNCtr63NGyxQlOyWgMa9/sGISZvJd2ZXmnQbw6/8bpUGwNshv24wVK6cIaNCRyIHZVyc39u3z1XVGSvHVIkECOlZUGLJHIdHrIaIn09kWDqfPmtoeSXBXndmBb2lYf9KG0GFzWiUp1vav2VmBUWRjr5CbQHJcYadBq7/OO9nFgYAGzt75Lzq9DtbS46xFkWpPFRo3hWtRvf/BIiVeQwZd2Jd4KTQDngcwIwYHsLobrFcoNONR/ffeVJJRLp6KH+whRKhZM3QzGOpMkEE5vj3aZESnC6p3bTUeb9Kvf+0V1Xov0R2Wy6hkSVfPlr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 21:39:54 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 21:39:54 +0000
Message-ID: <4c8b3cd7-13bc-4051-b58d-df5c68e45e2b@intel.com>
Date: Mon, 27 Oct 2025 14:39:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>
References: <20251015181159.92509-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251015181159.92509-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB4976:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c74f6cd-b279-4b22-bca3-08de15a15de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFpSSGZnaG40aHZiYTVCNXRFRzI3c2U1ak1UT1psNG9TdDNPNGRWQVNPTjlE?=
 =?utf-8?B?eWZYTlRqanZ6QmY4YXFCd0xnS3FPUFlXTmxIb2JHeEI4QURLSmh1YUpQbVJs?=
 =?utf-8?B?T2hnTGczY25IbXd3dWhhQ3VyNk5VU0NNbzRQVEIrMWxpSHFpblVwL29GaUli?=
 =?utf-8?B?ZUpXNHBDWW1Za2xYTkxzWGZQZjVuTm0zN0hDc0VFaVRPNXUzTVpjYmswdVhu?=
 =?utf-8?B?eE9hVS8vSG4yNDdxaDNTS2IyajAyS1l3b1hGeEl6R25mdVNVckVMekozOThp?=
 =?utf-8?B?cWZxZ3BzQWJIeTY2dTk5eDdtcGtCL3pVa0pJVDFmRHZPYk13Q1hyeEt2MnJk?=
 =?utf-8?B?UVgzZU1EY0RscGxFVGVoN2lacm9WVEtsNXA5ZllyV01TZ0U0OHZ5VS83dVd3?=
 =?utf-8?B?dSsrN293cFZmdU9ZYlYvV3YxU25WNXU3TXZlMFFVRFA4Y1hTNitjbDdQaDJz?=
 =?utf-8?B?bkh4Y0Q3eXIrUXNNYTJ6bnAwSkRHTHJJbHZWdExsZjd3T3BYNnc4cWM1MVo0?=
 =?utf-8?B?VjUxR0lQZHkxSDc3RnltaVVDVGxTWTBoSnlvWk5KZ0Rrc0xQWVNaUDZPbVZO?=
 =?utf-8?B?dUpzZVREaEtwQ01VTnZjd1JPam4yTnN3dENSR2ZyNGxJUTJMai9ZbTk3K212?=
 =?utf-8?B?a2FlNFpXMCtNckFWaUpEN0R2LzRyai8zUDhoR2RYY0dVMVRScmpLTThWcUhO?=
 =?utf-8?B?Q3JzaXNIU1FWeWxIWllGREgveGdESjJVMEZuaVJTc0lFcGZhQThDWnlEdG9U?=
 =?utf-8?B?U2xGRHJKUlFBVlZaSmhRQThUZ013Ui91UkJBTHVZNnB5RndObXd1WmcrVUk5?=
 =?utf-8?B?OFNJenF5WWtLNUVvWlNtTVc2ZDZDb3FSTm5RYUI2WVQ1RVNvc3JadlZTTzh4?=
 =?utf-8?B?ZElZUEk5N3RTN0tLalRTdDRZVE9ra1B2VkhpWDI4YjJlUFBuU3Y0dlU5L1k3?=
 =?utf-8?B?YjNwOTZ6aVJNMlpld1gzTjcreXBPV0VLYmQ0S01CS2pOaXZ3bU94M09JZlA3?=
 =?utf-8?B?VFFzM25EOFlhTmY0cmMvcFpIMjIrNG9GWW5venVHeXl2b0IybVI5VlZsbDVj?=
 =?utf-8?B?WEJWVFc4Z1UvR2pFR0NpTjc4QWtldUFwVWRRa2d5THVGWTVLZ1Z4NHpHVVN1?=
 =?utf-8?B?N2pRUS9VU29TQXdmUEorUmNxUnBJRzlKUS9nUzZRTXlKSjhCV1JNVjVPM2dj?=
 =?utf-8?B?WTVYM0VPTit2YXY3WlFucFJCK0VVeXJrb21aenRtM2xEY3ViTEFoY3dEblJC?=
 =?utf-8?B?dEoxL0lIWGpBbUN3RVNhdVl0YU9pbDUxRjZHTVVOWjJIY2swUjlvQmpCa3RI?=
 =?utf-8?B?c2lQT1pobWR6K2VZWDZNYjBuZmFqRFJScHBZcFFxQ2xoaHoxYmpDMjdEV2NW?=
 =?utf-8?B?ekFFR0Q0b0lNcHBWL1BHR3lla2lLMU5iV3dkMTZtV3I5NHJpeE9rQzlPckdm?=
 =?utf-8?B?eHNONnd6U2tpcUVjNVd1a0ZNVjJmK1plTWlXMTVYQWZJSk51ZmFlWGtZZmdC?=
 =?utf-8?B?K2NvZUJRQ0RlbHBUSFBQQWYvZEN2cHJEVUNkcFpnVERaQllET3ZPVjhWQXda?=
 =?utf-8?B?VHpmRHlrbkQ3WVEwQ0NLekx0TlpIeVZIWVk3UHgzajBSRFJWUWs4WEhnYXJ4?=
 =?utf-8?B?a3dlNlZCL2Z6TzlYQjNNNG1CQjZwZ040bzZEZis4V2R0c1V1L2NHL1kwaE00?=
 =?utf-8?B?ZEplWE9QSjhUQ29Rb0c0cmZkMlp4YnBkcUx5Y05QSHpOZ3UrQ3dOdTJhMVRR?=
 =?utf-8?B?Wko5cjZXZjNlV3psVmJMZjFMVWllYnlWc3B4bFhKTDhGSE9FV0RaaVIyOGE5?=
 =?utf-8?B?QzdaRlJCaE4vMmIvTnp1cTZPMFc0VEF2amRCbnpyVWlCck1mbHQxa3Rtb1pQ?=
 =?utf-8?B?cmNXUUQvWVd2OW54SUxUZXpISnlUY0JlSEVSdTZ6aWJFRnpZV2I4b0g2RlpU?=
 =?utf-8?Q?vh334GsxZXPkXucMX5Z0HGvlKkcSCvm5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUhzS1BLbG41WDJKWVBWbS9JMTE4aGd3VWdPNXhYaWpvWjVIYVBPSHRlQTJx?=
 =?utf-8?B?QVlMaGltUGxEWjZ5SFYzbnhEVDZlQ2ZjbU9HYVZTcFBkd1RtdjMxUXdyWTNC?=
 =?utf-8?B?b08wZmg3c3dKYXYvcWlFc0w0RVp4YVVCNUtYZHJRQ1VuT1NLV3pZa09SU3BJ?=
 =?utf-8?B?YnRXS3NySy8zNkZRQzdkNHdxSWF0TDBYdUhvNms4T1R4ZnRXbit5RUtiL1hU?=
 =?utf-8?B?RVFBaU1JOHBNWDdPUVFlL0VhbnVHY1JVNUp3QThyenRDOGVBZ000TEJKWDdR?=
 =?utf-8?B?cHVMOFpYYTFrYllJS0hjRWJpdWN4SVd0ZDU3N0tPL2hXYkc4Mk9ZUE1Bazd1?=
 =?utf-8?B?SFFTR1lzcnBCMmliVjJ6WkJnMEd6Ykwrbk5DbDAvdnhORCt6VDRDSUhURzAz?=
 =?utf-8?B?WFl1QzBMaTJLeWR2Q040WFFSTG9XZGF3elUwZlAxUEJ0cUxvRXJxRVNaZERW?=
 =?utf-8?B?am40b1pxU2l6cnFKelFPb3VEdlViOUlBaUJwdlF0SWlFVVkzSzhJd3FCSFhy?=
 =?utf-8?B?NXBFdXRGUlFWOCtRc3lIVWdZQlF6cld3V0xvMzFEUE1XbHNLUGx5UFZYVDBK?=
 =?utf-8?B?WGg0Tk1wY05BOTA4d2tUVlZrd2sxSWk0UFFEZXFZYTlzem9KdUN0VDhYRkVU?=
 =?utf-8?B?c3IwQ3kzNzRTT2pBaG1xdSt4bWtzMThkQURXWGRsUGEreFBSNU1vSGx5Mi9S?=
 =?utf-8?B?UDNmeHdqNVpRQmNHV1VxcEFQazFSMjZhbCt4bGV6TDlsem83Mmg5d0ZyVzF1?=
 =?utf-8?B?VE5iU2pnRUU0blM0c0NhMWJIblRRWE5HTVQ3ek84S2VsaXhzRk1abjVxbU0y?=
 =?utf-8?B?aDY4OUUzQmdONVYyVzJmYlhjaVovVk11Wk4zTlNSNm9FNWtHSVZpdk81ZFc2?=
 =?utf-8?B?UTd6NUhnbzREdStEOGdyTm5vUWUvbmlMdjFLOXd4bGhKNlJwRE1xUDdlS3Ez?=
 =?utf-8?B?ZERVcU94djJubHpKemg3eFp2WStqYjJBUzUrZUNERHpPek52WWQvQVV1dk9U?=
 =?utf-8?B?UDZjRlZwY2NKT2RUUEdWRm84Y2xMYkNiMG5tVi9jL1pVTE1JRlM5eXpnMzhN?=
 =?utf-8?B?dEZ1eGlEby9jTGxkY0tMdS9TV2Z3eUdId1FuVHdHMy9tcHltcFNuRUFEcXFI?=
 =?utf-8?B?VlYrZW1PY0tySHZ5SzNmMVpEMEJIV0hVOUh0cmZMRmhjSEsvYUNuYUFERGh6?=
 =?utf-8?B?b1hnVFNvQldPSUZwdFNzSFJ1UFoydGxWdkl4QUV3aXhyTkdjVmU1czRGejJ4?=
 =?utf-8?B?ZVZNd1hMeGZwYStYZ29RNlYyQWVxdUFBY2xQZko5V0dEdTZEcXQxbTdzb04y?=
 =?utf-8?B?WTc0dlRxbWo5ZlloYTdDYTNsdUY1OXJUWWZnZzZpdEpDN3htMEZYZUdFMksz?=
 =?utf-8?B?UkJ4Mk9hZitnRy96Y0VCU3UzUTFtemhkWDc1b0xyUHZhWTNaUEVyRXVORFBk?=
 =?utf-8?B?TlJkcWNjdWZ6TkF1S2p5bnJMUFZMeVMwSG1iOXBxRjlSTHUxT2g1dEhZSnlt?=
 =?utf-8?B?cDUxNDZuWUZGaXN6ak9GVDdINTJKRUxoSkM1N3VjZFBrbURPSFp4cmVycVV1?=
 =?utf-8?B?eHJTQytyVEVWcHYzRVA0dVVuNjRDS21hMnUxNXMwcUJVaG44anhVTEoxOVRR?=
 =?utf-8?B?YU1CblN2VmJ0L0NtTUo0ZHMxZXlmVnJtUWxEN2ZVdk5CdmRtbWp6cnFPbDJR?=
 =?utf-8?B?cjBNdjZ3UXZFOUpuL0k3WXQ3K2k2RHdQYVIxaFQwbGJ5UHVkRXprVTFtRTJD?=
 =?utf-8?B?Y21LZU0yWG5haU1WSHZOcFR1MjVuSkdXRnZNZXRFdDQwQi9oMjNmVVl4OWow?=
 =?utf-8?B?VFJIRUNRWkJaNHl1ZlRBWG5KT0NlRGUvK3NOeWpjcnZwdWRmWENFcnV2L29B?=
 =?utf-8?B?V1JvT1BnNC9jd0FGZ1l6eHllUjNZTk9iYTlaR3FvMVhUaFk3UjBIdUlRVVda?=
 =?utf-8?B?NFd2TUxMWVk2eDk2QWg5TVg4cXU0NzNSeW9jdWJNVmR3bkRlTmt3VG5Hczcz?=
 =?utf-8?B?dmlrbkZBeWpla0kxblJBUTZBeEpoSGRKQzMxU3o3N1dSclYwREdUQTBXV2h2?=
 =?utf-8?B?Ti9hVTVCZ3JjODVmRno3cWYwMUw4NHk5NFZaUEhGR01wcU54K1BNMlZzeHps?=
 =?utf-8?B?MzZsbU1GcnJBeUozRXJpSmNLQmtnSVRvQnAyNU5CZzh5c012RjJmcEVoTjg4?=
 =?utf-8?Q?4D2BtTwbHMoR7miH5bUsLpQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c74f6cd-b279-4b22-bca3-08de15a15de6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 21:39:54.3982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkvhYoQGs3Qzv46qN2R3+JhbFA0ypALoDUYEA9louydRg8X9fjJxPdivgcvJKjuOUkATrTGoKMZ8oBGBqEbv2V8mIN5cO2DcMEJfVWRS2Ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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



On 10/15/2025 11:12 AM, Jonathan Cavitt wrote:
> On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
> Hardware-wise there's always at least one tile, and every tilie has a
> primary GT.  If something went wrong during init of tile or GT and we
> couldn't create/initialize the structures, then we already aborted the
> device probe immediately and we'll never get further on to places in the
> code that would be chasing a NULL pointer.
>
> However, there's currently ongoing work to allow the primary GT to be
> disabled via configfs for debugging purposes.  Once that lands, it will
> be possible for this query to return a NULL pointer.  This can cause
> problems in guc_g2g_alloc, as this process currently relies on the
> primary GT always being present.
>
> Instead of making the primary GT the g2g buffer owner, make the first
> GuC passed to guc_g2g_alloc the g2g buffer owner.  This requires keeping
> track of the g2g buffer owner in the xe device so each GuC can know if
> it's the owner or not during initialization.
>
> Note that the associated kunit testing code does not need to be updated
> to reflect this change because
> 1. The kunit testing code always runs with the primary GT enabled, and
> 2. Tracking the g2g buffer owner in the xe device is unnecessary to
>     perform the functions of the tests.

I'm not convinced this works without modification to the selftest. In 
the case where the G2G is already enabled, the selftest will destroy the 
buffer (see g2g_free) to create a new one for the testing. Both for the 
G2G_CTB_TYPE_DEFAULT subtest and as cleanup at the end, the test will 
call guc_g2g_alloc() again; in this scenario xe->g2g_owner has not been 
cleared but the BO is not allocated, so the code in g2g_alloc will try 
to do an xe_bo_get on a bad pointer. I couldn't find the g2g test in the 
CI results so couldn't confirm that this is indeed happening and I'm not 
missing something.

Daniele

> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h | 4 ++++
>   drivers/gpu/drm/xe/xe_guc.c          | 9 ++++++---
>   2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 02c04ad7296e..e17f8b84b8d4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -38,6 +38,7 @@ struct dram_info;
>   struct intel_display;
>   struct intel_dg_nvm_dev;
>   struct xe_ggtt;
> +struct xe_guc;
>   struct xe_i2c;
>   struct xe_pat_ops;
>   struct xe_pxp;
> @@ -626,6 +627,9 @@ struct xe_device {
>   	atomic_t g2g_test_count;
>   #endif
>   
> +	/** @g2g_owner: Pointer to the GuC that is the owner of the g2g buffer */
> +	struct xe_guc *g2g_owner;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d94490979adc..9790ddad606a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -465,9 +465,8 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>   	if (guc->g2g.bo)
>   		return 0;
>   
> -	if (gt->info.id != 0) {
> -		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> -		struct xe_guc *root_guc = &root_gt->uc.guc;
> +	if (xe->g2g_owner) {
> +		struct xe_guc *root_guc = xe->g2g_owner;
>   		struct xe_bo *bo;
>   
>   		bo = xe_bo_get(root_guc->g2g.bo);
> @@ -492,6 +491,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>   	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>   	guc->g2g.bo = bo;
>   	guc->g2g.owned = true;
> +	xe->g2g_owner = guc;
>   
>   	return 0;
>   }
> @@ -504,6 +504,9 @@ static void guc_g2g_fini(struct xe_guc *guc)
>   	/* Unpinning the owned object is handled by generic shutdown */
>   	if (!guc->g2g.owned)
>   		xe_bo_put(guc->g2g.bo);
> +	/* g2g owner is no longer valid.  Mark as NULL in xe device */
> +	else
> +		guc_to_xe(guc)->g2g_owner = NULL;
>   
>   	guc->g2g.bo = NULL;
>   }

