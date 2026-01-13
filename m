Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC129D30CEE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 22:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8687B10E55C;
	Tue, 13 Jan 2026 22:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irpHbeP0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7ED10E55C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 22:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768342603; x=1799878603;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mGo6jlW7X2qdM3v5thLEeF3oMvfcZmG2PBlExDSsJnQ=;
 b=irpHbeP0nBEvBFIbT2vR7eV+pPzvBXCvtuphivxI8sT6NsCMbbXQbJX+
 3HG19LuIBc+BtuTso2/VSqn1/g+XXUIVkONi8+tStUQ9f6fRPj6udgwiI
 KzCd9um/+Je25+i+33IPzwTxxtVXtAl3kLsL81IjC/WJaPKcd5G/ttITu
 h5SdV9NSz4jLqV0Fqfj+/BpimCHEpWX6FbJUfIalmqSTXf8CcEVOr5haP
 iYGXCed52RsB5ohxVFevw3w2/UySzC5qAM8QVUz2iWs4j5HhX+4sxnM1Y
 xQZKSsNLxITw8j+UX+8xxYAoRrmw1zfj1qz8vqeGMDEZGHHeCCk6P/cFa Q==;
X-CSE-ConnectionGUID: TT8iXSuaSs+6+WyQtahugQ==
X-CSE-MsgGUID: nQi3pz6MQ0C87yNCUGE7ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69720585"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="69720585"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:16:41 -0800
X-CSE-ConnectionGUID: gY/xwXtJRNS8Tc9SP8pk/w==
X-CSE-MsgGUID: 9IO4cFIyThqhuX16mci7ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="235223124"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:16:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:16:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 14:16:40 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 14:16:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pd8RnpxMb3AkxFp/tYNmSgMh5W41+XsSjlB3XJe4WpYtCUUwUkvLNrJkYFkLkZxFQgiO0npJYgFfHf8pVjAdSUIFMPdrlV93Es/z0gu7XAcg6yqNb0C3HggFZ5MT1gD+xnkqlexizUAtelPedjXnZOx6PbpYF2qJvhVmU47rdHtoVNTrCW8eH3TohqATPmRvBylWagxxrQ6k9mIFfydqKYQ7Y33gqDajxYG85wjjkQRlYYBzE5GndqFOAf/JENa4kbU4aLFynAgvONlCJ2cK8tbp6Vbd1XTXy4RJEt5jhDB5vPLl8QDMPf+03ip6YuXQ6e2nWtVGEvox1WoJWd9yCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCxgUoOSuLS340CMUT2T71/z0+W7AMTEGw7FJ59yeQM=;
 b=pZ0dW3pQCAbWbVL7NglYEcYZ35hiSWqx/nRNBIHXqgM6X89cleBevcU4zT7VN092XwGeOu84oOylcuc+uswxbkPX+89/JX0T1iBVZSGEJS8ZEJlZy04tx0XMg2rHQxsW6yaMQErhqcZZDCrd7MXlS51Gadwm7chQ26iIQQKzANPL+6IxRuROfzSjShV5/y7to+20yE24YZcpzG8J8nIDt5x6tAdCzx1NOvR9iR8YG6nPyNQJtY0pOYz2GwKPYBrYF2VUsi/p7vXSg51yC8txfPC6fEu5m8n+IigQzfTz7LTPex+BxW4wz1jAig8UnFw9yCI/5Wg5WlZbDWgpV8WaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 22:16:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 22:16:37 +0000
Date: Tue, 13 Jan 2026 14:16:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 10/12] drm/xe: Add exec queue active vfunc
Message-ID: <aWbEQt0B/7CRgfzA@lstrano-desk.jf.intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
 <20260113025232.3504648-11-matthew.brost@intel.com>
 <ea9d5cbec2dfd68f0cc2f54834b28055ca29ab92.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea9d5cbec2dfd68f0cc2f54834b28055ca29ab92.camel@intel.com>
X-ClientProxiedBy: BY5PR16CA0010.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0cfe4c-4972-4440-80df-08de52f16afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1JlakdBYngxRzFPRk9ET2E4akJaUXhJeTRwVEh1YjlOOXRKeDlRbDRSNkZv?=
 =?utf-8?B?VHNCNmp6MmJkVVFJT3RoN1lXakJmU3ZHa2dsanBTaHNJVERQVUZhSEYwNjIz?=
 =?utf-8?B?OFBSMVpaQmE1VVF5bEEyRTBkRitDQk8vclMxbUZBeDIrbmdNc202VStWRlNH?=
 =?utf-8?B?cmJjOFRBRS9sSmFXaHdITDR0WUpOWC9JdzZLWk94VzNYaWU4V1BwVXZUKzFw?=
 =?utf-8?B?MGh5TnZHWkx3d1VaM2JHc2hMZkNtSVRzYnpIMEwzeFFVY1RsT0JtdFZuWno3?=
 =?utf-8?B?OVU1L3RRNEFYczN3MlNQREg1QkpZN2QrWCtSWG0vdUh4U2J6YnVPRTJRaEtX?=
 =?utf-8?B?TStNMFREWjFZc1RReEFwOWxKRkQ5TG1saXZGcjBTcUpnRzl5UFJzTTRNOFJ3?=
 =?utf-8?B?MWd1d1BiZFVWdXRQWFMyVUV6MWFsMnd2dkVhTXUvUG9KeWlmdWtwbEIxeGhG?=
 =?utf-8?B?anVsNEdWcmEyV2JHSkU3d2ZvSjc5V2FmQ3d1b2RGOUJaN1ZodDVGTlB2VGRs?=
 =?utf-8?B?Mk1oNUkwL29tWmdDdFJaMExHbngzQlNDWG9xRjVObVlEdXFIVW53V3B6TXVw?=
 =?utf-8?B?SC9tYURaWmlpakFJcmdwN3pOWkloZzRSdHpyTWZDUm1qNkkyYjdFSHlJSmdk?=
 =?utf-8?B?UVNVZHQ2WE1tWVhvQU1ZVnZxNjJjejV5WmNFV05uRUNJVVc5L2NpcXFyT1dw?=
 =?utf-8?B?ZXF4ZmpKbW8rNlliMW5sQ0Z2NVFSTnFtQjJnMU16SlNGZ0dpT21aUkdhY2lZ?=
 =?utf-8?B?d0prNFIvTUkrSWVLZ2ZISHN1U1o5TzdlOHhnUk54UzBNbkx3LzJtV3M0c2h6?=
 =?utf-8?B?QWFuVDU4ZVlQRGxHRXZHa2F2YjRLenRNRUpTS3VpMWMzU2xmVDhnVmRLTXFa?=
 =?utf-8?B?V3ZiTE0xcEJwd1h6TVd4OEJXcnluNnVVcjdWbTMzaVpBZlRhRlhjUEJkQThl?=
 =?utf-8?B?K0M1aHRnTm1meXEwUDlmUi9oUmN1UktHZmVyQ3pGMFJ0VnhINGRNeU4wSC9o?=
 =?utf-8?B?d09kaGlIQVI2blFEenhRNUFMcU1TZTlEVmowdFc0WTNaUTZ5TWMwS01oZ3gx?=
 =?utf-8?B?akU0eUp3Y3dFOGVyNGNYcXljU2FvQkRlNkNkUXAvRmMvbEc2c0o5clc1Ujk0?=
 =?utf-8?B?YzI0eDlOUFR1R0dpNDBzU2JwcU4rRzRac0hwaWFDVHVITExWeWl0ZnhRS1lQ?=
 =?utf-8?B?eExWWkV1VlZwanVCNzZDR1hiYk5jeklOMmwxNlVQRXRJOTQvZzRMNjFoT2dm?=
 =?utf-8?B?bDJJQUVSNkY5VW84aWo3WnhPRC9MQ295Ym9CZ0l3dHJNYSthdWx5QnBiNmtX?=
 =?utf-8?B?MWEvY3Y0c1hUNTNSeE4xeXBMTkpTVlVoMnZ5Y3VBSlE1ZVdlMEN5RTBNQUxT?=
 =?utf-8?B?enlhSU9CbVhrWmk0TjB1cEw1NGRPRElQdmJlNG42VkcxbFpEdm9jL2JWOHRo?=
 =?utf-8?B?N1FzbWR1cmlINkpveWlxT0ROUW9seVJ1UGNXdHN3QnF3OWJVeDdTeEhDSllP?=
 =?utf-8?B?OHdYNUp6UUlQTDEyZzgvRlFMdGkrY0lKSzNjK21IUEsvdk9hQVJ5UW82eXJ3?=
 =?utf-8?B?L2w0ZmJoNVUza1lucWZNaFJMc2JoY043NzNKOFV6b25DR0FGOWkwQzlvUTgr?=
 =?utf-8?B?eGx3Y0Y3c3dsTmU2ZUxJUitnS2NHbktmM05XenR1dWpjOTJaWU45S1puU3Vn?=
 =?utf-8?B?akkyRUVjSFBDNU50QUZwNzhHYkRWNlo4cnRQeVpmWU9rRmxGRFBJU3RMM2tp?=
 =?utf-8?B?eDVSU2JBZXN1Wm1nVzhzN0Vxd284TFhyVEQxRUNqa3VqNVQrSWR6cFFZV2ht?=
 =?utf-8?B?RGZvOCs2Z2o4cWNqUTFFM1RlelJ1QTNMSGNoN212bGllWWVXTHJUVlhzaFVy?=
 =?utf-8?B?WHdrMFNtczdwOVR6VUNibG1kN3NYMGhwZVk4ekYwbzRGRFdxdWcxc3Byc2NY?=
 =?utf-8?Q?xFUidPWetQa9U96V67myRbV4i9hcIptw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnZEUVJ0dXdUMWFQT2lMTktwL3dJcWJobjR6aXZMM0hjMkIxMHQ5emU0N1hl?=
 =?utf-8?B?bk14b20rWkd4R21HaGZJNm1ZdGs1eVE4RUpQdG5NUUxHNmdIS0xFSzVCaGFP?=
 =?utf-8?B?cjZOQUljcFNZQ2hmZExaRlZMRmZrbzJwTFUzeFNwMHZiYmQ0c0lBM25qWGVQ?=
 =?utf-8?B?ZXQzSXY3UnhJLzdPdDRBSWJJaXRKSEg4N0s0UHZBWUErUEJBSmorbDZWQW5Y?=
 =?utf-8?B?dVBwMk0rbENHamlwZTdXYUs4b3QweHBkRnEwd05qT09iakZFQXJYRXBKamZi?=
 =?utf-8?B?USt4K1crdkUwSXU4RnY0Mk5wWTVkcmFscVU5RGt6dDlVN0YvOS9WcGpBbit6?=
 =?utf-8?B?SzdneHk2MU1wY25JNm1RRzdHS1BaTjVwMkVpb2IrQW5JYzNMbGNXelFsNWlE?=
 =?utf-8?B?Z3gzWW5ZbURqU2JTdkhlSUpZOXdXSUpvZHVLSFRzSy9hVHpSai9GemNpV0Jj?=
 =?utf-8?B?UHR1RnRCU2dSQU1nMkVodUJUUDVwTjVQbWpwU0RsTzRLQ3RmWFBwR1U3Tys1?=
 =?utf-8?B?c2ppbitvcXh4VlBkaUNCaDVSR3ZHU0RBY1dpcWVvMVpZTlZ6Z1dwR2VtSnk5?=
 =?utf-8?B?bHlDKzQ4Yy9peVZXR0tSbzVFTHdtUmUvOEZpUDBPZHM4NnlWYmwvbW1wb0cx?=
 =?utf-8?B?aEpXY21FdWwvUHVJc0c5emphc2J5Sk1PM1BCMHRFWkQwN25mVmNvTUZpYjZC?=
 =?utf-8?B?OHZycElSVnNjUzFJMEFCaUlBK0hqMjRIMElYS1NoeUs0OUhPM1FqZFd1V0pk?=
 =?utf-8?B?U05iYjYxSGpabW93NjZKc2hjcEhRQTF5ZG82aUswTnZaT0pjNGgwNFVjbEh6?=
 =?utf-8?B?dTdYWkF0NEVzTHJNUUcvZDFVUG5sbWJGUG1rdTJwM2RqSXlDWFpkNEVhQlo5?=
 =?utf-8?B?K25sWjI3eVJIUFhyOU1SS1BNTEt3Yzh2RkNYTWR4cVVNTmZyQ2lCRVZlSGlw?=
 =?utf-8?B?akZKWlRZQ3B0ckNYbGs0dUVLWTZubGFWOG5MV28wMER6TjVlUmF5WEtoQ1hl?=
 =?utf-8?B?RittSE5aQlJjMzVpbE5EVFlxS2lYUkFXQU02aVBrR2lTakd2M0VpblFvcHJ6?=
 =?utf-8?B?bG9SengxNWd3OTVIUHN5d1Zva3N0dSt2SnNHMWxMSGtaZ2JGTHBJc0FNeVpB?=
 =?utf-8?B?TE5uaENtZ3hMWGFNaHNCMlQrSnBLVllQYmdGOHBMcWlKOXZwa1JZSHNoK1RZ?=
 =?utf-8?B?M0RpOStncnRCZjN6Uyt0WUJVQ0kyWHFScUIrSGp6cXVMRVY5c3dISUVydmMr?=
 =?utf-8?B?UTNTRlFiSldLVFJwR0RWaWJiZ25ISHc5RjhXdVBNWEZKRzRFZDJ1UWhBSXZx?=
 =?utf-8?B?V0dUNGZGRWU1NWg3UjR4Rjdhd2RTdTN3Y1d5ZWt0TU5TZ1RaV0QxMEJWRnh5?=
 =?utf-8?B?NjlicVBPSHZLcWt6UVJtdmpuTUNlb1pkaXpwYzFuVjBiZTZXaFI0bTdCUDN6?=
 =?utf-8?B?MStRb204UHU3WnltSC9PRUQwZkVxTEtFRmhPeElhTlA3RkJ5eWtBVm9aOVpO?=
 =?utf-8?B?dXZiZktHR2NzWlNkUmVxK2pkWkpzRThneW5TUUZWUUlHaFZZSGpUdjgvTlA2?=
 =?utf-8?B?VkdZOXhrZmJvWGtaWTRackhMU2o2ai95b1VNc01aYmVqN2tTQnVDTlRTbG1R?=
 =?utf-8?B?QUNOVnFScUxzekJmU0lwMTYybFAwZ1VSRmp0VEJicnk2aS9TYWFiVEZONzBv?=
 =?utf-8?B?QjJnNnJIYUZ5Vk5Ra1BzS2ZWRys2U2FqUFBFb09SK3kzelZuUm84RHQ2THZr?=
 =?utf-8?B?YjdpWWJlLytWUDUwY2lJNkIwa013cUNkbm5Nc0h3MlBhRVBHWGFsRzBXZ2sx?=
 =?utf-8?B?Y2RrOVE4T05Yd3VxQzRzcXdYcUJWVjFJY215cnVDYWoyYlVIZ2tGL0lFWUVW?=
 =?utf-8?B?WUcxbWNoNStML05ydUQ2T3FReHNtSkZjb0ZBc21lVWxsQ3FTUnRyaWd2dDFO?=
 =?utf-8?B?anZ2RVFTRis5MVVMMFNERjNBZkcxc29aZjhSakNUdm90YzhzczFRcUlTVFdE?=
 =?utf-8?B?V1JISzhGNlpRSXBRRlBDbjBORThCQnNMMkRtbXlwT1Q0TUc5UHdiSENTclNL?=
 =?utf-8?B?ZUltK3dNOEp3dllmTDZiVVpYcGNmRFpFZUQ2MHFsMjB0V0JhQVZENURFTnZZ?=
 =?utf-8?B?WXg3YmljZTI1MzREVnYwZEt0VUR3elFmeFhRSzFVUG5DM0R3NTgwai8rSUtC?=
 =?utf-8?B?MEZCSW9hLzcyOXIrcmhIc2VsUnBLTDdMeFZIVFV3UTV5QjBaMU0xdU40NDFj?=
 =?utf-8?B?cUFqbHZQZUh5RytkRGxDUUc0TUEraGJ1MjhvcWRsMXpGcXhoOWRteDhycUF5?=
 =?utf-8?B?MWpzbTd3ZFZ4V2pjQmxLS0p2Q2VLU0NVME0wUUJ2Q0c1blp1dVJHVnBxZnpO?=
 =?utf-8?Q?0zZZyR0S1Q7VY7zI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0cfe4c-4972-4440-80df-08de52f16afe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:16:37.0174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7lwq+5F65kqLhbHeOEESCuQuQOpDhWA4m4WksLgid8qDR5O7m444g+0/MuZ7ibbVRGEgNJSkLwQW05mUeA3HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
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

On Tue, Jan 13, 2026 at 02:32:58PM -0700, Summers, Stuart wrote:
> On Mon, 2026-01-12 at 18:52 -0800, Matthew Brost wrote:
> > If an exec queue is inactive (e.g., not registered or scheduling is
> > disabled), TLB invalidations are not issued for that queue. Add a
> > virtual function to determine the active state, which TLB
> > invalidation
> > logic can hook into.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
> >  drivers/gpu/drm/xe/xe_execlist.c         | 7 +++++++
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 6 ++++++
> >  3 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index d3e2789cf5bc..9cca558c5809 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -298,6 +298,8 @@ struct xe_exec_queue_ops {
> >         void (*resume)(struct xe_exec_queue *q);
> >         /** @reset_status: check exec queue reset status */
> >         bool (*reset_status)(struct xe_exec_queue *q);
> > +       /** @active: check exec queue is active */
> > +       bool (*active)(struct xe_exec_queue *q);
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > b/drivers/gpu/drm/xe/xe_execlist.c
> > index 46c17a18a3f4..e4a2674f48c7 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -469,6 +469,12 @@ static bool
> > execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> >         return false;
> >  }
> >  
> > +static bool execlist_exec_queue_active(struct xe_exec_queue *q)
> > +{
> > +       /* NIY */
> > +       return false;
> > +}
> > +
> >  static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
> >         .init = execlist_exec_queue_init,
> >         .kill = execlist_exec_queue_kill,
> > @@ -481,6 +487,7 @@ static const struct xe_exec_queue_ops
> > execlist_exec_queue_ops = {
> >         .suspend_wait = execlist_exec_queue_suspend_wait,
> >         .resume = execlist_exec_queue_resume,
> >         .reset_status = execlist_exec_queue_reset_status,
> > +       .active = execlist_exec_queue_active,
> >  };
> >  
> >  int xe_execlist_init(struct xe_gt *gt)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index be8fa76baf1d..19282e5ca897 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2203,6 +2203,11 @@ static bool guc_exec_queue_reset_status(struct
> > xe_exec_queue *q)
> >         return exec_queue_reset(q) ||
> > exec_queue_killed_or_banned_or_wedged(q);
> >  }
> >  
> > +static bool guc_exec_queue_active(struct xe_exec_queue *q)
> > +{
> > +       return exec_queue_enabled(q) &&
> > !exec_queue_pending_disable(q);
> 
> So I think the requirement here is !exec_queue_pending_disable &&
> !exec_queue_destroyed rather than exec_queue_enabled... But if the

If destroyed is set, the refcounting exchange in the following patch
will fail, so exec_queue_destroyed check here isn't needed.

> context isn't enabled (set runnable to true in GuC), it means hardware
> shouldn't be touching any of the associated memory anyway and we
> shouldn't be issuing any invalidations, so this still looks ok to me.
> It means we'll be doing full invalidations for those I think though
> which could add some performance impact in the time between register
> and enable. For now though as long as this is working (still doing some
> testing on my end and I had some questions in a later patch), we can go
> with this.

My reasoning here is that the context is not enabled, so we don’t need
to issue an invalidation because the next context switch to the hardware
will issue one—that’s the current hardware behavior. If that changes,
this could simply become an exec_queue_registered check. I forget if
this is changing in future hardware.

I also noticed I have a multi-queue bug here too. This needs to check
the primary queue’s state for multi-queue.

Matt

> 
> Thanks,
> Stuart
> 
> > +}
> > +
> >  /*
> >   * All of these functions are an abstraction layer which other parts
> > of Xe can
> >   * use to trap into the GuC backend. All of these functions, aside
> > from init,
> > @@ -2222,6 +2227,7 @@ static const struct xe_exec_queue_ops
> > guc_exec_queue_ops = {
> >         .suspend_wait = guc_exec_queue_suspend_wait,
> >         .resume = guc_exec_queue_resume,
> >         .reset_status = guc_exec_queue_reset_status,
> > +       .active = guc_exec_queue_active,
> >  };
> >  
> >  static void guc_exec_queue_stop(struct xe_guc *guc, struct
> > xe_exec_queue *q)
> 
