Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E509CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B1410E38C;
	Tue,  7 Oct 2025 20:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evyXp7x3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ECB10E38C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870183; x=1791406183;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=VbZ6FqD7JhBXEWEzVM08V8oXryVDBnezebNew7ZDqlE=;
 b=evyXp7x3c7VzRuKoDkVnLspiBBCURg94wrKsTm9PRQWsFEmUpah6S2rV
 2ZblvaveNX11g9WeUyD72mahXfSHJX/esLZTzMMsrzKqVLBgATXViep8h
 s+yJjalz773ZMnueSfmC5cxktVuWHfjLJOKEqmPK0NxrHNwu2pJ0M2xRc
 e7+5Fa3HrOBL7X3kKeSzl5y06Ux/gEfpAmowfi0e1hDJJx416tRXDMxZM
 0y8RXyHHYRgC2xwN2SU4pM9egMHs41oB+eO8n9SH926c8B15G5cTDKFTP
 C+5BpoOuyanVptj46+IUqgDYywBmuWHfgorwWInDv5/yr62NhEFiOLgzq A==;
X-CSE-ConnectionGUID: yEzWnb47TU6lWcNokNOjUQ==
X-CSE-MsgGUID: dNRhgdXNTrOxtpcCG3RR+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73406903"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="73406903"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:49:42 -0700
X-CSE-ConnectionGUID: OEfsCehaRlSuSlsUkp+0wQ==
X-CSE-MsgGUID: xEope0ORR4GHo+nlAtk2EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179382295"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:49:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 13:49:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 13:49:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 13:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN2vajBd0ZUrjKHfp5B9ApPKtVSs+TsXVBnn+rHJwPtMqFs4IqerhWldgkRaeluyNQOPNjvznSXwdGt6OArvI/H2SdHO2Xheuwz6uye/zxMKjDRORZW3iyExTLkWCIBqf1KCjhpPRsMA+oK7e48gtsp8Qa62kH6//c2slwA/fFl6jHlGTmdZ06tjm/vXd3i75eunibGNvrLA+lHaDHCuq4HJ4BLqtTNpa9XCeNrtekr/AUNkFAEX9Ql1b54oQzMi9TNpzWT4B2N+gq2yZDsSX68WNCLYM2gid9b+m5rX0jSiOqD3WNKnYxigtuShw0ZFw6RHjbrwLeDKeMlBakMBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKnFKu8j0985jy5r6BzsaV8NdxCcOlFfNHBVgieHKew=;
 b=C5u8Lhux6DZs5zr/Z/Duywn77/LnTeLgtZz5JhYPXCOsCuXqQOW7gOtDFKTPXDPFDr+m78Ji2iUjbi/rUS4MdYQ6+Px98tmZFlgG2aRPOrVakIkLx6UtWuQQnHjdk8bihmSuvb4D4TOtqT+u1dz4f+nI9WaP3a3/JqtnhJPS2iUg0cwTDVvakQmqZMB9G5nVL4IrEGR8cwHj/Ri05ZQ7m9K5dJ/S4j4PxSgKM6hNghfeNSC459UGdeeknUcTh20btS64FzrRaU9KULCKZuV+Bl0kP+Y5FC1cPeDLwv+4sZbHil1YaVX/rr7cRFZev17qIc3j54L/Rgpt9hS5IXSxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB8966.namprd11.prod.outlook.com (2603:10b6:208:572::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 7 Oct
 2025 20:49:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 20:49:32 +0000
Date: Tue, 7 Oct 2025 13:49:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for VF
 migration redesign (rev8)
Message-ID: <aOV82MObgHWZ3roJ@lstrano-desk.jf.intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
 <175985652442.14049.6564168347119130275@6aec98b87f92>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175985652442.14049.6564168347119130275@6aec98b87f92>
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9bb4c9-1784-4240-1d72-08de05e30455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?McdlJQq+nHmtQF0a9TGuWpY1N95IaVyTkBALvHIaP18evtkFyFjNx3oudxlE?=
 =?us-ascii?Q?TGOR8OX/qWoO7kXEjyplTuAH/5d/V4Gi8NMPiC3NVJAu3Dh6uTHMVjMq8OsD?=
 =?us-ascii?Q?nMe1CY7LFbCuV94zTW/aEg5m6iGCnaILpwFZa8ZvP5Nc/FKaWlcv88pkK1Wb?=
 =?us-ascii?Q?Aw0Ca7Lh4/t7Tc3u0Y8946Nv4qJNCpTVtejTuWSGgFSJfvlfe7P8d999lxlA?=
 =?us-ascii?Q?5LfVNqG9GB+jRDhHsGpTYwmRqP0fuUpu9twVcVtxOhe7Fc5nJxE/UdnO0hny?=
 =?us-ascii?Q?IbE/ILBwi5cQI87nK8wdirZQyruIp/khOYq0Ws9U042yRSQFy+QrZWT/1CTv?=
 =?us-ascii?Q?I/mvyhuxR7d7x7LjeMInDZjnRcTnqsJFXSiVNBLCLBQ1l/lXdC43kuURBp5a?=
 =?us-ascii?Q?Ih9t9yVi9qMocsIcguCqe7CcFp8A07xsYP0A1Nr16N1NN5stZDR+HYlXrrgo?=
 =?us-ascii?Q?CB/FAsDQmX+yhIrfsZGWmEzDtVeX+YrszJRkLM4tfSBV0qS42XDd+2ukZnIy?=
 =?us-ascii?Q?s3lhYjgvu057lyI6g16fo7nL62jilt41nUxkoBzqxfdhtsU+GBUOyORkKUMp?=
 =?us-ascii?Q?a531wLI3tWiq7yv2lmlrl1nh4xYykIFN4HaaSe8iaVmEkxNcu/CWbDgWTOY8?=
 =?us-ascii?Q?dr3TSUxQ30B8HkB1kFj65CHVE/LaeqWVsgwhSdguLZxuIWATXh3uqNve7lNd?=
 =?us-ascii?Q?dkMPtwKEaPzJbDUa7jE4/0EZubbvwTofjxS1NEmMX7Td4pn5Fxc3QnNfAqaV?=
 =?us-ascii?Q?3bVeOQcM7P6qbxNhzPMYR7YSYyFPp1gblI+JS8eayrWy4mQZHDhQr6FVqOXX?=
 =?us-ascii?Q?mdWUKmPbXjiZF3E1b2RTMDb5INmNJRMyJGUgMlc+z+X/kgq3DcT8FfmnRPyS?=
 =?us-ascii?Q?6n9o/EEkIrcKj6zezKyGEXPSID7dBwgAbd33oKmLoDWJk1+PmDM8bP127WGP?=
 =?us-ascii?Q?YYZYU2wxRRZ6PEc4ZCGJC3jBBGo/hxl3kjM24Kc2FTOSh16hfaCjjSMmthD6?=
 =?us-ascii?Q?QR2Ova9ZA8b9/dhpcXhHRa8xW7e7wWSFRlZrkiU2C5mnQh3nOi1WZ0K6wMQ2?=
 =?us-ascii?Q?LYCg2Wh1CJVzK9h4JDVz6+Z0VoK0QlfMZjKADLR7fN+/NJ5Jv45tmKbz7ytp?=
 =?us-ascii?Q?hDr9elE2L1vqgIVDedneU6ZE6Hsd2yVic0geHBHvIdshk1ikpPQm37jG6HOB?=
 =?us-ascii?Q?ikDCcbB9UJKcLirDq22v8Thl1gAWNonGl0xOpaYfqj/zycYKLbDJ+gf3r0bH?=
 =?us-ascii?Q?yUomYbjk/KcRKiMCB1nRwILK5Bf4bAy9t4amf8nQskOTXtA6rk5bQvzDhpqU?=
 =?us-ascii?Q?eC40tIzT1JDL4IuZFIIvW6lerB9ap3TUH9vwUXk+s9CX2KcT5iRkreLZIqJG?=
 =?us-ascii?Q?LONeeuu6wXguoGwgHf1wG3erSxPmefBNH7hlIQZtbS9jOAMvMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKXLRI6/KRTRNMPLKMkK5DdC8A68Uoo/+Z0mIK0KrY8db2onfOt9+wSA/d+F?=
 =?us-ascii?Q?ACWJeq1L8cQePcRylHcs/pxF0EjK0J80TfJB8qLTakvdlPL04DC2J4u9CTDq?=
 =?us-ascii?Q?hPv4m5JDjaRcgPXScjqcc3yDs+8uwUEe9JWqNL9z34Z6hdXoS5N9a7NjgGa8?=
 =?us-ascii?Q?xvBnIFF2MQJSfeZ9v4u4q3cNe2A+5HPwsReEAjMyJFNRMccwr319whKFLf0Q?=
 =?us-ascii?Q?oJMdIZJGELS/7W2Ovzt+1ifRWaX4wtRj5GrDbLG/JfisLzbxLZC4bH+ISJ5y?=
 =?us-ascii?Q?9vqWBO+NDAYLtN8lAHz6x3EOQKKNmmC0xTAf0ZNdbIUfx5ZUjWBiSpYNRWn+?=
 =?us-ascii?Q?8ivf/qRz+u4crhz7b4YlsbI0ft0GDP6oX45s/AH7HfTP8pCd0HsO2RtUlFIz?=
 =?us-ascii?Q?d5+YD9es+67vqKjHMpqiD0d3zvDEiFVzYpmXIGBOZ5L86z8KnAGRQ3cwZNCa?=
 =?us-ascii?Q?b5XlAkPKjlo+Nw0vk1lTAobizd1KtPsRQTb33ububBrEVlJjqOSvuwpsmxoc?=
 =?us-ascii?Q?R9E4TuhoLPHxYze3t2uWJAr0k1RuU28wVN8NSozFvq4QkzITTs0x+gpxJMa2?=
 =?us-ascii?Q?s7yA77HEKdz8rWdXa9Apta4m2Ox4SYlfBAC8AVC+1kRMcg4fkX9qYiqzHyKv?=
 =?us-ascii?Q?UNMOE9Btn8sXpsSy0xSw4DgRcy1YpHehF15TH6Dg1e5St3Ww68TN7ycVJw4v?=
 =?us-ascii?Q?lIGQKg2kjqeP299Q2vTkGlIHz4dGlYBihJwfO66WzYdmZb4xZm47kcnlOxJJ?=
 =?us-ascii?Q?eZdglYodkP6swm4+goj16JGllUutKVsfEHDyPuwxt9EfhxOQxV9NXDFjpbfG?=
 =?us-ascii?Q?WcqwbzdafjVhWb2wpV0tfMK1YF2NnNkJcPo1a0ZdH2FYTsLHg8v88Rkq9Gce?=
 =?us-ascii?Q?/x02Dv1ZqNdK+iwiC+nPxC7A4Q9CwVyu5qe0sTkI+nckCou7VFhrKXY9gD8b?=
 =?us-ascii?Q?6/Y9bpir31uO20MDFxNLcuO/Z3yG9+ArQduGz7z0RQ0BIklVUKr3WkAo/Jzg?=
 =?us-ascii?Q?9QZFhrorg6ZOwXmK9WvGgMAXVrliGD3hmYIDWC+NRNweC+tfRNorPTXUSdNr?=
 =?us-ascii?Q?cbpGgY4ceg73W4vcxgvgQXqyahZUIiczMLu6GDCO+CYlIbjDPiL9GetnCqt1?=
 =?us-ascii?Q?L6iecrniKJgy71TfjicGmvHMhTxcaFA3h1w5ODhDj51+E+/DvPQr3SvFn7Q3?=
 =?us-ascii?Q?AG5YnLNYLeuYFbMpCFUu8NNum7wmZ7oIY4VAPnpOkyOmq3QpFOhDeVz7aCOt?=
 =?us-ascii?Q?6TomP0d2LDe7+pkPmnY5l1ii3Jt6bZnPBlvbRZmQuSYKmK3Xz9EUpXfpVQZA?=
 =?us-ascii?Q?cCeg5Ex/wX/10CGXzKaPfknjr+rNOw/LHk3Oet2p4/OHvqXRoWTR7kKOKD6y?=
 =?us-ascii?Q?BVIS+lozoyUz+vu6lAwTZjxEiGQwKCXJNPKy6Ti4Okgzgo3H2SEqJrrs0EFN?=
 =?us-ascii?Q?jVVs8VI/DM/YJ4FVICTKird6tXuPpBjfBBm/XUn/IEsLSWuSdEe4WdXBx6ZO?=
 =?us-ascii?Q?PETA4M/QTTFRQEuKn+N/zQPOFAIHmoyMCV5HBRBpqq4XZr/45tMgb8zGO9ky?=
 =?us-ascii?Q?/YVUQlUdgbQ24PKxNhvI5VVqszKPh6BcNMbe6WmbQzCkBKWk7ADJrFzQnL1s?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9bb4c9-1784-4240-1d72-08de05e30455
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 20:49:32.8244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdHP3BtHZEMyPrvKp6dem6MoE2KQQmtntntvqItkCuJ6cxZOX+IHqdFx+9/O+/FKU2n3VLvT2mrR4OSlGgO36A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8966
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

On Tue, Oct 07, 2025 at 05:02:04PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: VF migration redesign (rev8)
> URL   : https://patchwork.freedesktop.org/series/154627/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3_FULL -> xe-pw-154627v8_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-154627v8_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-154627v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-154627v8_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_compute_mode@non-blocking:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-3/igt@xe_exec_compute_mode@non-blocking.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@xe_exec_compute_mode@non-blocking.html
>     - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-435/igt@xe_exec_compute_mode@non-blocking.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-436/igt@xe_exec_compute_mode@non-blocking.html
>     - shard-lnl:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-lnl-7/igt@xe_exec_compute_mode@non-blocking.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@xe_exec_compute_mode@non-blocking.html
>     - shard-adlp:         [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-8/igt@xe_exec_compute_mode@non-blocking.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-8/igt@xe_exec_compute_mode@non-blocking.html
> 

This is expected to fail, I have a fix here [1].

[1] https://patchwork.freedesktop.org/series/153082/

>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-adlp:         [PASS][9] -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>     - shard-bmg:          [PASS][11] -> [ABORT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>     - shard-dg2-set2:     [PASS][13] -> [ABORT][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>     - shard-lnl:          [PASS][15] -> [DMESG-WARN][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> 

These are a side affect xe_exec_compute_mode@non-blocking failing and
OOO killer running or jobs taking forever to flush out as non-blocking
will create millions of jobs before OOO is hit. I think this is an
existing issue, looking into this now but IMO shouldn't be a blocker.

Matt

>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-154627v8_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#623])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][18] ([Intel XE#6054]) +3 other tests fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124]) +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#316]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1124])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#2191])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2191]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#367])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#367])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +160 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2907])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2669]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#787]) +26 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#3862]) +1 other test incomplete
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#6168])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][42] -> [DMESG-WARN][43] ([Intel XE#1727] / [Intel XE#3113])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#2907])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#373]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#373]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373]) +3 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2341])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1178])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#1188])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x85:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#455]) +15 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#308])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#308])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#309]) +3 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#309])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2291])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#4294])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#4422])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4422])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#310]) +3 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2316]) +5 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1421])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#301]) +1 other test fail
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible:
>     - shard-adlp:         [PASS][69] -> [DMESG-WARN][70] ([Intel XE#4543] / [Intel XE#5208])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-3/igt@kms_flip@flip-vs-rmfb-interruptible.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
>     - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#4543]) +6 other tests dmesg-warn
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-3/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-rmfb@a-hdmi-a1:
>     - shard-adlp:         [PASS][73] -> [DMESG-WARN][74] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-8/igt@kms_flip@flip-vs-rmfb@a-hdmi-a1.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - shard-dg2-set2:     [PASS][75] -> [INCOMPLETE][76] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][79] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2311]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#651]) +4 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2312]) +5 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#656]) +15 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][84] ([Intel XE#4543])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#5390]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1151])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#658])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#651]) +11 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#651]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#653]) +12 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#656]) +8 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2313]) +3 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#5672])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#653]) +5 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#1503]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-3/igt@kms_hdr@static-swap.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_hdr@static-swap.html
>     - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1503])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#4298])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-433/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#3012])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][100] -> [FAIL][101] ([Intel XE#616]) +1 other test fail
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][102] ([Intel XE#616])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-435/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#734])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#836]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1406] / [Intel XE#1489])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1406] / [Intel XE#1489])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_psr@fbc-psr-primary-page-flip.html
> 
>   * igt@kms_psr@fbc-psr-sprite-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +8 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-4/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1435])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#455]) +7 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@xe_ccs@block-multicopy-inplace:
>     - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt:
>     - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#455] / [Intel XE#5632])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1126])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_eu_stall@invalid-sampling-rate:
>     - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#5626])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@xe_eu_stall@invalid-sampling-rate.html
> 
>   * igt@xe_eudebug_online@reset-with-attention:
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#4837] / [Intel XE#5565]) +4 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@xe_eudebug_online@reset-with-attention.html
> 
>   * igt@xe_eudebug_online@resume-dss:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4837]) +2 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>     - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4837]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#688])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1392])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2322]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-dg2-set2:     [PASS][124] -> [SKIP][125] ([Intel XE#1392]) +5 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@xe_exec_basic@multigpu-once-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#288] / [Intel XE#5561]) +8 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#288]) +10 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][129] ([Intel XE#3868])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_exec_reset@cm-close-fd:
>     - shard-adlp:         [PASS][130] -> [DMESG-WARN][131] ([Intel XE#3868])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-9/igt@xe_exec_reset@cm-close-fd.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4915]) +96 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-433/igt@xe_exec_system_allocator@process-many-execqueues-free-race.html
> 
>   * igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4943]) +3 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@processes-evict-malloc:
>     - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#4915]) +99 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@xe_exec_system_allocator@processes-evict-malloc.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4943]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [PASS][136] -> [INCOMPLETE][137] ([Intel XE#4842]) +1 other test incomplete
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2457])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#6032])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   * igt@xe_oa@rc6-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#3573]) +1 other test skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@xe_oa@rc6-disable.html
> 
>   * igt@xe_oa@syncs-ufence-wait-cfg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#3573]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@xe_oa@syncs-ufence-wait-cfg.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#977])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1061] / [Intel XE#5568])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#5694])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-5/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2284])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2284])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pmu@fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4650])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html
>     - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#4650])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-4/igt@xe_pmu@fn-engine-activity-load.html
> 
>   * igt@xe_pxp@display-black-pxp-fb:
>     - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#4733])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@xe_pxp@display-black-pxp-fb.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#4733]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
> 
>   * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
>     - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#4733] / [Intel XE#5594]) +1 other test skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic@atomic-plane-damage:
>     - shard-adlp:         [DMESG-WARN][152] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][153] +4 other tests pass
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-9/igt@kms_atomic@atomic-plane-damage.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-3/igt@kms_atomic@atomic-plane-damage.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [SKIP][154] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][155]
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][156] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][157]
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#6168]) -> [PASS][159]
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][160] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][161]
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [SKIP][162] ([Intel XE#2291]) -> [PASS][163] +2 other tests pass
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [SKIP][164] ([Intel XE#4302]) -> [PASS][165]
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [SKIP][166] ([Intel XE#1340]) -> [PASS][167]
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-bmg:          [SKIP][168] ([Intel XE#2316]) -> [PASS][169] +3 other tests pass
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][170] ([Intel XE#4543]) -> [PASS][171] +7 other tests pass
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-9/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-3/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-dg2-set2:     [FAIL][172] ([Intel XE#301]) -> [PASS][173] +1 other test pass
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][174] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][175] +1 other test pass
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [INCOMPLETE][176] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][177] +1 other test pass
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
>     - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][179] +3 other tests pass
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-bmg:          [SKIP][180] ([Intel XE#1503]) -> [PASS][181]
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_hdr@static-toggle.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-3/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-bmg:          [SKIP][182] ([Intel XE#4596]) -> [PASS][183]
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [SKIP][184] ([Intel XE#1435]) -> [PASS][185]
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][186] ([Intel XE#2142]) -> [PASS][187] +1 other test pass
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1392]) -> [PASS][189] +5 other tests pass
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-adlp:         [DMESG-WARN][190] ([Intel XE#3876]) -> [PASS][191]
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html
>     - shard-bmg:          [DMESG-WARN][192] ([Intel XE#3876]) -> [PASS][193]
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [FAIL][194] ([Intel XE#4819]) -> [PASS][195] +1 other test pass
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-dg2-434/igt@xe_pmu@gt-frequency.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-dg2-434/igt@xe_pmu@gt-frequency.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [FAIL][196] ([Intel XE#1178]) -> [SKIP][197] ([Intel XE#2341])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-4/igt@kms_content_protection@srm.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_content_protection@srm.html
> 
>   * igt@kms_flip@flip-vs-rmfb:
>     - shard-adlp:         [DMESG-WARN][198] ([Intel XE#4543] / [Intel XE#5208]) -> [DMESG-WARN][199] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5208])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][200] ([Intel XE#2312]) -> [SKIP][201] ([Intel XE#2311]) +13 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][202] ([Intel XE#5390]) -> [SKIP][203] ([Intel XE#2312]) +8 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][204] ([Intel XE#2312]) -> [SKIP][205] ([Intel XE#5390]) +4 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][206] ([Intel XE#2311]) -> [SKIP][207] ([Intel XE#2312]) +12 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][208] ([Intel XE#2313]) -> [SKIP][209] ([Intel XE#2312]) +10 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][210] ([Intel XE#2312]) -> [SKIP][211] ([Intel XE#2313]) +11 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][212] ([Intel XE#2426]) -> [FAIL][213] ([Intel XE#1729])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][214] ([Intel XE#2509]) -> [SKIP][215] ([Intel XE#2426])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][216] ([Intel XE#3868]) -> [DMESG-WARN][217] ([Intel XE#3868])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-adlp:         [ABORT][218] ([Intel XE#4917] / [Intel XE#5530]) -> [ABORT][219] ([Intel XE#5530])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>     - shard-bmg:          [ABORT][220] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][221] ([Intel XE#5466] / [Intel XE#5530])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5568
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
>   [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
>   [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5632
>   [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3 -> xe-pw-154627v8
> 
>   IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3: 7a5ff57e5407d9eb2e746b9031fff58dce7af5f3
>   xe-pw-154627v8: 154627v8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v8/index.html
