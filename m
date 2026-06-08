Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7F7CD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 17:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C6310F7E5;
	Mon,  8 Jun 2026 17:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfoO+xTi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AD010F7E5
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780940036; x=1812476036;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5dKG1mPcEgt6iysDqZcERdbVHH1OS37hgLyl2IP04lA=;
 b=BfoO+xTi9BaQiwpDet8MVG5VE5HTojLfhTdVcuRcom8nSNfl8i3sK/ph
 /QK43zyu9XyJvh2fRSDMTDdDzq4nYga7efmXqExPazOTJ40yNwbWn5lpV
 +acuHLrG7+5+GPYZbZ3y3ZCv+fS+2H6Cp0kxO6HgdnYEys539TBoHNA9t
 I2cTAX4vDHeav904zgfBsbGJaD7uL7Ww9N4qJsYaCaSRQiKKtb/sx4ych
 Q/9mSReTm+8xQDTIBAVGYjgqfrdlr7Kg2x06txp51vtvpkWHpmpMyktcq
 S/tP9yXgE0G7tscOKN6CnOZrHP/tjLarcEQlGwDht3G+P5BfKn1/WOosJ w==;
X-CSE-ConnectionGUID: WtM6xlBcSNuuxa5tXb0+SA==
X-CSE-MsgGUID: IaI5tSu1QM2Ye/h0txFxiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80711364"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="80711364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 10:33:55 -0700
X-CSE-ConnectionGUID: Dwv2ccAJSoKM2DhccLcOHA==
X-CSE-MsgGUID: yT+Aa6RzTDOjjuoouZmCAA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 10:33:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 10:33:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 10:33:54 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 10:33:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeyDkfjmQG8q1O2JEvWiyhpSdiVbdboq65trvU5sjEeKkP/e27lcVbZ5LGYK0cCXinvzOvpeD1VOiNaLavqUAoNhGlR3hWWkWeWWrQDkknZqucvve3Mhu+oDiEfeRFqT60QjR7E4MyWAEx8NfdUroGVfleA4bp0jmWp8ZAfrF9Mv0d709Te82zNJgkViLRXtXjS3Ruwb5APhEHcKg9RghBw3NTymIi6nORKBcO4WPgaCpaWtDS8Dzbb7wLTG6hJ+rhHuF5/chHlRCjapo21o9tD3rPL8IrtHoRbHBMnNNKwGgGAaOLINlxGZMuDt9RVjQgp0st8HVESiXwIhI6bKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92tGcX9U/wsupdQHweiW5VXhFBtEVTqDYg9ALP7zoJE=;
 b=zSkFi2oruqfzT+G6xvy8wnsW9VeczG8D32W/SG2o+n1p3EpI0c1T0gu25sRgR42I4MmZoePTtIxDTO5r7JDXGfAU6Efs0ajPyfBObizaofozPMpgQm5oBNH4aoo4VB9vl952iwLXTdn1NMRIRR+AzaOxWIN6kM7bpZRttV6Z1rQ7KE29uaZrTapSGzoaKemPjtTLfF6y8FS91P5U5VkyvoAoo98jbdNaRM0C1ExbTVs1URXxtEFXCEvBSs7S4bewx3ncRJ6OomZzACzi+wXBWiFC8bRK8XLDvFy/5vB88dVOH0izrP5yCnw+rPeKKpY5pTscVxeD33H0Z7F8EK06cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFF3F4DC26A.namprd11.prod.outlook.com (2603:10b6:f:fc00::f62)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 17:33:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:33:49 +0000
Date: Mon, 8 Jun 2026 10:33:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix use-after-free race in xe_pt_zap_ptes and
 xe_pt_zap_ptes_range
Message-ID: <aib8+iiirtA0Wxz/@gsse-cloud1.jf.intel.com>
References: <20260605105202.1664464-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260605105202.1664464-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0270.namprd03.prod.outlook.com
 (2603:10b6:303:b4::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFF3F4DC26A:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a71fbc6-c08d-4a8a-3a09-08dec58419b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: lxEdtObc6abPPNSHnHWdOFbDlFMVUIdYPbHfAiZ4AcP1mZAUEO+71pTCQJfv+Xa6hrd2Md62hdsqCnAzdZMy7Q7CZfcnUhsNVphz++eolRQLrM9VFd/hR1oUyqIuF+2hci0e4VqJeui9t/C0RuYsz5wxyfO8BbdBlMAAO6uWjrz1CisiM0xVW/JIHa4Aigt58RqcFK0/e1LE4rOChXxcNv4SqXHKLJ0fuG2iYas4iXOeGDJLUZ2v+U2rikDoTK/PTRrCA/hYfnTDos5vj5tiUCAIYCNGGXgC1PZQS05cRuAWPE/++3oWBC0FrK7YcEI9O+vPapZSLV+5AAygSCoG3PpdKO/3EWKFcS6fQIzi1qbueQOr6xioIEfHr+fdw27Se1Hln+ZNoX/1QmidiZl/F/REPXQRGlahKtlBGgGsF9qUYzr1LGNljcBtqZfqBUhI8To9IJf/0jTtvTEkG7/YHg1gyRZOqlmLloN0VN1PeJuu8J+B0Gah+EKaDtp4/T6cd++H5fJUYSwOoOfquyahyVdrYhICXi5HKTzIuHGkTl8Muym4dHROv0ZiM4S/kukjTfSzYOKhKZiBdQKcce910gf4J7Mpb0slxSkUQfowN3CRsLs2NgMEyzpdwXnuaeLGiPoseV29r+5qJrXdMG725gbf2xkfQzNJykMeI7VrwVtvxqUEreSeZz5DHI6CnGqM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0I1SXFHWTcwa0tMOWxNNHZMVENHOTBJdC9yM1dKRnh3Vi9semUrbjhpM3hV?=
 =?utf-8?B?dkFGSnJDMVZVSmVaSitnbnowZEwvQkxFTmwzMUo0LzF4OEF1RzBMaVgvODVn?=
 =?utf-8?B?VFZORktKM0N2SXhmZzdaQzJWN0VlM2hWUDFORkJpWlNkQ1BYUnZWVnZQMXhY?=
 =?utf-8?B?ajhScHg4V0FPNWFkMVZRRm9IUTR5Ykh2NEtadGhPcDFLYTlVK1VSNVROR1cr?=
 =?utf-8?B?LzFZajVnRjJvR1NMTXdHZ0hJRnZJcGlVcER2alJTS3g5MzJzZXNEeFgyU1Fq?=
 =?utf-8?B?MXAzNGlyUjRubjBWajBVWHV3UjZjT3N5cGpIeWZNNFJoRnRqWmNuZ2gvanhw?=
 =?utf-8?B?RXJOU1Zyd2lLaytoRUF4ZFpISGpVNEhoREpMb0hLeXRqNDFVVFNQSEZpeDVU?=
 =?utf-8?B?ejk2UU9DdGJmdkMzNzk0T3BkOUFsRTdYaDZFanRPMlRDak12NWtQV2orblV1?=
 =?utf-8?B?SjBQcnhqRVFvbzFadE0xd3FKSElwN3NJWklTMmVpa3I2NS9tUGc1NndxaWg4?=
 =?utf-8?B?VFQvS0dMWEpneFZCYVBGTVFhd1AwaDBDa2JhK1ZQbUFIVGViaURLdkhWbjBt?=
 =?utf-8?B?N285ZmgwY0JjTHkrWmNPaHBPYW12L2NpcThDczk4WFByOE95aVg5RitWcUtV?=
 =?utf-8?B?MTk0Y2ZUUGZLenBlVlZ1V3Q4dFc3Q1hrUUFQaXNlc2lrODBqZVBxVm1ObSt5?=
 =?utf-8?B?cWI1YkFPZTdTK2l2eWt3WURNbmFyN1p5VGxMcDVuMlFuVE8rNVB1c1c1ZkVv?=
 =?utf-8?B?eUtsSVM2QlpScHZ1YzhyaFJMcXJOTEtWVExqaE5BZldyOHQvZ3JjUlhaemtM?=
 =?utf-8?B?WUlRb29TZ0QzV2xmQlo3WDduQTFwYis4QlNYVkRIZTFvMC9tUDJVTHQyaXZm?=
 =?utf-8?B?NHV3TTdpMGd5a3VPODVQUnE2QVRwbmZ1MWZFVmhReFBRMEpqVC9FN20wcG9k?=
 =?utf-8?B?TFJrRURBWHNGdnlVK0d4enJvb3g2SDR3Z3o0UExMSHV6QkE3dFJVMzFSOUVw?=
 =?utf-8?B?YjlZa0N5ZUg5VHQwd1NkdFF0VUQwV044a1RVS3MwWGJTWGhPdXNlQ2NtQW1v?=
 =?utf-8?B?SHFqeXZBUFRoZXJDczFRVlh0a3d0cFFwY3lLVWtuRWFFTkNyUXNJZDNGRzZw?=
 =?utf-8?B?UDVjeTZCdFdSbEc0cWt2OXprdWpYN3NLaFhBNXlRUmFwZ3NUVU83WUorWmpE?=
 =?utf-8?B?emw2QnpOWlArWlRTbjl3aFo0VC9lOXQ5Q3NTMTBNQ1pWeXFqUk9FOGc5SzBr?=
 =?utf-8?B?aU1rYksxdDJ0VjFLZE5xVlpiN01qZzdHMlhlUU5ONDhuQmplR0d0R2Flbmty?=
 =?utf-8?B?cmRlT3VsNTBudjVFU3dWay9FdVpZZjZESkJvc3hwMzd1QTJoQXBiYmorMHZs?=
 =?utf-8?B?UWk3WWNOTHFqeUZiSk5FV2Y5K2tzZi9LeEVBL2FTbUxSVlZPcGR5SkxFTU1u?=
 =?utf-8?B?ZHlHTytqT2N3MTV4N1ZBMjhVQ3djSmJ2K3JZalMvaGJsanIwekJOVjhVNXpO?=
 =?utf-8?B?TE1pM1RZeENRdlFDTHErVmRSNW9aU0xvajBidkNiekZCajR4ek84QUxaOFpn?=
 =?utf-8?B?dWlGQWE3aW93NkVnWGRwWUY4L2FOYkovMUFTckY0emh3dnhCNDBwY3JBdHlD?=
 =?utf-8?B?VE0zSUw0ZVhZU2lEOEZ0VVNMVzBPNWFrWkNWNzFzVk9idEVJNUxoa1d0U0ox?=
 =?utf-8?B?OVE4Z1V6TEJHOHhzNXBFdmZBVUo3TUJZZmJiTnNqMG8zZXpnQjVmZm1xZGZq?=
 =?utf-8?B?QVg5d3VlSGdaYVN3U0sxZFo3VVBpUzNNaUN5a3BTOEk3RHRGY1JCdGo4WDB4?=
 =?utf-8?B?SE1IUitob1A1bzJjOHl0QVoyNTJUNWFPUEd1MUkzOHhMRnNKZ1VESzRNNHFP?=
 =?utf-8?B?YyszOHNEaG15bTUyWWt2MFdlcGZmekM3ZUJtTDJnbms4UUR0UFNiSVFtcUpq?=
 =?utf-8?B?dHhXSG1PaG5SZVk0QzBEK2pXNU9rRjlCai8rNjV2SGFyM0VSZlJaWFpzb1k1?=
 =?utf-8?B?Mlh4UGltUlRIVnlMUnZVSSs0anNGajZRb0NOd1NNUXQ4RzRFQ3Ewd3Q1dG51?=
 =?utf-8?B?RTRPeklUdUpURStMcjZuYmFoZUxDT2djMldsK3FjSGtxY21vSTJuTHhiRCtr?=
 =?utf-8?B?ZUMzUjArR0w5QXAreHhzOEs0dWY4bEpSNko0MFVtNHd1RTNnMWN1cVMyWlJF?=
 =?utf-8?B?MVpEZTRGaEtEMUhVVCtlSmpyUEhZM3kxNWdZQjdqZFdEM0sxSEFjYlprODI3?=
 =?utf-8?B?Uk8rOTI2S29ROXFLZDg5QTBxeUh6aStKaUwxS1NwRGJLNVVzT2dpeFRuenJn?=
 =?utf-8?B?WnpFL0FvQ0IzdUQ5b2IwcU9SelAyTDIyU0NIdFpZSnVLTE1FQU56UT09?=
X-Exchange-RoutingPolicyChecked: RfZPgcLq0BNz+smrgtq+ukwi4pqzM6lnLdOFIcKd3QkLIfkn1zm0cq9Jq7Fkr+j8erlj4nwquspjOYWMMXdcWgX5xiv6cEZ/OqWbds5QIrt+hE633alR7wP+UD19eyF9ZkusSoGqYmUm3zIXwscQYAnuJ/n4aW5JHUZGkd79afbjaEIDdOKOgoE3T7V3XOdy7Z7dqVd3uFxy8/i4StrC9iy6vkyLvYbqPEWwraOcXq72KLmkjnqdEHbUuf8lT4zkgAota0Qw0hEUNqf/vfRxyjYErPVAHvBhAJly31nb4WR8CdIUlWgc4WrhW3y5kDPT4Bp1pHQqWB7ZNhPsczK+Bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a71fbc6-c08d-4a8a-3a09-08dec58419b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:33:49.2966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJ2OeCa/Ri1rTgtNXsklEsTrkboxyZI94DSk4fTP+JIO22IawXdwnvCSHzsVVhBoUkasZsHautHLMdccbEP/7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF3F4DC26A
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

On Fri, Jun 05, 2026 at 12:52:02PM +0200, Francois Dugast wrote:
> xe_pt_zap_ptes() and xe_pt_zap_ptes_range() walk the page-table tree
> holding only the BO reservation or SVM notifier_lock respectively.
> Concurrently, xe_pt_update_ops_run() (vm->lock write) calls xe_pt_commit()
> which swaps children[] pointers and immediately frees the replaced xe_pt
> via xe_pt_destroy().  xe_vm_pt_destroy() has the same exposure during VM
> teardown.  Either path can produce a use-after-free when a concurrent walk
> dereferences a just-freed node. Fix by introducing a per-VM rw_semaphore
> pt_lock.
> 

This locking is very hard to reason about. I believe I understand the
issue—zap holds the SVM notifier_lock, but an unbind with only the VM
resv lock (non-userptr/SVM) could race and cause a UAF, right? These
operations  should be touching different PTEs or they would both hold
SVM notifier_lock so it ought to be safe, but perhaps I’m missing
something.

Again, the existing code somewhat confusing and a bit hand-wavy. With
that - regardless, I’m okay with introducing a dedicated lock, as this
series does, to ensure safety / make the locking clear.

A couple nits below.

> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>

I’d also like Thomas’s input here before merging, as locking is
difficult and the more eyes on it, the better.

> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 47 ++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_vm.c       |  3 ++
>  drivers/gpu/drm/xe/xe_vm_types.h |  5 ++++
>  3 files changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 15ce77ce7793..2dada51469c9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -919,10 +919,10 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
>   * Eviction and Userptr invalidation needs to be able to zap the
>   * gpu ptes of a given address range in pagefaulting mode.
>   * In order to be able to do that, that function needs access to the shared
> - * page-table entrieaso it can either clear the leaf PTEs or
> - * clear the pointers to lower-level page-tables. The caller is required
> - * to hold the necessary locks to ensure neither the page-table connectivity
> - * nor the page-table entries of the range is updated from under us.
> + * page-table entries so it can either clear the leaf PTEs or
> + * clear the pointers to lower-level page-tables. The function acquires
> + * vm->pt_lock (read) to protect against concurrent page-table tree
> + * modifications by xe_pt_update_ops_run() and xe_vm_pt_destroy().
>   *
>   * Return: Whether ptes were actually updated and a TLB invalidation is
>   * required.
> @@ -937,19 +937,24 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
>  		},
>  		.tile = tile,
>  	};
> -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_pt *pt;
>  	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
>  
>  	if (xe_vma_bo(vma))
>  		xe_bo_assert_held(xe_vma_bo(vma));
>  	else if (xe_vma_is_userptr(vma))
> -		lockdep_assert_held(&xe_vma_vm(vma)->svm.gpusvm.notifier_lock);
> +		lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
>  
>  	if (!(pt_mask & BIT(tile->id)))
>  		return false;
>  
> -	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
> -				xe_vma_end(vma), &xe_walk.base);
> +	down_read(&vm->pt_lock);

Style nit - can we use guards or scoped guards in this series?

> +	pt = vm->pt_root[tile->id];
> +	if (pt)
> +		(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
> +					xe_vma_end(vma), &xe_walk.base);
> +	up_read(&vm->pt_lock);
>  
>  	return xe_walk.needs_invalidate;
>  }
> @@ -963,8 +968,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
>   * SVM invalidation needs to be able to zap the gpu ptes of a given address
>   * range. In order to be able to do that, that function needs access to the
>   * shared page-table entries so it can either clear the leaf PTEs or
> - * clear the pointers to lower-level page-tables. The caller is required
> - * to hold the SVM notifier lock.
> + * clear the pointers to lower-level page-tables. The function acquires
> + * vm->pt_lock (read) to protect against concurrent page-table tree
> + * modifications by xe_pt_update_ops_run() and xe_vm_pt_destroy().
>   *
>   * Return: Whether ptes were actually updated and a TLB invalidation is
>   * required.
> @@ -980,14 +986,16 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>  		},
>  		.tile = tile,
>  	};
> -	struct xe_pt *pt = vm->pt_root[tile->id];
> +	struct xe_pt *pt;
>  	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
>  
>  	/*
>  	 * Locking rules:
>  	 *
> -	 * - notifier_lock (write): full protection against page table changes
> -	 *   and MMU notifier invalidations.
> +	 * - notifier_lock (write): excludes concurrent MMU notifier
> +	 *   invalidations, but does NOT exclude xe_pt_update_ops_run() which
> +	 *   holds vm->lock (write).  pt_lock (read) is therefore required to
> +	 *   serialise against concurrent xe_pt_commit() / xe_pt_destroy() calls.
>  	 *
>  	 * - notifier_lock (read) + vm_lock (write): combined protection against
>  	 *   invalidations and concurrent page table modifications. (e.g., madvise)
> @@ -1000,8 +1008,13 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>  	if (!(pt_mask & BIT(tile->id)))
>  		return false;
>  
> -	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
> -				xe_svm_range_end(range), &xe_walk.base);
> +	down_read(&vm->pt_lock);

Should be assert vm->pt_lock in held in xe_pt_zap_ptes_entry or do we
not have the VM there?

Matt

> +	pt = vm->pt_root[tile->id];
> +	if (pt)
> +		(void)xe_pt_walk_shared(&pt->base, pt->level,
> +					xe_svm_range_start(range),
> +					xe_svm_range_end(range), &xe_walk.base);
> +	up_read(&vm->pt_lock);
>  
>  	return xe_walk.needs_invalidate;
>  }
> @@ -1079,6 +1092,8 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>  
>  	if (xe_vma_is_userptr(vma))
>  		xe_svm_assert_held_read(vm);
> +
> +	lockdep_assert_held_write(&vm->pt_lock);
>  }
>  
>  static void xe_pt_commit(struct xe_vma *vma,
> @@ -2638,6 +2653,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	}
>  
>  	/* Point of no return - VM killed if failure after this */
> +	down_write(&vm->pt_lock);
>  	for (i = 0; i < pt_update_ops->current_op; ++i) {
>  		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
>  
> @@ -2645,6 +2661,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  			     pt_op->num_entries, &pt_update_ops->deferred);
>  		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
>  	}
> +	up_write(&vm->pt_lock);
>  
>  	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
>  				  &xe_range_fence_kfree_ops,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 080c2fff0e95..b711c12bf751 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1580,12 +1580,14 @@ static void xe_vm_pt_destroy(struct xe_vm *vm)
>  
>  	xe_vm_assert_held(vm);
>  
> +	down_write(&vm->pt_lock);
>  	for_each_tile(tile, vm->xe, id) {
>  		if (vm->pt_root[id]) {
>  			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>  			vm->pt_root[id] = NULL;
>  		}
>  	}
> +	up_write(&vm->pt_lock);
>  }
>  
>  static void xe_vm_init_prove_locking(struct xe_device *xe, struct xe_vm *vm)
> @@ -1644,6 +1646,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  	} else {
>  		init_rwsem(&vm->lock);
>  	}
> +	init_rwsem(&vm->pt_lock);
>  	mutex_init(&vm->snap_mutex);
>  
>  	INIT_LIST_HEAD(&vm->rebind_list);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 635ed29b9a69..3bc45991f607 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -271,6 +271,11 @@ struct xe_vm {
>  	 * VM
>  	 */
>  	struct rw_semaphore lock;
> +	/**
> +	 * @pt_lock: Protects page-table tree structural modifications from
> +	 * concurrent reads during page-table walks (e.g., xe_pt_zap_ptes).
> +	 */
> +	struct rw_semaphore pt_lock;
>  	/**
>  	 * @snap_mutex: Mutex used to guard insertions and removals from gpuva,
>  	 * so we can take a snapshot safely from devcoredump.
> -- 
> 2.43.0
> 
