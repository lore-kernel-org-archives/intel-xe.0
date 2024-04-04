Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43133CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 16:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB07310E8CF;
	Thu,  4 Apr 2024 16:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSkqNKGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D7310E8D4
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712246894; x=1743782894;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dlx0kOtlA3ToTIeFkTSKYkepODrnG0l3arMUcZEcgXg=;
 b=WSkqNKGyrGIGdUjAo9bF2YUxq2b3quKGhgWlb7SJvbT42ou4cbppsD+h
 URCxjkjCW5Xs1mGnWlP8yaWVuFE08Y/LQEuDrzpWrVWbe7y7GBVAB3yCE
 fTXBx/PzA1N17ZfAaTgSiHs0H1/rGoAlPqt/wLDVIthosNxskdpeOOqEV
 UKVPmopRlUMZbshsGKEfnGHwYniXp/EHkavrpF4ZqXv8GZQkadE86aLVp
 j7BnHZ5KRSX/G1+XEEg1fKxvZN4exd7HJ7Dm4LniAq/1tn2iRp0C/Hatu
 kzXwVBUHI7Xbho9YtHdvVQE0tHNrj09nBGPANEt6I39wb3PQaAJj9KPGS w==;
X-CSE-ConnectionGUID: WdQwC5D1RhCR89whypYXHQ==
X-CSE-MsgGUID: 9TDKeDatQfilRfJMxVGdbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7411448"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7411448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 09:08:13 -0700
X-CSE-ConnectionGUID: gE95wty6TGuBOPB6ERiD+g==
X-CSE-MsgGUID: L/yA3FchTc+LRN/MP/FprQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18807626"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 09:08:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 09:08:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 09:08:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 09:08:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 09:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JclyO9VMsCDgoiK0ClJ3RE/+JbvIppa9v5vVwiRrURsu1oe+M4U/EUdUIU2vsQhe34a6+3kh0MtenWJYLi4Uza2L5o14om4n2S2rw3ixC54Dy5m+u6iEiTV9YXPe8DSPhGX5nXLcGRvzbWFHGzejGnpH2P+Y2CWT/+nxuWMamFkcVTCUHJxrQ1ACwrfuIgHaM21b9ugl6lHRgS+1dZLZQvN2aO1UZpp9xhhdS0Xr4uAmD4chEVK1DuVdpuJwsi+7rr8xXqmG38WWpUjqlJ3Fvg3T3SvW7dtS7pEnZ3mr7/b95Ah8i7lGNDlD1/0R0gXVdPAplSeFehCz0bE81E4D5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbMZB1gA+j0hRsXH4gvI0r6BFR1pOovcQsFgnLF4GuE=;
 b=m+npuokGgxRx9sXqix04WNGtVkT2iiNrPRxvRPqSovrGx8XXcfrSHFFszsScEs+h+FYgjAefbz+SZadBZVDzyRpofKEV2FE2IuFL/KucMMfny39PvzzvjgET9ZFcWZnOu44o9RGeqJiGUxdZXfIUjZd1Q8IRp5gXzuzXsPepccEp7k60I8lvXh0R70LNweUGvh4nateOWxhJAk0zjSojZbbqkLKoTUpHf8xpgI1XRF4F5zgXlZ3133MLRNcCtw6sXx3dLsrTR1wOeIaByydtaH9Q2G3UxJ8xRwV5U+4cd2b7gsubFSSmFu4uJYZyTJ8vUQvwtz1mvP3G8iVueQGeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6773.namprd11.prod.outlook.com (2603:10b6:806:266::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 4 Apr
 2024 16:07:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 16:07:55 +0000
Date: Thu, 4 Apr 2024 11:07:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 1/4] drm/xe: Define XE_REG_IS_VALID
Message-ID: <qf26pvhmat5kg4lspdvssdexe7osiz4ftnzbhc6fpehghpiayr@sqnfzvqmsymn>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
 <20240404035441.965590-2-karthik.poosa@intel.com>
 <66364872-fd7e-4a40-8abc-f84f0a4bb6a7@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <66364872-fd7e-4a40-8abc-f84f0a4bb6a7@intel.com>
X-ClientProxiedBy: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6773:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fR92UhOrhoqYY+eGiS8B9u+WLDGRhYPLrt52uV+UotEqx+rlhuXgp7hWZWcwPPGamcHlQD8b8KyXZWBDt41/Hu+5qe8q8oXBXQrD+c9fe4dSoEGmH4x8AxaquRVku3deUD0ISJFPARqDw8CI0TNBwfACW21/E1W+Vg+huR2UaownZKyeb0I1xBg+6l6CfafaTDtMnC9G03T/0PM8NbKsnL3UpGOGCPMR0qH4VeuZF39EWzWiB+qcFglSI5f8oRLZQWsWfaLiVyTkCG1aC/cU2MLZ78FfJWb13neKi91BQN/o0rlTHwqFLnrAqiBbTGmH61QGK0ggOfANy4Rh5l/0mHFQiZ2zmMt774TcBj8E1sFa0jnfHbl56a0EBtVE6/B4YlfuYyp21+lSjYOwV1CN/r/k8EM/IhMQV01mY38n4NWYSSarXQyQ8fXTf0cK6MQb+PPyYNz1f0MHqRogHzPS3TkYfUEinfKL3x6PbrxfZeWgfojqTxG5U1sj3V44aG18bEwAYHE4VA9uJsd8Y/Z8HzaP82CGj2L24eMT6nxuGGpm95R4zcHkzCa+3awJk8J8eedqnpJWC9ytMsSLjSiuBk8Y1sNC8yUHBwvhmwnwgepZe2PjmdOA9f5XGZrNB/Odv3XuoQXD+0QV8O6tW68bpeDNd4ndLrhEBhAMZcuMzaRy3k9oD4hyMde/qe+QZ9xP2IgG+rAxv/bMvTNUANeB9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(27256008); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c0ZiJ6SFk0OovOscM0MyB/5zhcfnnBnD8dse0E0lTaDc76O4tXW4n708emM3?=
 =?us-ascii?Q?BXws2+HXqRC++SSMm9xxcym7OAk4aOIBLpi/ubZQ4bKbWFBs9DDNYJ/5OLkK?=
 =?us-ascii?Q?tCZxOnI2aV/Ej+ZcIkFg0TSlP721ZbrUNTr13o3/BcJVE0T4Ag5hrDQxNYJh?=
 =?us-ascii?Q?+escQ+vlqVtC81m4YVU8kVBvqTRZmu6g3MVgL3x+XoR8bg6SVr5nd4jkb8pZ?=
 =?us-ascii?Q?f4THQG+HzDUF4v8rS5Vdi3wMrH2CWO5GFuqS++Z0AkZgFo86PThCM5+fcWIh?=
 =?us-ascii?Q?tEP44d2J4+vfEnw5TsMm/WEu7tVc7eJ0mnIKEPN0de806RTAajS9/hgMzYQX?=
 =?us-ascii?Q?mcX+YtBqJMG2NMEI62BWUK+ypoNftBvHTXJAEOAFdmpB+460038j8ynyWqY6?=
 =?us-ascii?Q?N5uqe8gnJjIsOiPWjwuPFa5X8uevi6qDUidxRKxlL6ruQov50vm8Pk0vyxL+?=
 =?us-ascii?Q?aWp1KUQRKw/1fokbNYMaRLUDsYuUi2R5qEwdL5szG7UQnMdR/oPEHsk6BLVl?=
 =?us-ascii?Q?m3EwOzWXNOwF6nnI0+DKXnMAwA+nJutqMOLrWioPZFXjf20/756kABs1IB65?=
 =?us-ascii?Q?pXq1kisZh8pFZyuNs+udF3S41mE/1dDhcCq8FI+UAapiswJqnapvHT0LCUdo?=
 =?us-ascii?Q?2FPGKad7VB3rCu27iVoO3feHDsQcULHiVp5rmae0UoMuqx5W5yTVFAIBdYJn?=
 =?us-ascii?Q?fD712zx5VnBm+NfucAbAPxI6AvjixPIPfVkn4gVKyDPm8EQJhdSi3V+ixy6C?=
 =?us-ascii?Q?gu6LpWS1JuKLIhDZO2ZyNqYXY0SKVuzzMaQKMsTeCgarEUQk4zLR0vF+Ia32?=
 =?us-ascii?Q?u/QMua5TfDC0Z0ZiALOymggoXrDKfM8R1Z17ppRYmu+06sx7wY6FX7rFQlgV?=
 =?us-ascii?Q?/Lw5crEMSthZDlS2LwU+0bZ1vL/kgSTXPa6yW6uG3vLfi+1Gyzfm7ldM7NYc?=
 =?us-ascii?Q?lMZLV26OEr7LhoYoVw3UDs8YOs+T1nJ1Ph756GvQ2iq4ILrkv/uDWh/EUuee?=
 =?us-ascii?Q?1xUGc2phAH+d4SdI8yX6sGhEhEHtb3qxAHAD9OWyQVq2LKfzvh65KVxsdJWs?=
 =?us-ascii?Q?15SClYjck1A+LtAL/ba/4tSC2+oDVfEOCys/59jPoCo79vALHGWI8X6UEEKj?=
 =?us-ascii?Q?F0BB9Ls9j5XXI1cta6WY6QCVU/DKeXdYTsh12VtYcpNN7Qty8mE+tTVzwvVD?=
 =?us-ascii?Q?0fpFweMW+XHR8FJIVljyxCn34SypoqYL46kO8JtD6MJ7IDQ9XQzcagdXsl/s?=
 =?us-ascii?Q?DeTrTQpv8qWzdCwpw2OGtSbTw/d7O80Kw48fFA3A4Jny/8nJUScKK3sllihg?=
 =?us-ascii?Q?Oiszphs9z1TYhrhesIumAde1MatIXShHgFPPdtX77H8tLaJlQiDXNhB+PD9s?=
 =?us-ascii?Q?T2NV9Wf5xd4epUt4CscE+co0KUVZw5Q8SF8IOfnzrnR+O9w+N1l3YjesajyK?=
 =?us-ascii?Q?3jQCnRD/3a75MLEixIAxC8T593mJASmJdZduEIgjlB5ZL1H/wUg9phpdkda5?=
 =?us-ascii?Q?EYw7O2zcIgBzBec6Yft7PfRM1Vc/RX0MWpT09k5hH+SSqlBLVMzl1OAFW1oR?=
 =?us-ascii?Q?9NGAAYzE9BWHadeMWWy5Y5BlLNs5jlqgoIsGn6Zi72Qi5L9/tsS9j04EZ5U1?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c14553bc-762b-45ea-2f38-08dc54c16350
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 16:07:55.2959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhvTaewZU46I2MhMHXYPeJ+IanGhfEtSNmB9TU90nZ8XT7fkDSgGVZH85VqmpoUpvdkrc8OccE1TDvWakZE7U8BjuQoRcaePfIkSiRO/DtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6773
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

On Thu, Apr 04, 2024 at 04:01:56PM +0530, Riana Tauro wrote:
>Hi Karthik
>
>Add a general commit message and add the suggestions with names under 
>version history. For all patches.
>
>On 4/4/2024 9:24 AM, Karthik Poosa wrote:
>>Add macro to check if struct xe_reg has valid address. (Lucas, Badal).
>>
>>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>---
>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>index c89ef2b79a3f..42078643be6b 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>@@ -131,4 +131,6 @@ struct xe_reg_mcr {
>>  				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
>>  				 })
>>+#define XE_REG_IS_VALID(r)	((r.addr) ? true : false)
>Why use addr instead of raw?

because raw is wrong as it contains the flags for the register.

XE_REG(0) is invalid
XE_REG(0, XE_REG_OPTION_MASKED) is invalid as well, but .raw != 0.

It's the **address** that tells if the register is valid.

Lucas De Marchi

>
>Thanks,
>Riana
>>+
>>  #endif
