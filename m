Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A25CD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 22:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8AF10E29E;
	Tue, 16 Jun 2026 22:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvM6Cyti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F5010E29E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 22:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781650668; x=1813186668;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XNp8u1G+rr7HlYwiZlyPa6zBL2me8SBy3mBm5wc2cLk=;
 b=QvM6Cytijt4wbrNwU6guL0j73cxmMjBMW8F8UCysDH0XxI6xlYmII3Xq
 ru8nLrXQmXWSvaj4Z0416d3YRby/oaELzv9dRImpDmErn2s+ZYLtJzNI0
 Otp5PACfR1sXKWG8nKUKyeDQuWtLta4y5gSXKHwupwt1qE6yQ+lFeZHu4
 nSHx5yFgGrZXWtqJ4JVdv73Uzm6MDg025/OS6dvIPsoZELboY5JMBoxGE
 74SUc1zl4UdO5QyaLLCn39aG0VQJrNBztQnpVAL4IZuk8FUugSyZvfskm
 5MMSmc6pI++tPPv8qPZWGV6k826+FfSwunejJMZWVbGTX38nvRWFtNM2Y A==;
X-CSE-ConnectionGUID: Gx4+g+B2S3qv0w1bUac8xQ==
X-CSE-MsgGUID: XMzzRylBR1W5nS0Q515pXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82336264"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82336264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:57:48 -0700
X-CSE-ConnectionGUID: OZCLnzwTSwOcQcAPJSZGew==
X-CSE-MsgGUID: dFSYtz8UQl6fHwvj8JRLMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="251815292"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:57:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:57:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 15:57:46 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:57:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILdtbdJmuE3GWwH3XFD8Y05+1LHsHv7XcJ7Sf330GqCW64VDmUVB/uqrgxUzux3eKo2vcoR5Dysy9Y4YjxwkLHT+KTBMyfqDXKJzCTFd+ukq9gtx4M0/sRQ6OREo1aLl+IAp1T5RNXqXXiq2D0/HiiULXl7eV5PdXxFyW6qR/ks6eiElok+ZS+Pb8nZe8yvQgQ9uV45oIjm1NnWYh+kDqRnIpz4eEl1ofCeRT88ZL6cZH8AMWW46LH4FwDn6+EGdRXlPrzh1r0QlD/6LRyX5Zwd/6VaJxBEXuaThQ0T1OE+tRtqBULyiWmhV1wesW5iMgXufPg+SIy8ekgCUu0Omrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bz9sddhYy5dVVc7+fHlYNKC+oKIuKNyD7IOf6lsy9EU=;
 b=YgbhfUicG6IVpUtcOo6rdKcU1sVK7ftwspNSEWKxKWMfdtsc3DQ9v1ALffoZtQTjwMiVn4UxFZV3/atNtG1d/XGO4xQYyNRDD1hBzbwNRkIpPnLJqlSFgqjfKiIw1dpJaMO6Ov0baQ/wcpGXHXkfOCsQn+ICTHRmij91Y56ThjhIWuZwYw//8n77ww1HhyqsIHuSErF6gqz41qsvU0OKGpo9M2dtGfHXYBL4Tk4s7Po5g5DExyR4b/eNmd1a1N30nx0j1tpfQXXIacpa4+9W0QfN2KjNCSvur+G0mCSypwSL31Xs8iv6F5awPX3bH7Ai0PRodR+EO8Hnr9V7kMg9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 22:57:44 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 22:57:44 +0000
Date: Tue, 16 Jun 2026 15:57:40 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Add workaround 14027094826 to
 graphics IP 35.11
Message-ID: <ajHU5EFJw-Lpy7Zd@intel.com>
References: <04a98a6d8566eabd96fbaa23cbc8545841863a8c.1781220263.git.harish.chegondi@intel.com>
 <20260612212543.GJ6214@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260612212543.GJ6214@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c2504c-7c88-47fc-55a8-08decbfaaceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: /Ach1EIo2K4bAp5P0qhtEk+KK3B6XHzy4b8oUw2SxljmBefSmx//ueCb/xSKWdIkWLUOKfZJqkd+bXsR5u/V2zColqh5ZIAdlXbJqFP9MdASeHuOpX4ttq/mSA5ZWleoEjOLVzR6uza7ngBqHqRtVPaDFoaDdHpnObdLhbGgDTrDaGV7Sel1CvXfXHRk+Gyux2Smzw1ZXxnNKYRad1nFeF0aqXb0r1F+ccQeQEJG/WeVh1qTYoFg1y46/ij1VYqW9hOVhp3oVjdJe3WXlxWzhgemAESrj1fmNV2Ir4f7RBctBNJuXKzrx3Is0jwCMVtqolNgt/CKmAdDro64dCSRslCxnhyiBpcmdaJMRsZqV9ScMeBY0drAw/TGB3wesj3J/9+0n3V2hV5TbsRnqgcuVOEuT+t6c1T+zvcIl1IQNaGbnGh6Y/hBcn2mHKKNBYb36aCNuZ4uptVPCXgX1n26Z1yylu2BayJztPODWkuuFxz8hDxUEqWJwLAlDDcQEzdsXSaaBdaj/bCvX65UQxS23wu5aOKbnWMFo8jsL2jL3OSMCKMhI38HTMQYLPhRAztVmvElp9m9CxeffXD9/oBogNC+WaEjDvEBKAJ1L2HCbF3lJydkOg/hIjo/CPmOhKhN1luD+QS1/ED+Y6SNNUPRW/xrW2ZlpNk+lzJD3YzRPbib3u3Y9y4T7zpsM1mnbY5Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnY3R0pwNnIrZDd2R24rQWxHNmJwQUlXN2dWa0ovY1RXMjg4TThaRUkxbzYw?=
 =?utf-8?B?bjh1ZFY3MGFydndnYnduTU03V3NjMERmajYzRHpnNWpuQVdUNjRTaDlGRUFm?=
 =?utf-8?B?MVE1d0ZSZ1JuOFVrOVlNTmFwSFhoekNKekR6NDNwN3ZSTUhqNGFoL1VDZzdD?=
 =?utf-8?B?T09peHJBK1piUWdmcGU0S2x5WlRiSFl5blpsYkloWVNINEhHRHUxZ01BR29J?=
 =?utf-8?B?S1ZxaytZditOQnFhbUtBL1UrMkx4Vmd5U3lIZU5CbisyS3RqeTdFbitLcVpx?=
 =?utf-8?B?WDZqQ2Z0Mk9nQmgrcDVWK1lwcS9jNDFDc0NZNzJkUkxaWXYrY1VYWUMzWitX?=
 =?utf-8?B?aDB5RVNNNUxHd2xWMU9aQ0Q2WTZXVWw4aVQvUVQxQTFoMWRQVXRxYnl1eXgr?=
 =?utf-8?B?cVlzTjE4Q1RwaU9VNWJneStLUHNSc3RsM2hYU25YZXN6TUsxTEtpakt3aTUx?=
 =?utf-8?B?NFVJLzlWNmRJbUduVXlQS1p5OE9DZmd4UytveHorSG1JQ2NRcERvbTFac3Q4?=
 =?utf-8?B?UWs2aE9qVWJZbDhmQ3RMR0hBR1lLN3RCNmhVc3RpMzhXQ2NQUDlMWUJkZXFu?=
 =?utf-8?B?dFJpV2dHTk1yMENaRFhoOHQ4UXRyelAwOW1rMjZPZ1oraXhTVlhpLzMyMGNt?=
 =?utf-8?B?ckc3dCtuUExPYTRkbW5uMG00U3NaandCWGpLS0trVXZ1UXRIeUc5K1N1YzZm?=
 =?utf-8?B?RG9DWTk0cHY2QXU1WmNjTkVFL0xGeWM5eFBCaVJUdFp4SVE0QXVDcFNGaENa?=
 =?utf-8?B?anhVN2tRS2phVndMZUdTelgwVFV4WHMrb1l0eTJmbEtldVc5U2RmR09iSWkr?=
 =?utf-8?B?ZFJlMklTbzZ2VVNCSzJJclp0LzZWdmNHRk5HOTM1d28rS1pOUFh5M2Y2bnJz?=
 =?utf-8?B?K3RMRTBjb0xOZVhENzY5QWoweUloWkdKVTBUOW5zSUZHL2l3cVMwdm5GaFkw?=
 =?utf-8?B?YWJEZCtBOXBoWDZPUkhCUVVoanF1U3RCbzArZnpxMHZaUDQrcEZLYSt4ZGNa?=
 =?utf-8?B?TkNRa0FjaTM1YmV2K2VsS3p4RFk0dndRWjA5WXhqZ2hjR2Frb01mOCs3bVd5?=
 =?utf-8?B?YmpuQTE2T3pxYzk2NTdJOTk5a3RieWFmZXo4emJMazd5Tk52Q3NvS3E4SFdV?=
 =?utf-8?B?dUVtZEc4ZGpPYnJqWGtxam5aUmdhb1BCUnJPSmlXRUdPajVhN2hUOE5VT1dL?=
 =?utf-8?B?aU4yU21mS1NLOWxCMnJtdXVWV2YxUVJyTVBza3FLMEdHdVpLMFdsVHEvZlhy?=
 =?utf-8?B?bkRCUFpVT05LMWo5eTB2ZGZFMGUzRFFjTGp2dDhQN0pBUmtkTkVJVXJRUEQw?=
 =?utf-8?B?VWhpS1NYMU9BL0ZRcDN1bHRvY0RaWnhuVi96NjAxUHgzMFRBMVBWanZBc2VH?=
 =?utf-8?B?MlQvdkRVeDRNY25YcjZBQVlhSFBldkg4SXVia2xwVUtlYWlGVXpCUzYybjlR?=
 =?utf-8?B?ZzRsemJCOEpjUlpIQW1JQUN5a1J1cXhUWnllN3pzSnpQbiszajF4Y2tlQmgy?=
 =?utf-8?B?d1VPY0psM2gyZkxVTzlLK3grWmdMNXpaR29MSmlZVlZDamoxRmpQdFVjbEwx?=
 =?utf-8?B?clNmL2dObFZPK1UzZFYrM1dGSU5WZkJoTEJsdVZLOU5sT2RST3VCZ1BLSHY5?=
 =?utf-8?B?emtlbEU5Zm9wN2hRRGoySUJPOUtZTm5WbkNXQldCYm43bFpJMUsvazhDbXNZ?=
 =?utf-8?B?QkpvOWR4QU1oNmdmRm9uUndrTGxPUUwwQWtNNXBHa2VhYTBlekR3Si9mbFBi?=
 =?utf-8?B?OUU3aVZhcjhZVXllYXorNURKMzM5MVhObDRWUC9MUzY5NzZZclZBdklhbXJ1?=
 =?utf-8?B?MllYSUEzRk01a1NUUEs0TW1pVjgwUlMxT0xPWVJsRTJVSFo1RWk3aDBuZnZz?=
 =?utf-8?B?S2VaMTQ3MU1hMDZOSjZiTURhMldTcmROdm5IVWIyMjZKQXVBWkFVZ1V4ZC9k?=
 =?utf-8?B?b0NhT01ERU5WeW0zeFBJUFhNQzU1aTdGV294UFZzWmpRbWg2eVhtbjJ0SGtj?=
 =?utf-8?B?S0YxOUorSGF1WGozQVJGQjQydEFreldQT1FtUjJpdFlKSnJZQ1dsb29EWTdD?=
 =?utf-8?B?OXpEZURHeENNTnpIMjJlRVFiaTlMeHg1M3pyL255MEtrTU5UZnA5QUJsRkVs?=
 =?utf-8?B?Y1FGQWNkWXZqM24zY1o2TmU1bnhndy9QYzVaNER6ZlBvakVCcDEyNlFaVVV2?=
 =?utf-8?B?ejdiRzhBcXkrcStPVW1GNm1zTmxUSCszdXVwVUczWGl0SXFPYzZNUzBjVTNo?=
 =?utf-8?B?MlM1V0NQYS9xYWxEUkcrTUVEQjJyY1lNVjJhTG1NSDlBRHV4M2hvVitCQW12?=
 =?utf-8?B?YURNOFNJOE9DTWg2WHJ5YWxBTVlENWJQMENCeEtQM3BlZGt4TkxTcHd5VmYx?=
 =?utf-8?Q?tbCMpG65xd6i+B84=3D?=
X-Exchange-RoutingPolicyChecked: MYzl3IFy0SqqrcCcbhCG4kEdg/arkveJJCc/HtykkyL02gw1SbQwFARcSm4BHW7AdnHhbZVRsHaRaCysYmzuBGUZawqpzGl3C7EPH+Fp/IEi4N0252qdM3QH8T1iICVvhi/NpVkZ9WGP322eklD/y0UIkBkxcwNOkW3l5sCquVVZE541shdaePO16R33O4RNjcv0B94is/T/6YoBlb5p2pya7UiL+j2E4SDENe7RdGOMVlgyQg8pJ8HJk6HY2Ueng44foiGbVxDmj/sBHtqgVgaddkEuS8ZHSTU75axuidwRBvcXLGfOD8EwK0YjTSdzG3DFyz2+CBhcj+D3dfsr5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c2504c-7c88-47fc-55a8-08decbfaaceb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 22:57:43.8785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPj+LTaFANXtVgLym3d2WfBV86xaRMaNxhKt2nNn1WQestsRponOTb6vyiHGArpaOk1cBiIjGLPifhJtK9NQM3oDGUtlwXPqeU321HAslDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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

On Fri, Jun 12, 2026 at 02:25:43PM -0700, Matt Roper wrote:
> On Thu, Jun 11, 2026 at 04:34:27PM -0700, Harish Chegondi wrote:
> > Before enabling EU stall sampling, write 0x20 to the SWF scratch pad
> > register. When the firmware sees this register set to 0x20,
> > it applies its part of the workaround and sets the scratch pad register
> > to 0x60.
> > 
> > Before disabling EU stall sampling, write 0x40 to the SWF scratch pad
> > register. When the firmware sees this register set to 0x40, it reverts
> > its part of the workaround and sets the scratch pad
> > register to 0.
> > 
> > Bspec update for the SWF scratch pad register is still pending, but has
> > been confirmed offline with the firmware team.
> 
> I think the key point we should try to get across in the commit message
> is that a firmware component, not the driver, is responsible for the
> actual implementation of this workaround, but that firmware needs the
> driver to notify it whenever EU stall sampling is being enabled/disabled
> so that it can do the necessary actions on its side.  A specific
> register is being used to communicate requests/acks about the
> enable/disable status between Xe <-> firmware.

I will improve the commit message to convey this in the next version of
the patch.

> 
> Hmm, what's actually documented in the workaround database right now
> says that the Xe <-> firmware communication is supposed to happen on
> register EUSTALL5 (i.e., 0x53c[9:3]), not the scratchpad register we're
> using here.  Is the workaround database's description outdated?

Yes, the workaround description in the database is outdated. I have
requested the relevant people to update the description.
> 
> > 
> > Bspec: 53188
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
> >  drivers/gpu/drm/xe/xe_eu_stall.c     | 46 ++++++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
> >  3 files changed, 47 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 08251c7a1a4b..b86050503c4e 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -616,6 +616,9 @@
> >  #define   CCS_MODE_CSLICE(cslice, ccs) \
> >  	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
> >  
> > +#define SWF_SCRATCHPAD				XE_REG(0x4f000)
> > +#define   POISON_SUPP_MASK			REG_GENMASK(6, 5)
> > +
> >  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> >  
> >  /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index d37770c58c5d..4d0f97ca4cdb 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/fs.h>
> >  #include <linux/poll.h>
> >  #include <linux/types.h>
> > +#include <linux/iopoll.h>
> >  
> >  #include <drm/drm_drv.h>
> >  #include <generated/xe_wa_oob.h>
> > @@ -20,6 +21,7 @@
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_topology.h"
> >  #include "xe_macros.h"
> > +#include "xe_mmio.h"
> >  #include "xe_observation.h"
> >  #include "xe_pm.h"
> >  #include "xe_trace.h"
> > @@ -682,7 +684,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >  	struct per_xecore_buf *xecore_buf;
> >  	struct xe_gt *gt = stream->gt;
> >  	u16 group, instance;
> > -	int xecore;
> > +	int xecore, ret = 0;
> >  
> >  	/* Take runtime pm ref and forcewake to disable RC6 */
> >  	xe_pm_runtime_get(gt_to_xe(gt));
> > @@ -693,6 +695,26 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >  		return -ETIMEDOUT;
> >  	}
> >  
> > +	if (XE_GT_WA(gt, 14027094826)) {
> 
> It looks like the actual workaround number (i.e., the lineage ID that
> stays constant across all releases a workaround may apply to) is
> 14027054324.  So we should be referring to this as Wa_14027054324, not
> Wa_14027094826.
Will change the HSD number in the next version of the patch.
> 
> 
> > +		/**
> 
> A "/**" signifies the start of a kerneldoc block and this isn't
> kerneldoc, just a regular C comment.  Same for the next one below.
Will fix both of these commits in the next version.
> 
> > +		 * Writing 0x20 to SWF register will signal the firmware to suppress
> > +		 * poison propagation.
> > +		 */
> > +		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD, 0x20);
> > +		/**
> > +		 * Firmware will write 0x60 to SWF after suppressing poison propagation.
> > +		 * Wait until the SWF value turns 0x60 before enabling EU stall sampling.
> > +		 */
> > +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> > +					(reg_value & POISON_SUPP_MASK) == 0x60,
> 
> We don't really need any mention of "poison" in either the comments or
> #define's since that isn't relevant to what we're implementing here.
> We're just conveying EUstall's enable/disable status to the firmware
> (and waiting to get an ack back); whatever steps the firmware takes to
> actually implement the workaround is outside the scope of the Xe driver
> and trying to reference them here just causes ambiguity and confusion.
Will remove "poison" from the comments and #defines in the next rev.
> 
> > +					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
> 
> As noted above, the workaround database is mentioning a different
> register (and bitfield) than we're working with.  But even if we assume
> that the information there is out of date, we still need to make sure
> we're handling our reads and writes in a consistent manner.  The write
> above seems to be assuming that this communication is the only thing
> this register is being used for (so it's fine to just write a 0x20 which
> will wipe all other register bits back to 0), but the read seems to be
> assuming that other bits _are_ being used for other purposes and it's
> masking the value to just extract two specific bits.  We should clarify
> which is the case.  If this workaround's communication channel isn't the
> exclusive owner of this register, then we probably need to be doing a
> RMW of the register (and maybe also ensuring that we aren't racing with
> other register updates somehow?).
I have requested the workaround be updated in the database to use the
scratchpad register instead of the EU stall register. I will also change
writes to the scratchpad register to rmw. Looks like this workaround is
the only place this scratchpad register is being used. So, no race
conditions as of now?
> 
> We should also probably #define the 0x20 / 0x40 / 0x60 / 0x0 magic
> numbers with names like {REQ,ACK}_EUSTALL_{ENABLE,DISABLE}.

Will add these defines in the next version.
> 
> 
> 
> Matt

Thank you
Harish.
> 
> > +		if (ret) {
> > +			xe_gt_err(gt, "Time out while firmware is disabling poison propagation\n");
> > +			xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
> > +			xe_pm_runtime_put(gt_to_xe(gt));
> > +			return ret;
> > +		}
> > +	}
> >  	if (XE_GT_WA(gt, 22016596838))
> >  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> >  					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
> > @@ -730,7 +752,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >  	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
> >  	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> > @@ -840,6 +862,8 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
> >  static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> >  {
> >  	struct xe_gt *gt = stream->gt;
> > +	u32 reg_value;
> > +	int ret = 0;
> >  
> >  	if (!stream->enabled)
> >  		return 0;
> > @@ -853,11 +877,27 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> >  	if (XE_GT_WA(gt, 22016596838))
> >  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> >  					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
> > +	if (XE_GT_WA(gt, 14027094826)) {
> > +		/**
> > +		 * Writing 0x40 to SWF register will signal the firmware to enable
> > +		 * poison propagation.
> > +		 */
> > +		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD, 0x40);
> > +		/**
> > +		 * Firmware will write 0 to SWF after enabling poison propagation.
> > +		 * Wait until the SWF register value turns 0.
> > +		 */
> > +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> > +					(reg_value & POISON_SUPP_MASK) == 0,
> > +					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
> > +		if (ret)
> > +			xe_gt_err(gt, "Time out while firmware is enabling poison propagation\n");
> > +	}
> >  
> >  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
> >  	xe_pm_runtime_put(gt_to_xe(gt));
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index f8a185103b80..293aa83feca7 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -65,3 +65,4 @@
> >  
> >  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> >  		GRAPHICS_VERSION_RANGE(2004, 3005)
> > +14027094826	GRAPHICS_VERSION(3511)
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
