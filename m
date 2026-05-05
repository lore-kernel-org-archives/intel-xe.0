Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D52CD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 19:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B87E10E246;
	Tue,  5 May 2026 19:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKi8v1ow";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B0510E246
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 19:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778007997; x=1809543997;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l5ppTniS/mRZ2z1RH8lg8FCo3iGcZmT3iP5bMDvQjhQ=;
 b=TKi8v1owEGvu+eobPqIihx2d21OR9iv6uyM8cDJBBPsoSJQ7AIJ8WN7D
 ym7EM2RyXXDl7+wmLAoSTumhi4ydMTSBOWZ/0WeinbptC4QhJ2EwjFjns
 SuDyC1wPkKUTPVNOlK0jA1VRB2H/GjZ2JB0Fn0iDuZSK2NTjF/vkzo4HT
 fuPEEWV+wdKP5ZcvBf/vYzXuRgtARllKBBjlgOUtzP/bYP1vNwMtjl1le
 PexyIJ/Fn0kuQN82BT0wz/tkkjSa8uY+2d9HYiRpn36KAux3PLitfMbpz
 kCy6UfFqu5Mi/DROEt+FzItkZQZFkUZkfCXppPMv49slYEgp5F/yaKm18 A==;
X-CSE-ConnectionGUID: 1BsglyKtR+uUyf1OnJxl4g==
X-CSE-MsgGUID: ID4zD7yCTvyLYz+WLn15mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104345055"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="104345055"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:06:36 -0700
X-CSE-ConnectionGUID: FELnB0z1QVSgWoR8RPxYEQ==
X-CSE-MsgGUID: GggPv93JRdmTstZ3KJ3bug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="235025196"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:06:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:06:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 12:06:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:06:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWGLq9vlveysVRdvZhM54u8vm8/Z2DnE+/ouQE0DNFll/nu+VToeRQyJSLNdVx5TjJquxgPSk6sdI3zoi09NFnp1PJJexYtysD99ccr3ooP5VMpYHVp0rMaRyxxsQAi2vg1Td/1NOSc/8zJxvt1y+2JjrvOL9Bx5LIAUbaDthpyCzyzKkrFFs7eYAROxZdIGb7zeyTl3TxSCgEm8EhcinQhUW4x687P6eeh70xrVTPt6rh7bkGdKbpBNy7Eap+YNxkyxUAdBts5da8GjcGQIhosLuCKRwOc804vUBI/ltDesc6S3MMwsbmBwY6ff0jSuBewHa8uC59Z15SgWxZnjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5sy3lWJrM/MnYNjCJErxOtFMrVplhxt3Zk80zq7MLk=;
 b=BnQ72Lu5/jOLJMWvZJvBLOjFETNbXaDhrWRu3k+LBpg3Ez5HsZObcL7Flxu0ZlPTKSHDiTEEc6nUvaHXAaabzvU49uRu3TpY0pU6i5xBvTq7gvCSBeY/8HZZOSQ63UXptMB8cKQAxild4BaXYdSWO1cG4V93+WNk57iza8XkwdrmDdCAK6Xgk1RAYEPGNrgUExVsZte/TgBpgo7uZquMET11G3IuVnFKkra9cuH1vCBsWOsQp/GvZj1pLETSYVrrLsh6JIRESghMC0roL9x1+7XAmhF+U2Zab/HL9oYJEb10gknHdw4X25YH+DX9uCCkmYYsDTo2tvuD4/gwZGQFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH3PPFC852EF225.namprd11.prod.outlook.com (2603:10b6:518:1::d4c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:06:30 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:06:30 +0000
Date: Tue, 5 May 2026 12:06:28 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 9/9] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP
 register
Message-ID: <afo/tIsr7sc73EXE@soc-5CG1426VCC.clients.intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-20-umesh.nerlige.ramappa@intel.com>
 <aflxOe7FHs7NJqzK@nvishwa1-desk>
 <afov0oVqTg0dnjD8@soc-5CG1426VCC.clients.intel.com>
 <afo4PoS5fWSubxPg@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <afo4PoS5fWSubxPg@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:303:6b::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH3PPFC852EF225:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e23c52-1306-410c-920f-08deaad96a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 9e9lynALPsQY/ktLAoRg2LeRecWUvj51Yv6ue+k7v5TQ40N+xyeGbAdCy4bEUOrtDUyFtzOkS1VSooTqZzkziuMey8oN0Dok9yYvGpmb5pESBAAp/g75eljnJph8MrVBnIJaRgOmhP9s4PaBpoChsKXbNyUKLkb7rOM+meKpxL6QioYfW0eB67n6gZ+hbH0OFfTDyz7B7a07Fna0d0OHsPzBYeerqSwSv99fxPeJ5PFtBQzmh7N0xaR33IMgvnezUs05hkXaHd+McPjQfAhTmpM1TCl6KlIntsEL0zhn9WzEsz/WuQTjb8YuZxtsTG75QV9xTvsPoqVYCXV/RvrUMpqEBWMwIxn0etb18Hno74+EP9Dsash3FZED75NAn82ASorDyN0CSqdDtjicLyJlFfIsFKmjQSOi1IAqiB5YUrOyvjYMMIKF7fQPEQZrwx7oeaP3BH+9NZQqbeKD+b3WEL/k06gjpZVwNe2S+IX+mn27MRBguO3JqrJbPTHpk6lilStvYR47AWCZWpItk2cuJ6pR9HuQBYPANXg6b1nVoiHvrAEyylEEh5jMUAgdv6BgNToFRk4Usad9DN8p6hjl1hEjnfoegyEOSqq+wYc4HAmF0LAM9macM+JHCvKgLNMXCbFOm8tjBHN3gfikLoa73RjkcrgLcIaVWTy+89wI+TNAMgOUO5TtVpXmLxWD19mq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjUyOXBRKzNzcHc3NU9iZmVyelFUSThXR1kwWFVFbDRHWXZ4M2dBck1LSEs2?=
 =?utf-8?B?Q0RlWWdJNkk4NHRFZzhtSm9qV0JCOXZVYU5EWkV5Yk5tZXErcWxRbml1Mmxs?=
 =?utf-8?B?TmdDaGw4bGRQWCs0YUlDdzRpMlBWcUNPL0FMV0MvZDc4ZUVCTVVGcThzSXJG?=
 =?utf-8?B?ekkzMGs3MVR6RmFra01TKzlBM1ZYelI2NkFrOVhKSmJrSG4yTkRNM0JybWJB?=
 =?utf-8?B?M2d0eFZwM3JGTEJvb3RkS3VIY0RQTWVLdHVTZ2J1WEdpK2NkdmJuekNwRHpE?=
 =?utf-8?B?dkI0dUZ1MUNEMjgvTTFmT1FFbmRwdEQ1UlBRWGxwV2VReFRHdmwvaVBxVTJo?=
 =?utf-8?B?Q2M3cGZEY2hObGE4Y2htTUxkVFNoY1VweWRQR1FnczNOUGk0dWZhZmlqQVU4?=
 =?utf-8?B?RTU3WEk1T3ZKcklxRHUyWFc4ZnpZcnFtVVRET0tENHRyM3ZBVFNlUTV2Y3Iv?=
 =?utf-8?B?TmRXSFduVHJ3V1FEdlZsenBvcWUrMGRmRGtJaFVITWFPS0tCc1FqelJlOGNL?=
 =?utf-8?B?Q2hOL2lKWjJXUjZqc2s3UkZSTGZ5TGZ0V3VWd3ZGbk1qMDBXUzIzcFVZSTMv?=
 =?utf-8?B?R3VMKy9kcVBnRGI5bHBvQnh6U08xa2NxSUhNNENRZWd0N21INGhwUlhLWDVp?=
 =?utf-8?B?TnR4YklRc05hWVU4bm40L054ZG0yUEsxNi9BZU9aZllGSFp1RTVjcHV1SEtt?=
 =?utf-8?B?TDdpMFpTZzcrN3pzUVpvbE5scXRxaVVQaWpGMEh1YWxFa0c0OGwzZ2kwWmlM?=
 =?utf-8?B?RE5GSXB4TnBpelVuR3VPb0N5VHlSck81aW50eXZ4ZmdUbE5OaGlKNldBQU4v?=
 =?utf-8?B?R3lBQnVQclZQdlRLWFhINk1kcHhuUTVvTkNteGt2dk1TeVRQUVl2TGlFeFE1?=
 =?utf-8?B?QUFlU3dLOThJV0lZbnFtM0RyUndiUUJCMmFoQ3RWV0hKYjF2SEhwd1ZUT3BU?=
 =?utf-8?B?b1ZSQ3psVCtOQ0hiYlVIWHpoWE9JTytzK3NnYm1WbHZVWHFMRysvLzRZMXFj?=
 =?utf-8?B?eGtkZE1Sd0N0S0VBa1FDaERGWUVJSnNtc2g2V2hiTmlqTm9Rd0NQZTgyRVdx?=
 =?utf-8?B?aWFRQWpTR1ZiUjNIanQwWmpFOWU5bXNINTd1cDBhWXhBRVlGZlh3MEdZVjF1?=
 =?utf-8?B?c1luUCtVb2ZPOXNoK24yNk5SMHByZTZQUkhzeUtWY3VwdHNTVUdqZnYrbHBo?=
 =?utf-8?B?NzdvSmZwYkp6TTNhd1hueExTblZtOGl0YU9CQW9LbWxydHZINkRIUVJhVmNo?=
 =?utf-8?B?MkRLWUNndnE0NWRUcUpsUzV1VVFITml6bVA2aHVVaytWWm42SDhJQy9kSVNx?=
 =?utf-8?B?MmFMSDJGbFQ5TlZ4SE9kWTl0bno0Uk50SWFwZmRjd25rZGFUY2Q4dkltUlN3?=
 =?utf-8?B?S0hkdlZvTm1JbjJVZCs5UjN0WlJGZmpDMGM1TDg4aXlPenJCdklpd2trb1dt?=
 =?utf-8?B?clZaQVYzM3NGRFdiYlJnZ1FVVSsxcGJaQzBJek5KMkUxTGV3aUJJaHQzUmxm?=
 =?utf-8?B?bGNvOGJOaWdxOVdMQnZHaFgwQzFONkplN1ZUN2o5UitUMnpMOGRlMjJOOGR3?=
 =?utf-8?B?ZUhNY0Vtdm9kak81TVFaRVc5cjBmT250L2tHcDRrSEZOUW9XWUZsME5iMlls?=
 =?utf-8?B?aVpyQ0R2YlZZNmIwWEk5L2RTZThLcGp0b3NkRnRXZmdiYUdaeGlUZklvOVMv?=
 =?utf-8?B?aXNUYUxFRTA3UGVwQzdraENmWHhOVXNGOFhraGV1M0RtZ2pESXUyZnBTZVFB?=
 =?utf-8?B?b2k3a3pKTTR4YStPcTFVMHhubDFEUWZCS2pIREE5NlU4UmlNcWxhNmdQNHp1?=
 =?utf-8?B?aUhlVjNxZGZKVWdZM2FNSUFJV0ttQ0k4TEo1QzhyaVI1NWgzbUxaTEdkd1pS?=
 =?utf-8?B?ZVorYm1HOFFrVHJnTUQ5WHFSNmo0amg1Sy9KaU5xR0x6YVIyZnJYYUlqQisx?=
 =?utf-8?B?MEpYOThxQ1dYckJGYUs3V0NnVE1FdVppWk94U3JONk43ektVbVFwcmJ2dzZv?=
 =?utf-8?B?MkdoazRLV3RDNUFDd2poM1dRaWZZS29jd29USHFtekZNWjM2QjBYMGFPa1lu?=
 =?utf-8?B?c1ZNRnVBVXJWVk5PVEllQU5VNUJFbXQ5OEhXcFlmNzVtS1dLMCs1YTF5bTBJ?=
 =?utf-8?B?alE3QXpnV2lEY0c3dG5PRkhFU0FpR2hXZjhLUm1pR2RBS01KVEdDMDV6R21I?=
 =?utf-8?B?K0YxY1o5MGNvaVRVYzBEMlN6NzVOeERrZE01N2xsdkdpY05VOWM4S0ZORkdD?=
 =?utf-8?B?NVIrcmJ2WFV1U3Z3YmcyK0gvOWhrdWc0SHU3Q3RlZW1td2RBUElzU0dTWVN6?=
 =?utf-8?B?Zm53SlhkQlpqc20yR0xQc3IyWG5MaW9oNmZHU3NXWFJiR01KQ1ZmcDBUMFpS?=
 =?utf-8?Q?NWHWLa5tlRQAm6VgX5KlbhtqgR/ef9h+gOGh8?=
X-Exchange-RoutingPolicyChecked: OYbwWNuX2tJEMbzXU4DEi9OWfEpQMvrF1y3GXN6IZJozJZTzsxUqGmoY6LVBUyys5rz5U/+4EhHJEhqA8pOvLoogngfGGFWXyWSuSiUmC8C/6X8f967ELYlMdU+4LkVZKlUnew/aouBExMKaAQfnkKGvwXRHO6qMXCUQONXQbJlMFgFz1bB/9tI6FSyesWnnfWfJjvjOS5m2cF308vE8Ltx10WwtYeEY0B5anj+8ePnF31hg3DoHiKa8S/ELTGhIO2HHFHBWgaI7mBgJElr+Jvco3YmyvsUqSxrUe62Qyf0ZlblyObkcERmClcNOZFRcWElg/TcJSbF/E2M0Ju/2qQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e23c52-1306-410c-920f-08deaad96a4e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:06:30.4101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5w0ccg1qQFN/vIUGeWwKrbkxAgrcm9LYIwdsd8KyXThB2Kyp48yeAWNwv5KiJlX420rlB0+Di45g8Z3x11FRJPWksjjkhzJ63OHeT+cgZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC852EF225
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

On Tue, May 05, 2026 at 11:34:38AM -0700, Niranjana Vishwanathapura wrote:
>On Tue, May 05, 2026 at 10:58:42AM -0700, Umesh Nerlige Ramappa wrote:
>>On Mon, May 04, 2026 at 09:25:29PM -0700, Niranjana Vishwanathapura wrote:
>>>On Fri, May 01, 2026 at 05:53:42PM -0700, Umesh Nerlige Ramappa wrote:
>>>>In a multi-queue use case, when a job is running on the secondary queue,
>>>>the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
>>>>the QUEUE TIMESTAMP to check how long the job ran. For user space to see
>>>>the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
>>>>register.
>>>>
>>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>---
>>>>v2: Whitelist QUEUE_TIMESTAMP only for copy and compute engines (Niranjana)
>>>>---
>>>>drivers/gpu/drm/xe/xe_reg_whitelist.c | 14 ++++++++++++++
>>>>1 file changed, 14 insertions(+)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>>index 80577e4b7437..37d6ac720d5c 100644
>>>>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>>@@ -33,6 +33,14 @@ static bool match_has_mert(const struct xe_device *xe,
>>>>	return xe_device_has_mert((struct xe_device *)xe);
>>>>}
>>>>
>>>>+static bool match_multiq_class(const struct xe_device *xe,
>>>>+			       const struct xe_gt *gt,
>>>>+			       const struct xe_hw_engine *hwe)
>>>
>>>To be consistent, we have used 'multi_queue' as naming convention
>>>and avoided 'multiq'. It would be good to keep that consistency
>>>everywhere.
>>
>>sure, will change that
>>>
>>>>+{
>>>>+	return hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>>>>+	       hwe->class == XE_ENGINE_CLASS_COPY;
>>>
>>>We already have xe_exec_queue_supports_multi_queue() function 
>>>which does similar check. I think we need to abstract it out to a 
>>>single
>>>function and use that instead of multiple places in code that
>>>determine whether a class supports multi-queue or not.
>>
>>The whitelist is applied during engine init at driver load, so we 
>>don't have any exec queues yet. Instead, should we derive supported 
>>engines from xe_graphics_desc.multi_queue_engine_class_mask and 
>>check?
>>
>
>Yah, xe_exec_queue_supports_multi_queue() also uses it. So, may be add a
>xe_gt_supports_multi_queue(struct xe_gt *gt, enum xe_engine_class class)
>in xe_gt.h and use that both here and in xe_exec_queue_supports_multi_queue().

Oh, I didn't read your comment right earlier. That's what you were 
already suggesting. Will do.

Umesh

>
>Niranjana
>
>>Umesh
>>
>>>
>>>Niranjana
>>>
>>>>+}
>>>>+
>>>>static const struct xe_rtp_entry_sr register_whitelist[] = {
>>>>	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
>>>>	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>>>>@@ -54,6 +62,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>>>				RING_FORCE_TO_NONPRIV_ACCESS_RD,
>>>>				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>>>	},
>>>>+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
>>>>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_multiq_class)),
>>>>+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
>>>>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
>>>>+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>>>+	},
>>>>	{ XE_RTP_NAME("16014440446"),
>>>>	  XE_RTP_RULES(PLATFORM(PVC)),
>>>>	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
>>>>-- 
>>>>2.43.0
>>>>
