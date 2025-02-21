Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8319C021B4
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 04:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723EB10EA08;
	Fri, 21 Feb 2025 04:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLFFdHQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A7410E215
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 04:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740113153; x=1771649153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zRIIM94hSxNhPjNBm+dNIIJ73lZzgT3965w6jvm90Vw=;
 b=OLFFdHQ8toFQAbUo+9qQF6O0kE7zjjgNzE4kF1u6VIF+MdOcp8mAxs+I
 ACQ0QfrgzkPcvnu3c1M53357rcxojfdUQUV5eDQOfKj5PmCoNqDlV1NZc
 3dPVNuH2LUlLufindwampk2KGFhBt1bhHo0Kc6iHsx1w4hrXFJZ5EM15P
 WzRUWFhxcxxCCRvNRxUcLQ3z2Yd9cDGe8CdC8feQMAXWaYiX3bZe4aMWO
 //6e0Zd4TaBRqMawcM8qE7Rl7HRvuELNCOGy59C7weKB9p2XIte4he/ey
 yV+JCqIWCfvQCPOTNxJse/F+yNMGqes97ehup7za9aIpSzaBhX1rJmiVk Q==;
X-CSE-ConnectionGUID: LioChkqlT9+6CHFKBq7Kmw==
X-CSE-MsgGUID: zqNsiWZETumaVPq5ZgDVOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40108190"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="40108190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 20:45:52 -0800
X-CSE-ConnectionGUID: aNMWLfcgSoW7DyavgbPfEg==
X-CSE-MsgGUID: x5+sd+/5RZCcThNlIfdZrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152456831"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 20:45:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 20 Feb 2025 20:45:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Feb 2025 20:45:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 20:45:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hr5qernZH1l1cTGxJt6xpZUMpJdZ0T2RrWaS1XnaSxEVPyA3k7tVQhxOUVA27r7ltR5pDDTMrnM0cJ7H+SxK8sapMEn8pGW7SQlIOZJYhY98qkoxg/U1D/gUYuP0wle02iqmmc168aA2lwj7xgI91P+8mP7MZf8Xquwp4HqPiFzXvomMJRJ8A3vRZyAI6K1ytviVtaPHQhOFqxlIOOZr0YKRQlt9vcOFXlaEpkjFLXYVvWIlexMqsNCk8TQ1Q4BU+txwi9cNNqpGIzF4SSOTDY5InI0yhrC9QP9JaOvgxohkBl2izATM/NZuKjFCCxvL4+XDYw8DEzBYVCOt+fRNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UswLoGxQUlP4e0rX/qmm4cK+pbUXPEz02kqiM1gp0mo=;
 b=E3rreUDuHEaZiF9b7D9TcNoA+nfv8MZSDWvRClvHwNr0l87rC3e1Na/ChdLFrAZQ2OQldHeAOm8V6wzD4mktI4LtXaFJDWwJRDeXb26kI5wtYQpxrvcUMfsDLdC0FYh6Y/GfcHIAqY8juTJRZw+P+uee0ZTDdTWCnvNpH1PLb+XAoSkZ0U98xZKytdOCyNw52wiAeq8tgOHVeg6ho9Q5dH1I1mAz5wlgWZrh8jk/11H4nMrCtndjFpRwLNYDOwHxzDhqp/4tQ14lYPuJg3YRmgHaN0N7bC1v/xootmvNjMjx/leDulMZUnIKAGwQZ/MCRPqYzG3AgOFMRTDV3rOjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 04:45:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.013; Fri, 21 Feb 2025
 04:45:49 +0000
Date: Thu, 20 Feb 2025 22:45:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 5/5] drm/xe/xe_pmu: Acquire forcewake on event init
 for engine events
Message-ID: <bsmgo4sti6ue46ocarjt3qltjke64ln4gf3vol2novnbw57goo@iihu3gswpjnx>
References: <20250214100819.798544-1-riana.tauro@intel.com>
 <20250214100819.798544-6-riana.tauro@intel.com>
 <tkee4kttili63cqcpreoc6wqz3r6depkmixt34ctilypa5rb46@ddqsv44zsvi3>
 <Z7fTX2X1qrdcv0fb@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z7fTX2X1qrdcv0fb@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:303:dc::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 79092b69-8c40-4767-a69d-08dd52329d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0xElA1ypOMjhO+x6IK8ssZBq6kbaL1+6SjijRPtI2f1Kg23HyD7732j1xXcl?=
 =?us-ascii?Q?tCEymWBrUIAOk2WluPcjApnSzEKbLsWzJygOsLRRbIelJqJO1Cz/o7FIHzDi?=
 =?us-ascii?Q?ErwOQJv2YaUT0BpCwGttvFTzAPkiNOgmJ+4XSY8aybiaQAusVWal+doYvvze?=
 =?us-ascii?Q?WQo8o0unTmUDvmVEoo8FAExRBcX/iPAK7ZwOT9lffhwMzyHeX6HD/Jsmr6M0?=
 =?us-ascii?Q?QFGLq8T01E1ROhBh+tK+a/dXEurY3ELXXDaoCnbT3K7/7cXbNPm4r+g7+Pmx?=
 =?us-ascii?Q?g3b70E3wjSIQgAR8P1nmKtOMpU1d8w2V53/2xGm57/FW672EgMDf/KDS76bU?=
 =?us-ascii?Q?KWAC/jaDeWCBw8dqFstfSfuS7eqeJ4+MedPpz+GA0etfk8afDD/VBl0Xe7eR?=
 =?us-ascii?Q?JZeyyZOMVxZd+JfN/ZrLlA0mQSF9bCFHSfSR8xPjOMom7bZ0GliWJI7J5qwT?=
 =?us-ascii?Q?+aHRXyffugKDv9XQ0QXntuMPL5ieKnUFD/U500Ebybl9dt646pbX11/UQk4v?=
 =?us-ascii?Q?R/UfBInkAqL46TiunNqhJZ9pydWrm4DgPpMHel/BElGWoVeCpyQJs1rDFBku?=
 =?us-ascii?Q?RR+yJkQTgrYvF7zQ+GGwAoHO3JAoC9xs7hTQM8Wj6JogHqzWcoCzyMxHPG1b?=
 =?us-ascii?Q?dUTTPBS4voaS5hIZin1sy4CwMR/zYkPTSvm0GUQh8LK4z2WCzx97mW5xFf0Y?=
 =?us-ascii?Q?xUnXvYUHABenq1zx4bF3jAnz0cOiwSZy24PuX0jd06fAvrVnUn+XpEoF4N0G?=
 =?us-ascii?Q?sLkQ6nzsmyjsE42weBXefydjrvmsp2W8PvS/HE1ZrtaMVYtAvMKO+mrDT0rr?=
 =?us-ascii?Q?wh/cGQLLJn6+7C2lKPSoAsSTb7JNNTXFw/q7a/MrEdjPzHV2WLbg5wlmn7x+?=
 =?us-ascii?Q?xWVZ7NMbMUhain2MEwHUXdyuF4PSszI3T/1DZzWUwF53dysqgI6CTZqWf177?=
 =?us-ascii?Q?AedUhALYE12yFAUqkXoTx3YPWV/xzQOnDl7kXuIKAx98o2tTJgCocUSUiX+3?=
 =?us-ascii?Q?moWZ/i2p4NeiphEJXcDvKovnjoSPhOPDpR2eGPAolI/cJ0CNW4pXisY8/9Ah?=
 =?us-ascii?Q?ssvQtNGn3ZgdzyC795islMj2waubhYkLgx4lGoCjL5z/TKLKEu6egXCiu6DS?=
 =?us-ascii?Q?0kLGJHmC0relE5wtoeWuMQ7UBvou04qAN7jgCRdAdxzVrnw+q4O/iXK1G/55?=
 =?us-ascii?Q?bpNIfwnZ6XnDvrjHw+6Wg824CRmpQImvDuRKAJLtCNycLWYxfm3J0bAbHF/9?=
 =?us-ascii?Q?xD5lq7oRs9hOumvFZle6fP7NTc3w9Oqfh1b+lFpOn4mL6dWuVEVAKJ63PoTB?=
 =?us-ascii?Q?Q6bHtHMz0rWGBV+M4ZjIwRcp8T9rR2edKzcDVJ3Jn875npvpm1/ojJqolRJU?=
 =?us-ascii?Q?Xh9q8/kkqoq7TJcYLGGkg7jYFdoS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HrR8WaMCwqMIjBbh1FXOtHnVt7fcH90a8PuaUzuQw9hiT74E/+wTQI59aj92?=
 =?us-ascii?Q?6/a1eG9b9gBsRiyt37GA+ECn1K9/08JT5N+ENAxRLAjLNfJD0tsWW+OT4JMt?=
 =?us-ascii?Q?zabGhn3Bc2kXT+Ay7jOFZf52se0RBC98qWosgnWiEvaa2mBCkW3GWA/DeTpy?=
 =?us-ascii?Q?kr19Dbi4KiOhuGYtlMUZa4RpCDX8EbdwEKvN8dVOwhXq7/e4cbtR6HRrijk3?=
 =?us-ascii?Q?YgTbFScn0hjBvGy4GDgTLOckLrtcqvsop5In8eMoyaZ+hN6pyOjyfXL/iTPz?=
 =?us-ascii?Q?eHObKcJv0mid+Pf99MumgQ9GTZtH21I60s3GosWSbYN2Y9DM5NL5gzS9XImd?=
 =?us-ascii?Q?nSBHzpUHtErW/Sur7edXRJKGq+DMlGSd4iRi2GSG/5FeePRRDfAvs/CvSVsN?=
 =?us-ascii?Q?OgHlFLph2LoR14j4n98bb6xblvYhNOu5o4ZLoV9nSpWjdjDPqFWb7MoV3O3I?=
 =?us-ascii?Q?IVTYD2tC9guJy9nIxcD8bdB3Ik21MWFWb+XG/JeCKXRbP/nSaNWGFFmdjycq?=
 =?us-ascii?Q?+ESw0i/yXxLCwkjPdniQyNXJFiBYK7WoTb9KClvtzLfUVWN7nEC5Ev2c5+TK?=
 =?us-ascii?Q?NU9mFvE9X5heGszJNIdXwPXXmJ/KlbcAt07NgJgbzxOmJnn3q4pps6ITa9xU?=
 =?us-ascii?Q?a0QAoRFBDpYBUpUex2QRi+yqJpEeBw81giK433wugDsc+75B5IL6yKWr9GrL?=
 =?us-ascii?Q?G4JcBaaqjCi47eht1InxDqsMJUuqygDzEX4dsCJjfj4CTRaQGGnb52aZhdGw?=
 =?us-ascii?Q?gZdcaZMHfYwjVG06W7KKpDu/2u3cOFiOqCfJAYlBcKhjCnsJGIdYdDZFWsf2?=
 =?us-ascii?Q?n6LV0KAmuX1Tl4di5hi6DK8Hp86XzJTyb+TF/n1MWtxEkWgnOcPdQpniqBgJ?=
 =?us-ascii?Q?gG8D4JwJviN4O+eoD/Xqp3R148Lq9nniZWShD49Kbs4VD7JZP8TxwzKHFHVc?=
 =?us-ascii?Q?Xq1MwUHNh/DwqoII5wOBPW7JgINSopRU4jf7EMIju0z0PeXqJNTtXEp8Xqr/?=
 =?us-ascii?Q?+rmOpcGPNWpKEEkGD8WFGPzBR6qGC+dcDKpatEyWGDQjPKYd6rNDKjBlYjwO?=
 =?us-ascii?Q?U4ruyxid481a4OcN3b1cGkA9cgL/Ie3+gwcXJLMrfQPWNRcG4LvlhW3Q+pKs?=
 =?us-ascii?Q?aIUdPcE5E8wXf3T76T+wI1EPPIUcAMv5XCRoI6N07NJCw96Dbob5f0JLzzK6?=
 =?us-ascii?Q?R+NrKdrACbGdxuO4MWwleFqh/PL0j/Lsy6+m8BaZniWOxKHYkIPiT0Xq4c2j?=
 =?us-ascii?Q?0+zjyX6oEqVHOOlH2ngUD7ulF1Z4QLsM0Zb8f8LO/Ll+UTQfIJW0DZLKFoOB?=
 =?us-ascii?Q?ghi075mH9z7bEMIp0bSPORz+QtuiEIFvo0y1eT7A928VTpA77uXXTdgSwj7D?=
 =?us-ascii?Q?A/j3VEV72/80yzr7w7r66efrjDOe/+vgdTN4s9SMsJ6ceKT1QR2puxyzRLsT?=
 =?us-ascii?Q?fgxdCU5Y+FZaIELPYrzLgfif6IEE8VwA/TTcGcPlQyMed6lbPsYV3eOUX/gk?=
 =?us-ascii?Q?cmHdl2EHuqCj+IBqumiAyGvhzsKgT+wBaBI+CnsCqTS+tAPISKWx6SIOEZvz?=
 =?us-ascii?Q?dCXbbtSDKmVlbQPZLEjOTj2r4dac1B5gkwGTV0ZiHf1eFjWA4aiaDLDhakKv?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79092b69-8c40-4767-a69d-08dd52329d24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 04:45:49.6438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjIwAjp+P+Z8kYHVaWj5KDZIkGvfEpDlKh5Uwy9oAOKowps/BO4uGtLbDfZWz165CVLDSnlpOBse0whK7bA8ERTQGpR4a5odK7wbsafzumo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
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

On Thu, Feb 20, 2025 at 05:14:07PM -0800, Umesh Nerlige Ramappa wrote:
>On Thu, Feb 20, 2025 at 03:46:55PM -0600, Lucas De Marchi wrote:
>>On Fri, Feb 14, 2025 at 03:38:13PM +0530, Riana Tauro wrote:
>>>When the engine events are created, acquire GT forcewake to read gpm
>>>timestamp required for the events and release on event destroy. This
>>>cannot be done during read due to the raw spinlock held my pmu.
>>>
>>>v2: remove forcewake counting (Umesh)
>>>v3: remove extra space (Umesh)
>>>
>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
>>>drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
>>>2 files changed, 54 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>index dc89fa6d0ec5..67693d642f5a 100644
>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>@@ -7,6 +7,7 @@
>>>#include <linux/device.h>
>>>
>>>#include "xe_device.h"
>>>+#include "xe_force_wake.h"
>>>#include "xe_gt_idle.h"
>>>#include "xe_guc_engine_activity.h"
>>>#include "xe_hw_engine.h"
>>>@@ -102,6 +103,37 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
>>>	return hwe;
>>>}
>>>
>>>+static bool is_engine_event(u64 config)
>>>+{
>>>+	unsigned int event_id = config_to_event_id(config);
>>>+
>>>+	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>>+		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>>+}
>>>+
>>>+static bool event_gt_forcewake(struct perf_event *event)
>>>+{
>>>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>>+	u64 config = event->attr.config;
>>>+	struct xe_pmu *pmu = &xe->pmu;
>>>+	struct xe_gt *gt;
>>>+	unsigned int fw_ref;
>>>+
>>>+	if (!is_engine_event(config))
>>>+		return true;
>>>+
>>>+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>>+
>>>+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>+	if (!fw_ref)
>>>+		return false;
>>>+
>>>+	if (!pmu->fw_ref)
>>>+		pmu->fw_ref = fw_ref;
>>
>>how this shared fw_ref is supposed to work for multiple
>>perf_event_open()?
>
>Agree, not ideal, but I don't see an issue. This forcewake is only 
>being taken for engine-* events and the domain is always XE_FW_GT. 
>Looking at xe_force_wake_get(), I see that it returns a mask of 
>domains enabled. In this case, it would be the XE_FW_GT. The return 
>value is just stored so that the corresponding event destroy can put 
>the forcewake.
>
>>
>>fd1 = perf_event_open( ... gt=0 ...);
>>
>>	event_get_forcewake()
>>		pmu->fw_ref = xe_force_wake_get()
>>
>>fd2 = perf_event_open( ... gt=1 ...);
>>
>>	event_get_forcewake()
>>		// get the forcewake, but don't save the ref
>>
>>forcewake for gt1 is never put.
>
>pmu->fw_ref should be identical for all events taking this forcewake.
>
>>
>>
>>Or even multiple perf_event_open() for the same gt: we will not handle
>>the count correctly.
>
>The count is actually handled in domain->ref in the forcewake 
>implementation and note that forcewake is always taken for every 
>engine event that is being initialized and hence always being put for 
>every event that is destroyed. This code is not refcounting that.

so... we never set pmu->fw_ref back to 0 and any event destroy will try to
put the force wake? That seems a different bug that avoids the bug I
was thinking about.

>
>>
>>In summary I think this fw ref needs to be per event... an easy way to do
>>that is to use the event->pmu_private field, to be populated on init...
>
>I am not opposed to that since that makes it future proof so that we 
>can indeed have events taking different forcewake domains, but let me 
>know if I missed something here since I think this alone should still 
>work.
>
>>
>>>+
>>>+	return true;
>>>+}
>>>+
>>>static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>			    unsigned int id)
>>>{
>>>@@ -144,6 +176,13 @@ static bool event_param_valid(struct perf_event *event)
>>>static void xe_pmu_event_destroy(struct perf_event *event)
>>>{
>>>	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>>+	struct xe_pmu *pmu = &xe->pmu;
>>>+	struct xe_gt *gt;
>>>+
>>>+	if (pmu->fw_ref) {
>>>+		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>>>+		xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>>+	}
>>>
>>>	drm_WARN_ON(&xe->drm, event->parent);
>>>	xe_pm_runtime_put(xe);
>>>@@ -183,18 +222,27 @@ static int xe_pmu_event_init(struct perf_event *event)
>>>	if (!event->parent) {
>>>		drm_dev_get(&xe->drm);
>>>		xe_pm_runtime_get(xe);
>>>+		if (!event_gt_forcewake(event)) {
>>
>>if you group an engine vs non-engine counter, this won't work I think.
>>Can we test it?
>
>When you group events, init is called for each event. From the Xe PMU 
>implementation perspective, grouping shouldn't be any different.

the event->parent is a shortcut to do this only once per group, but then you
can't look inside the event to decide if you need to take the forcewake or
not because it may be true for one event and false for another. Try
creating the events with the group leader being a non-engine event.
AFAICS the forcewake will not be taken.... something like (typed here
without testing):

perf stat  -I1000 -e '{xe_0000_00_02.0/gt-c6-residency/,xe_0000_00_02.0/engine-active-ticks/}'

Lucas De Marchi

>
>Regards,
>Umesh
>
>>
>>Lucas De Marchi
>>
>>>+			xe_pm_runtime_put(xe);
>>>+			drm_dev_put(&xe->drm);
>>>+			return -EINVAL;
>>>+		}
>>>		event->destroy = xe_pmu_event_destroy;
>>>	}
>>>
>>>	return 0;
>>>}
>>>
>>>-static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
>>>+static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event, u64 prev)
>>>{
>>>	struct xe_device *xe = gt_to_xe(gt);
>>>+	struct xe_pmu *pmu = &xe->pmu;
>>>	struct xe_hw_engine *hwe;
>>>	u64 val = 0;
>>>
>>>+	if (!pmu->fw_ref)
>>>+		return prev;
>>>+
>>>	hwe = event_to_hwe(event);
>>>	if (!hwe)
>>>		drm_warn(&xe->drm, "unknown engine\n");
>>>@@ -218,7 +266,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
>>>		return xe_gt_idle_residency_msec(&gt->gtidle);
>>>	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>-		return read_engine_events(gt, event);
>>>+		return read_engine_events(gt, event, prev);
>>>	}
>>>
>>>	return 0;
>>>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>index f5ba4d56622c..07c4e592106e 100644
>>>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>@@ -30,6 +30,10 @@ struct xe_pmu {
>>>	 * @name: Name as registered with perf core.
>>>	 */
>>>	const char *name;
>>>+	/**
>>>+	 * @fw_ref: force_wake ref
>>>+	 */
>>>+	unsigned int fw_ref;
>>>	/**
>>>	 * @supported_events: Bitmap of supported events, indexed by event id
>>>	 */
>>>-- 
>>>2.47.1
>>>
