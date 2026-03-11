Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559491125868
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 18:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44F110E148;
	Wed, 11 Mar 2026 18:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXMUuUP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EF110E148
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773254945; x=1804790945;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=EyvZvusPJml2xeHGJ+aejH5LhypygNYfvjff9UJxOYM=;
 b=aXMUuUP9TBB+eoXlS/yqWJj3MgM0HC4aX4SJcog+J/K2q6SQY9lF+bvc
 pzJEIeJSzL3mVGoFMkOLgH6uBXWTH03KzeQQhuFyXvvgXfbhsDEPgq0fk
 npbb7ZDGyD4slQSC8nOBEaub+/FCMCMLPiJqnPpSAab8weMiC0NP5j9ov
 WUk0Kz7chlY/EqXZTTJGpVWE0DwA9DKgF6R8zWMDwFUfFlxCfGOl4qSwr
 Kh0fCWT4AXxAhGbGZcDA7XJRbSOE1ySqkbJwvEEnO9ehkygxjPl/QncF8
 wQglnaKqAv76QtaUKjjMXdhSRKEqXddbId6s8uRcPZd4jt50tguWYtefH Q==;
X-CSE-ConnectionGUID: g47/+9u0SwCT91JoxMhX1Q==
X-CSE-MsgGUID: IfyZ1VWpSByM3HMqWPBDMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74249333"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74249333"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:49:05 -0700
X-CSE-ConnectionGUID: ruV4d/a3SL6YEP9F8m4GxA==
X-CSE-MsgGUID: qfU+ri+0SKaILzQh1n4Vog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220510927"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:49:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:49:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 11:49:02 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:49:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDdmuce7WmRmPhVm6EvPKCe98VZXrKJC2CC61ezGMrLRa3cX9CITJ/mCPCOmLec4ApvN037nxhSTMUC9KaKuqDapWN990v65UPjHUPDgFtDS3XCIPhTuggAdT2XFTTf2b1XcTvH8UwxiKUhYXeq8eWYWS9KpdlTMpctOJXXeMmFfZ0jC5HaKUKzUSR37cXAtJMpdvn/9SNklojs7+28xwcbYsIMyDcc6GWc21hM75RNxaUJBhkhRBD5UhAf7xdeyDaiZhhXVpp15avZ9xHrlm5JjQH9Kt3Z5Ec9BAtoVDdPRejJquc71/48VdYLnjS1+gG1Nl3LWDIvBuq8/uUUScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uob+rtMCmIfZFjtGgK+b/pfgcPBNxxFHwLKxSA5yAs=;
 b=kH++CxQwPOXLCTZBd8k4CQAxiXtAPEPSb45FYWAnvWe9FVO9h41EUmvwidHnNOqhCa+vDW8ivVK0JZoNQl90OaOCOiU3rY530tNTGviM2zcwZh3YQWRo84/mj2SWzwcdiT2edobDafy5goFyGfU6T2UPrrk0l4PRNcSHJzFIHFRWltxrU9ny9PGPF+cXFH4XZaIHbMrwrstc2lua4sFnpHsLqY+DDK8TcWNDOHMj/i+NM7uYeeinZF6naLCfipFb75WVieLx8v8igLkh2O/8xg86osginYObLel7kO+NUxh6UL4neDOe4I4fhkHw5H5QicltdaWfcfPXyLdoIp+njw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 18:48:57 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 18:48:56 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/pat: Extract gt_pta_entry()
In-Reply-To: <IA1PR11MB62666C3DB0B6AE14CBBEB0A2E27CA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260303-pat-gt_pta_entry-v1-1-0dee8e1e7bd9@intel.com>
 <IA1PR11MB62666C3DB0B6AE14CBBEB0A2E27CA@IA1PR11MB6266.namprd11.prod.outlook.com>
Date: Wed, 11 Mar 2026 15:48:52 -0300
Message-ID: <87ms0e5hij.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV3PR11MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c4b50a-f358-4faf-4f88-08de7f9ed925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ejZ881Vil+EDVaIy5A9/aYZaw68R9mGqucrpXb99pljntayYkqDoVrJDXfFRR0SCWQ/q6zEdgQWzEGdKV1Qv6S5TFs8sLQ8Z6ycyS0SyPqoZbUdhDuMDCCREK3lgi+3NATDueMf0OuKhncjXiWtIdsMYL49TO7C/j9jLq4TCi56Lsvz1MQ5VxVWIB85Uiz40uqHTqxVfPghfp0KtLGf/wfyEcVU/AKwiw7dQCKggm1OygDHkZmKNGDiV7z296JlEVCIMv5cUFnNkh6w3+itZkCHGimrNXvr+/j3wOzQOc9NzQhGTUIbRPXgA0yvXJg7C2CKP29PWgUo5SPcshdaBWe3rZpnExOLQB9cYHpSSH3nAXVBjwdLG/k6l80BoGULeG8DlGBgzvYpLWm6h2DW+lbFp/OiIBrxT+3I9gj83B4rwAtr721sizqDRuTDDtl3RGi7ei7sFSPWTBH7UJMuJO4qP7XKD+m4fJFae/0Si41MFO0L0E+mRfFvYp4vqIbBrjGGm3+ESXod+SRDS7XPTGCb3HKDnlHFG/Ey6P27csuLZl1gSkXapvc7vR37xbO5s0rtLGNlqSc9qw9xaW7vxpsVVFF9bFL3e4LFmV3jl9n8pITqSbrZPLno4Gnixws415knphe3qDqnzvLXUneVtt2Ahg4RqNfeCqN8EALq+r0Qtee2kiPz3EcRAsUsARU24RvaAhzEjLJgRZl+ec/r/co/NKmoACZBETE6j5ytEunY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?micHYVZZV/f3VCecLr89lhCXIsazIb2F/svwizCxDN/znxx23e+Wu+8bKjEC?=
 =?us-ascii?Q?b2dwV1BbxG0b8KaPnN7m3F9vS1bdAOiWRW61CWohAtlQv4on9P7+w9C1MJ4N?=
 =?us-ascii?Q?44wmV4dxjt7o4+WlwubBNilwjL7wrVp5tNkqlR5nIpDLgdrD2152YQ/YdIWV?=
 =?us-ascii?Q?9U2ysI0L2tAps7gZRX+tPF+tz45K/Nzfb0m6oaECfO9RD4tUb4HaFlDwNWBZ?=
 =?us-ascii?Q?ylMOaVh3G8hd1+EGIEiaRll2y5xc9U6JiQcgov/WhMAIRfu8MR5OovjbArFx?=
 =?us-ascii?Q?o3qmiyPylDEoagM8g4mSCt8zx1NV+oSfVx7n4WaxK0mclY68dbxcbvLODUOw?=
 =?us-ascii?Q?1ZH9gGHdGZ2WmnS51cAyf4Ze9VeJS2JoJE4M6ZgfmcLXAsV4FORtmHk2N9+m?=
 =?us-ascii?Q?7Cd3hiXBOSVE7/wlZXTEz+BFofn4wAMS88UUIpJphD6VQm5c66VthLz7H4UZ?=
 =?us-ascii?Q?AqZ19nW0WCnqBoZfuPGed5/NYXlh/0kgvIHT5a4iTZcR0rK/gb7rTsoyqACo?=
 =?us-ascii?Q?BqEx/R8AZ6CATdU+RFLvWwiKG/IIDIwUMS066FB5y9I6xuaE5wqt6iQm7qMt?=
 =?us-ascii?Q?FzZAGZhPkrZNARWl1D7LQIaj79K34t2wOge12PyhbKTg4Mwik32XZ4kjJu6K?=
 =?us-ascii?Q?qYPD1N6Jdz4Sk5qZGA59te7E0MpLdw9AGf6PDOzMYYbbU8I0I4U3x6olMNrL?=
 =?us-ascii?Q?l9ai7rhwJDxH+2Rmp4+jSTF1iRXdqUpJdEORJQVWzGYC5WatNOGyTwsmYhqZ?=
 =?us-ascii?Q?C2VSK5hQxfA1rZkNtqm/8ERfyjIRYdQPWDsC1Jh8I84eQOKdw3uTRFH6rQA9?=
 =?us-ascii?Q?tSTrCyzCI9mMoRoC245ZWQal2h5ESSm87l4x3WhwfYwqKHVXQ0KK7bfQKpbI?=
 =?us-ascii?Q?XF3xsEErxiDT0voNDpddLLmyo0aoNts9xFGlm3VGXv8hOy4OjRFfP88/jRs0?=
 =?us-ascii?Q?6duZFP0xhcZXzkgjI4Ln/uKy6KMmXKGt17oW9DSHfIC3jCe86oiWU6zsamja?=
 =?us-ascii?Q?pvfSGeFLoSf9WBjGd+lMyE+5gnFBHWIlLYWaeS99ru+GLzsNxSa6TPkF9eu5?=
 =?us-ascii?Q?s0QMcXuJVIEKbnQOhW/zfh0/G/xRtS1muoH+O4nCkh81PIS7drP/Q7vCX7qP?=
 =?us-ascii?Q?PXZ8BlEE5EEwNFudtRnvtHiMVNTKXY0Vm1e94FjeKL25y3lIdpCHxvmeY6W/?=
 =?us-ascii?Q?+TCqTBJGjsPD9j2R9Ki0s9B+r9V0L2hZSGgRIpwKQxul5IzGFeJA4KhL9ClN?=
 =?us-ascii?Q?iCT0f/vo0rimr09OEow4+MeHwMx3rMabvJdJADwwKIL3RXHFYVRSbSKQk6VH?=
 =?us-ascii?Q?G4jUYsdwgUTWhTFC5kTF+K7kyY9ITD9ivCcp1oIIrcKg1zMthHCD0xswHCQO?=
 =?us-ascii?Q?AVIEv1120B27oQtO5005D2maI1fGbp48DuWdBnzGReJbzQkUx3Wdh/263dgp?=
 =?us-ascii?Q?KaPCpRr7uix/92VLNq22aFNtNdBIxF4Zn9jjgfMCLgNi/pLCOA7B6wMT3Mss?=
 =?us-ascii?Q?RK5AtLSenxLD7PPNKdYUboiKi10LB67sCCivN2eQeKuKfoAHW2mnf6TqYGBB?=
 =?us-ascii?Q?8iwVVHpQFWcEi3MpO9P1RCpI4tJXGmXetU8tTjCwxcko0+2MemZO2l1Js5fb?=
 =?us-ascii?Q?u2sDNxSgvRM1v06oT8g1PfxlkVynC4F2m3TTMZ3/mHoD7ZeWu2ctG87dzjD3?=
 =?us-ascii?Q?UkLasGaLWxhObvcsgLwTWlpEdUXIeQmUyNh52s37aD000knFDWBTGwLrzNGH?=
 =?us-ascii?Q?omzaz4M9lIn9g/XSbrd7lsWfxssvLNM=3D?=
X-Exchange-RoutingPolicyChecked: JmpMF4LFJS/k7gJ/Sj1ngKxcYavGpm3PCyYTikbgAxMghE/5jq0ZjGepu9+vUk7fWUUhr8qEq/qKlhvRalE6XxSkLlLJCK1CSaWCZDGjDqeqpEsIXAsHs7EEm5VvpUNZyAuhad2jokNj5gGKDgyuoZmNJ7eUso0wXTw1FcekC2+MEfo2UpEwpIcjekjFqdW3P3O2Pmi5iSfqoMG9VwKy4YTIr8p+Ge7J+wy3XaiBCn6JfatUO2TnI5FjIOf3mim26RBkOfSaNbMQIO27t6TuJFAc2o81b6gBa1B+eXX9VktjShEtZI2jnyV8JV5hG3N2vc4+jTemrr7HnN3tHDkX0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c4b50a-f358-4faf-4f88-08de7f9ed925
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:48:56.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzWkKll/t03b+2fQ6wyx8pWADKdgNiYlvW5Ucb9z3tfngALjs6aJySOn8UI+Slcvyv5smG+aEh25nQImzCYZVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
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

"Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com> writes:

>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gustavo
>> Sousa
>> Sent: Wednesday, March 4, 2026 2:16 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Sousa, Gustavo <gustavo.sousa@intel.com>
>> Subject: [PATCH] drm/xe/pat: Extract gt_pta_entry()
>> 
>> Avoid code duplication by extracting the logic for selection of the correct
>> PAT_PTA entry for a GT into function gt_pta_entry() and using that function
>> whenever necessary.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
> Looks good to me,
> Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Pushed to drm-xe-next. Thanks for the review!

--
Gustavo Sousa
