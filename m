Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1727CFD2F6
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 15:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB9E10E159;
	Sat, 29 Nov 2025 15:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfbKRsSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26BB10E159
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764431722; x=1795967722;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gtv5rlqAswn9NHIrqI319UTmcpx4tObqjMgQEG/Oaak=;
 b=HfbKRsSgcgIPLXGTxwLO1CT2x58FA7TcEAm1x/KpTwoIvJPTlTfUypQ6
 QWHWkzum+kNj3GR8G8TlS+D2EZG29ZoOCZbTvOtNi7A4Q5MkHU+BhP+7h
 QQM5XCAVDOopjQfyOhEa8wlHvKEcs3gyPfpCcKQcVXl7MYOKR87ktV1DA
 Sk5llykz2+4DPAKWKCfJ7SU5F/Qy6OL7ll3J1gb2Ki7V96RHlUDMPFsJW
 ms3HTSthELW8eo33yoOxro3qdbT1BEw2n6hDWnHht4UJCY0lhjegMNZ/g
 zSg0UKUVDii11VaW2PRLT+rk/A8uWbCtZ0uO/sQy/hoqrXwG94Nkrnaul Q==;
X-CSE-ConnectionGUID: eQoV/R92T46rouIy+FzauQ==
X-CSE-MsgGUID: JKD/SIpASh+HYeg5DRwyuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66317934"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="66317934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 07:55:14 -0800
X-CSE-ConnectionGUID: Zj8499l9R76ciyiD1Y7zOA==
X-CSE-MsgGUID: d4b8FbKVQfeZ+XAIdCKS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; d="scan'208";a="224377390"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 07:55:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 07:55:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 07:55:10 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 07:55:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bF+e0xibCMyJ1t1zwUkmybq5UgKUWPbiLkJsIedSx8mLCFq1crqGwDgCFGjpOAb+7o5AW3a+hgrhftj6+/Wi7GYXE51hB0e6MH7weTLwqI3x60q7V/wmAezGGtvF0w7bRarz6nhyvxCZi3UoIRbYG5MCPNfeyznB20XMyf/INkAbbTXI/6sJNJT6xkSnnjqHwRuNBbSBy8AIe7DLOPgGPywy7dZCKXem2tJ6IV6l7X0GLKxvbFNZK61Bcz4OnmdC7ReDQ8sxMi7reUyy5zMv9M6fINr4m02SfZfWuKz35ZAyUHtEl/IID72GVuUfvsB65V4b6iYZAiw91bB6s+Ez2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FKIMqp/5kq4gvpD5UnjNkp8PKjb9B12bmV1WsKYLDA=;
 b=MbLk/+33xndcjh4VU8no/f7wEWuvvVfOYLTaSekN4votSPO8g1q31iV/gNbRXp6Oh5HoN/1odHhUR7yxJMrxzASoBvRmnVSQc/srYBaiJkFYbTLIaVPgQgL6CiSbv5UJjsEhM0/+i5IRq3gyZteW5n+xUB5H8aH4YFUiX6ybstSATBvN0fobC5Pvkce8xna1LoJmuxUTk6lXId8zqHrTxGKBXlx42APsUyopCftcqRWtPOdo+KvIt7BDujNQMssdUJlRhTRpneAUXMbowDUui56LrFx+KIV9mfU4q4wLuYWSt2CWW2Atj5Q1Qw4iUS2UcEk9UPlCaLjwHW4Z/eAwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 15:55:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 15:55:07 +0000
Date: Sat, 29 Nov 2025 07:55:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH] drm/xe/bo: Honor madvise(2) advices
Message-ID: <aSsXWDSOVnI4V2jG@lstrano-desk.jf.intel.com>
References: <20251128104623.32742-1-thomas.hellstrom@linux.intel.com>
 <dd0ef25a-1fc1-4f7e-8363-74d4c660f71d@intel.com>
 <aSoNkE3dldrSbbF9@lstrano-desk.jf.intel.com>
 <b7c3969245a5db71ced0c3aadc52c9531e68141d.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7c3969245a5db71ced0c3aadc52c9531e68141d.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:303:b5::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: d3493d87-e79d-438b-2984-08de2f5fab3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bUHT8dWWuLDHPusmAF33WKMxFWSXFlncRFS+nj9RrbWRT/RVETU0FC82wx?=
 =?iso-8859-1?Q?ICL7/blckXp+DDjVinG3dsEunzVwH1omKUrz+pcbPoAM9I/y11fpWyuX/s?=
 =?iso-8859-1?Q?lhq141btL1FXUz0aC+v/gYr9YgJMZfLph4JbzgHCPYoC7e669WBc1xF2Fg?=
 =?iso-8859-1?Q?QmfTOJtBLA1WKT9rE8WbCVfWfGzOSKh8Gcnk3ruXe+Moce28ANenfiggF+?=
 =?iso-8859-1?Q?EDjgBi7I1DTZjQMpyQE/9MZxaHlfRiqNExGfyo0Rp1P+cdMkiCaB0sJ+c3?=
 =?iso-8859-1?Q?5MdoC430l1ZtGEoCC286BTGq8y5GCAxfHJiV0YsmrRp7lW+HQ7bhIWO1U/?=
 =?iso-8859-1?Q?LWjjxINvkxs/o94XA+euqHGUNyvB4m4QlU6uByWgpvYFW47gAbB8idKatw?=
 =?iso-8859-1?Q?AGrMTe2Vw3GCjwTJURCdEJTaTIfQygxn22Y3Fh/B2WaJzSnEJLGA3KLOVK?=
 =?iso-8859-1?Q?8WeKEmeCm4/MAKPJVej6LFXb/Wvb9yUds5dIO70gPmHg1zfXkacbvvzaIm?=
 =?iso-8859-1?Q?VbnLq8XxUDHDgI/dCSD42rWgYtJLuBHjQOIpdGQBp9SvevxKvWNhwFj0ZL?=
 =?iso-8859-1?Q?NsZcqlNmanprAcdTd1wyG+mnMkoECOT2E1l8V3o9NGXFJRxvagKsgHqY5/?=
 =?iso-8859-1?Q?IkQjYAoMVFvI2XqhW431qV1XlSegcfzTx9AATeIIrE6RRiaavWu+iFK1Iz?=
 =?iso-8859-1?Q?R11Sv7nnRVUuPUapT6eA3podoTYFMbDLDxr3n6NTIBF8dtTDIAm9mNsrvH?=
 =?iso-8859-1?Q?bFMwStUGi3XUu88C2ezYsvoyVKE7UqgjdEPVqQu2V5vl1lenKR8sMYWR01?=
 =?iso-8859-1?Q?3NtDRs+pIUES1aEp+cMqiWfB85ozGLGiGYMW6Vbh33i1+z1rWgVs0mIZ+j?=
 =?iso-8859-1?Q?TBwYADm5AUPx+5Lk98LVyIATw48OBva1RUcUtsRXMkcScwDlNYFMhoULua?=
 =?iso-8859-1?Q?6njz1n4qCaAq3bjR0q6OlCCRtSb9HElenR/FnqI/qLMwVUM2ZY/AG3qZcT?=
 =?iso-8859-1?Q?QWkzKIhFBh5N+ULy3PuoPo+ZxZTF01d63lkhesmei9bmJbVmwOlpgoLJF8?=
 =?iso-8859-1?Q?gFSmLLkQhNI0zYOnAMVuAcTtT1xYcmPPjqFqA5583z7Zrh8BLXlmT6dolP?=
 =?iso-8859-1?Q?u7O/EhLBWTTtk2Ay1BiQXnDTOBAkUxH3tVduizUzzzlEJMHayiM2ktth/g?=
 =?iso-8859-1?Q?IQbrtVWw2GWzrTclfYWElAQr7+4T0hRCpm63YX9cl0nPBaOY4lpcpM2w/9?=
 =?iso-8859-1?Q?CtimJNPG6LwFp2k6h1IQC8E5ZsYpsHjKk547RIxSVISd3hlGkBVOwxGLqO?=
 =?iso-8859-1?Q?UVqNY0T6qCPghZyUZP6sxDAcQPs5kOx/sVDrJnALF4Aa41A1U5CmPIZuEn?=
 =?iso-8859-1?Q?+9FvZ6n8bAJQY2AJoWPdjAos6XHL7jYPkTItiexXj6R6m/HMGbfZMDL0LU?=
 =?iso-8859-1?Q?PEtWiq1UH2IGpucB4OF4ii1/dhQhExZoxrtJIPiN6tawtSr0EOiApfDfLv?=
 =?iso-8859-1?Q?IulQXkQf7Yh8PPWVo+edFw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jm0XxZ+InTrKXlVrmuP5xu6Y9PmWMXA5XrMVHm/21WE8devXnF1mDucL8R?=
 =?iso-8859-1?Q?j2fijtVRe4Nr8zJHduLKrO199HwVrC8cI4cM5fQSVSdi+GZVrO6+s9xdaQ?=
 =?iso-8859-1?Q?zRLOmegWEhLPyBiT3qMFUWdd1442Ny6qLf/lFtVow1ZwWiEgi/q4nOMEuM?=
 =?iso-8859-1?Q?krsgPR3U2Tz0Y/6PcwJp0cKT5hY1wUy5lauEJucRJVByym9xUConv06NqQ?=
 =?iso-8859-1?Q?NimrZ4RtD/TgDUMUYP6ICjinMI/lQLLcKUlEtBQU5FGIC5B28ZeAFm8nGO?=
 =?iso-8859-1?Q?xn8str6RGEWE7iYGLw/vPcXCc39mbMO384NXvFtnPGi4eW+3i+oniDOgaQ?=
 =?iso-8859-1?Q?XZ+KEhciP9BbckXtr4kkc3Nsy4mPQz11VkeEA2WSznthrCvOZA7xuWThfW?=
 =?iso-8859-1?Q?vASc6Ky3+/ngPhPsOVx05RFVHNL7riK+JGbLc8kvte6HEHyrVvElcOLY1/?=
 =?iso-8859-1?Q?lHZgUv8l5v+Uv0dw6rj/JmS3PF5F4MlUOx1eMuWN/4d7ZXqrFO8k+IAdW4?=
 =?iso-8859-1?Q?nqIJzEygDrPN+iHiXbcpwZ8ws0ZFQ1yJoA42ryIAfdfBDEtZ2gz9vn4uGT?=
 =?iso-8859-1?Q?SwzRMdF+cSW5/WVmztNLxdW/V4uk+qkHI7c5LO9d6DckWeeZfHcJfv3vAk?=
 =?iso-8859-1?Q?lUnWUsAplaqbCK1/nFtqB6fXIUOB6Yy7cj2Cxcc+whbb/Jamx2TlciIYtc?=
 =?iso-8859-1?Q?hrZbGrUUGzYmGhAEA0/QaOhTCXB2A5avgAahuDeQoBbTbr2Dm4sqdPj6I9?=
 =?iso-8859-1?Q?dr7HPDnfrFnB/G0kjuAsEw8LOtAJgQj+b1kbAtTlYq0H8FUKH1Ipf/ZysG?=
 =?iso-8859-1?Q?LgcXtcsakBZgqcIZnhmR0uI0Qmtw2J3CDuKjer2C6Ei/BQXdytx5prb6lV?=
 =?iso-8859-1?Q?V7Ssje05P2XgWVtFCs/FRW5eH4TUdWSPWl5PV4ZFpRH7dEbEBVkQAuRM48?=
 =?iso-8859-1?Q?m4YpJbS7zjnvpOiRUdMSTsUWOFDil0Gu+rwOijCO5hX2zVgtX83knGoxuj?=
 =?iso-8859-1?Q?5aM6wYl2dKziXZz6t/j9lLx0CGdqBjbRbtjshHyLcJyE0f223iBHORPZic?=
 =?iso-8859-1?Q?apMgjNIj5MBI7WcWIKKIbB6gG08avPQRL8a4ZqJoxKm6Lsdu4GskYFV7Dt?=
 =?iso-8859-1?Q?+TNRFv57WdF01MMr95xTUuc0ptVk+PdUVQMIfOVlSM2iEEGJR2+4tRrrRr?=
 =?iso-8859-1?Q?H0VSS5KLYKMrk4y8/CXXS7e9AIemMXWHuc4TAiA7ujRmjHNfURnncgZo4p?=
 =?iso-8859-1?Q?0R8w9EZxkDSVtGHYosllTyMVoo8Fu+L45F0cArPBLwk0lS4+h4SPwuKCzP?=
 =?iso-8859-1?Q?B5BFRON591h586DUVyjKgXZwtSZiFuGkLSI/+0fmo2TEMZKF8FF7V+TF9X?=
 =?iso-8859-1?Q?8aanauIfO+O9cD7bcvzRKbe5jJM9n8hE06FnVV6s5Yz4eXCYEZmmK2CJvP?=
 =?iso-8859-1?Q?OwC9NowEbTWPZLLbD+KeEuuQ3EfZg6c1Q3t3I6rpepJThaWfC29/Z3DiAp?=
 =?iso-8859-1?Q?rcIGbymVx2vcGu0DMFxrDP3NKIWAMlLLaNTkxFzaJRcxDCj2cFNk7uqsq8?=
 =?iso-8859-1?Q?UG6vM8Uf3/oJd1bWnIXvexivszPTx2QVyqQLsAZFIuy28tlaUmdgYlrU9u?=
 =?iso-8859-1?Q?/Q9V5uVs7qv0DaWKSXqU4wPRD8yZxC1ZGcn8zqHwSi9hdg7Zafgw+4qg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3493d87-e79d-438b-2984-08de2f5fab3e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 15:55:07.6335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oz/0CD/mawqUGPRDWGsHYngtM7Z8/SfPWGg40zbvPLnOYjXxTYdxagecwhWLGesdAcf90VaioOkKLb8mtpOAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
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

On Sat, Nov 29, 2025 at 01:51:38PM +0100, Thomas Hellström wrote:
> On Fri, 2025-11-28 at 13:01 -0800, Matthew Brost wrote:
> > On Fri, Nov 28, 2025 at 12:57:15PM +0000, Matthew Auld wrote:
> > > On 28/11/2025 10:46, Thomas Hellström wrote:
> > > > The user can give advices as to how the CPU will access an
> > > > address range. Use those advices to determine the number of
> > > > bo pages to prefault on a page-fault.
> > > > 
> > > > Do this regardless of whether we can find a way to avoid the
> > > > fairly slow vm_insert_pfn_prot() to populate buffer
> > > > object maps.
> > > > 
> > > > Initially, fault up to 512 pages on sequential access and
> > > > a single page on random access.
> > > > 
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Signed-off-by: Thomas Hellström
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_bo.c | 18 +++++++++++++++++-
> > > >   1 file changed, 17 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 6fd6ce6c6586..07d0d954f826 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1821,15 +1821,31 @@ static int xe_bo_fault_migrate(struct
> > > > xe_bo *bo, struct ttm_operation_ctx *ctx,
> > > >   	return err;
> > > >   }
> > > > +/*
> > > > + * Number of prefaulted pages for the MADV_SEQUENTIAL and
> > > > + * MADV_RANDOM madvise() advices.
> > > > + */
> > > > +#define XE_BO_VM_NUM_PREFAULT_SEQ  512
> > > > +#define XE_BO_VM_NUM_PREFAULT_RAND 1
> > > > +
> > > >   /* Call into TTM to populate PTEs, and register bo for PTE
> > > > removal on runtime suspend. */
> > > >   static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf,
> > > > struct xe_device *xe, struct xe_bo *bo)
> > > >   {
> > > > +	const struct vm_area_struct *vma = vmf->vma;
> > > > +	pgoff_t num_prefault;
> > > >   	vm_fault_t ret;
> > > >   	trace_xe_bo_cpu_fault(bo);
> > > > +	if (vma->vm_flags & VM_SEQ_READ)
> > > > +		num_prefault = XE_BO_VM_NUM_PREFAULT_SEQ;
> > > > +	else if (vma->vm_flags & VM_RAND_READ)
> > > > +		num_prefault = XE_BO_VM_NUM_PREFAULT_RAND;
> > > > +	else
> > > > +		num_prefault = TTM_BO_VM_NUM_PREFAULT;
> > > 
> > > Ah, interesting. Do we know if any UMD is making use of these
> > > special flags
> > > today? Just wondering if this might be a visible change or not?
> > > Also would
> > > it make sense to document/advertise this somewhere for UMD folks,
> > > in case
> > > this has an immediate benefit for them?
> > > 
> > 
> > I also have a question here - does Xe / TTM support faulting in THP
> > on
> > the CPU side? Is that something we should also look at doing based on
> > madvise / global THP settings? Would that help mitigate the slow
> > vm_insert_pfn_prot too?
> 
> It would probably help a lot, as long as we actually get 2MiB pages
> from TTM. 
> 

Hmm, yes this seems like a pretty big win too considering Mesa now
always allocates 2M BOs and then suballocates smaller allocations in
user space. So we should pretty much always should be getting 2M pages /
faults.

> I had that implemented in TTM once with vmwgfx the only user, and it
> was working fine except one very important detail: I had implemented it
> based on vma information rather than PTE-based information, so
> get_user_pages_fast() didn't recognize these pages and was terribly
> confused. So it had to be ripped out.
> 
> If we're going to try that again, we need to talk to x86 arch to get a
> PMD_PUD_SPECIAL pmd/pud flag that behaves just like PTE_SPECIAL, so
> that things like get_user_pages_fast() ignore these huge PTEs. Auditing
> all page-walks in core-mm for this is non-trivial.
> 

Agree, core-mm page walks are non-trivial to audit. Recently looked at
2M device pages series and it really wasn't all that bad though.

Out of technical depth on the PTE_SPECIAL comment, but can dig in a bit
here. We do have a maintainer of x86 at Intel (Dave Hansen) which we can
float any ideas wrt to this topic though.

> But if that is done, we could bring in that stuff again, although
> Christian wasn't very fond of having it in TTM.
> 

We can perhaps bring this up as an option to Christian - from my limited
knowledge on this topic, this seems like something worth while to do
regardless of the PAT issue as just seems like a pretty big win. This
however is very unlikely to make it into customer kernels which are
complaining about this perf issue, so I think ww need to explore other
options too.

Matt

> But I think it would also be very beneficial for things like ioremap()
> and friends.
> 
> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > I guess would be good to add an IGT which uses both flags, if we
> > > don't
> > > already?
> > > 
> > > Anyway, I think change makes sense,
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > 
> > > > +
> > > >   	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > > > >vm_page_prot,
> > > > -				       TTM_BO_VM_NUM_PREFAULT);
> > > > +				       num_prefault);
> > > >   	/*
> > > >   	 * When TTM is actually called to insert PTEs, ensure no
> > > > blocking conditions
> > > >   	 * remain, in which case TTM may drop locks and return
> > > > VM_FAULT_RETRY.
> > > 
> 
