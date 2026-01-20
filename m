Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E07CA5FB9
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F2910E1A5;
	Tue, 20 Jan 2026 17:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bb6aVy0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C57B10E63D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768930048; x=1800466048;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fBTogrgb00/KY186MaXlDFC0wN438D7t81unqI8+N4U=;
 b=bb6aVy0P/X7bxjiTAxgum4E1SRCVOEV1x5kY6seIKR2q0OpoeSLMCupX
 X1wqjxcvJx5zY30xhW5K/3pPmY367kkoh7anLTs3SK8Gu1GkPtAe3nu67
 MWVl1TafMsdGRw9zBnNAtWoi+QAceByrreMPh2gyJMWRCZM8htnznXqsg
 sifxNz1RjsGwVp0AusbJBD385N3zCtkvGBk9u7YSLDsxQvgp6T7fW/zkE
 D0FhoaONo1xpRI/t0o1tsBC1lrz4qwPDQYzJuHHxvKolDGGgKCOMvnsxx
 loA9QLo76XxeDSHr1XhaZh8uwpKBER5T7ypSn0RBgPSY14WXFmRhjqW1H A==;
X-CSE-ConnectionGUID: Zg0wMQ4dSVekJf6ImjB87g==
X-CSE-MsgGUID: 3OQAmyhITN63OshrGfvzPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87725865"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87725865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:27:28 -0800
X-CSE-ConnectionGUID: jfT7Ye27S16RP6jSFQ3lQg==
X-CSE-MsgGUID: X4YV+rGOT3yu7/9J+QTnpA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:27:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:27:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:27:26 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:27:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTcnnXg4JjFYvk2/UCM8g9/qdp4yD2SnPR/fYvRxZYPTiDCuspf0eHMteOHB3M5+z5e/H5bj6bAIpiKSE1kjWyS1zwN9422SHJj6GwxjaeU9Gdn5FJdfE+qomGMxSo3PYp6K1PvLjoKyDn3kzwoFRYoxl47MWlCwGAOBK1uXzufhl/2WtYpCz3REstMNIB2d1gIDc7QRFfv2OV4cKyJxc8d6xTa48UK+ItoDWOXOrlFe6IxvCv4fNhkwA8cZfWZp0LajZ9jNyfBAeLFHcsUqc/RjHfj+SsXwMvJpJu1805l0KahCdZ3IDy8R4Cet9TLgX591fo25EB7DrwkpMfkPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6QsodRp2tfhB0tCC8hEPqXEwBmhpQzMgmFIw5OTTSQ=;
 b=aWwkJzdDqr0+CyRhjMgDfeV626BPTFNTEO6iCRz18eMp/jLzj2anOvMtgnWghjqOJ6XdtQkUqrXjzI6T76tLGmJD80WcAld1i8Ub1LDvrhWWo9GnmoWtnPNo7VX7IargJq/V/Kf6jqRPK36aPYhmmn3acph0SMNq8PndGlMtQ6Yl2iIieRu+2DYKVI/Q64LQwnOey8nIHXj+iMXjB879jytvRcfQHsQzWKksX20phD79T3EoFIMSxcjK0PatguDJXGihScP4755OO8+l123FJJpdtqtQpyX+6kQDUoidMCilCusxohdbofbMdq6xS48v0bavCJnZu0GkH+hNaXUOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 20 Jan
 2026 17:27:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 17:27:24 +0000
Date: Tue, 20 Jan 2026 09:27:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v4 5/8] drm/xe/vm: Prevent binding of purged buffer objects
Message-ID: <aW+6+dvH8trVV8eD@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-6-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120060900.3137984-6-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0076.namprd04.prod.outlook.com
 (2603:10b6:303:6b::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e87ac0e-89a4-41fd-d0f0-08de58492cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bG5VwjmQ6WOt+HrqRfDiATcKx3fgNjCHJnW/An0I5WJrK1XQReZkMMqwYJ?=
 =?iso-8859-1?Q?upKf1rhymB4RP/ElPZhf8Cvp4gT/ClYEHpfo4MfQ5wBU1GHy17QE9atePo?=
 =?iso-8859-1?Q?xk8CbbW/6Pd7EecsPYdFpix/HQS3jTCmNmV8N0ISqsRFMssxnAVpwloG8A?=
 =?iso-8859-1?Q?XPhFWSoiy6UAUP/j94GrfZGiXQYtZoaKYPppzcJo3sZHhCT9JlSZceFZfs?=
 =?iso-8859-1?Q?dZN71Z0ucAq+oFc6K4F4t5ptuSklln+IPJzbY85OrLBNW67ZSkdCndO/O+?=
 =?iso-8859-1?Q?H0WL6Z6VDXzAe5+9c0kaTRZrFKHPgzFWxOaCC6bhEZm1WlkOdKFEL++Xy9?=
 =?iso-8859-1?Q?34ddA4hEliXmWny1mhSlqVV2gcZCevxncyqrQiU0j27lH3zvRV18Ni0lj2?=
 =?iso-8859-1?Q?WZom+nzIauRSaGbiYpeWGtGXvxJBAG0Cy3f6TTjygkrUU0AWvMGInFl9rr?=
 =?iso-8859-1?Q?U/ENubsAABmgukx+dSe+rP2GUNTV8XbHqevmUztXwQcUk7HKGslG1RkIzr?=
 =?iso-8859-1?Q?eqRif0gEYXBs7lUYTQY+V3d4JYsk5FZsPUwQJcGzNk4kqSPM+jjI8AmGS6?=
 =?iso-8859-1?Q?DmSOcq0H9PCb9UNqcxgJHLRRMDUTt294bdiXk5Ufdf7JtKPiYm3z97Ayxx?=
 =?iso-8859-1?Q?8qOC4Wat5x6U173qXvjeeksctXw/rT0v6wiIeNWN2AvMbLlZ1Ny96Myc/P?=
 =?iso-8859-1?Q?gFJTFkQy+k9zqttAc49JcKbNek7hYQb67+uhMtzvpwgO2yP6shNuvVXIfc?=
 =?iso-8859-1?Q?jP7CbK8y9ckd2CG4S0tX7diy+sgH06I7gd1H/o7i6j4GlwjuOvGH1X2oPX?=
 =?iso-8859-1?Q?ezHOrPeEjzE4MNhIeApHeMl/D8eo9Y+JYjAuJcxtpSQ54aYv6po36sdd9l?=
 =?iso-8859-1?Q?eDvzH7gWV7y2E7jsQvJN95MW7u1Hg0IceAYQD6WmRIucpDl7hZf6jCMHMm?=
 =?iso-8859-1?Q?WvPuPIOBe7V2b7RMEg/ZKUavhA6TcNvs9gWN20rQ7LFeivS9VwLpZMzFc5?=
 =?iso-8859-1?Q?eUvG8YHqUM/rbvzY6dADgOi9RUFT6Bfb0AuGowxB5hhonyNfHCd9JbHLF5?=
 =?iso-8859-1?Q?sDISofpeh1/ZVRUlgPj4aVUZWkgbk6Cf6wB9K2gvWy5yZorSATNdgU+UcC?=
 =?iso-8859-1?Q?45nCCVYJkfw9pb4qqsNufjZ0icFot7MN91coMQ+JL22zAt/3z9RkVGeEJV?=
 =?iso-8859-1?Q?PyrKDFrXIkUzk6XetPz7xqYjl2afalSGkOeGxYhLUzEy0s/Qf2Ud2s/Mzs?=
 =?iso-8859-1?Q?kQz0U6ysd0tc8wXwAssHmTqYpcsnOmFUHbpW+rkANQM0k/P9jGXH5oQtqr?=
 =?iso-8859-1?Q?k68j6fSISfY4/yqQ6aIOjFJWWYvsmf633COElxlwtUGvY9GxU8nlJOHUlw?=
 =?iso-8859-1?Q?IW+6N5I6CCW1+KUKyU40ZtYpgDuUhuHHOVYZVd30d006pdB4/LH3k/OaJ8?=
 =?iso-8859-1?Q?xiS5qx6zkobRMYQv1nmmbFAAGXqnnh3eEcacAby6evs/LyGZTepm/pJHG3?=
 =?iso-8859-1?Q?0mj1gyYGq7t8HxSSd6YO51K6N51i6ApL1Zo4eC4tsqLjWvs6SNLIRRVVsM?=
 =?iso-8859-1?Q?VE8fKjzIgM6BFD+nIGUxD/1R70MpywsT87LC7M/TArWmnpsYZg17pFmw9Q?=
 =?iso-8859-1?Q?gwK6tVJ+cR8SE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pqRPnNhspb+3xL7mBuC691fqfXNK5P1XHj2WCcUmo8djXHyOo3ilqdjqqN?=
 =?iso-8859-1?Q?mFmlGjVUppnDFoV3IuW1gFd2JfgDGfTuQGXxzkh53GvCoyYzuQccsHMeJB?=
 =?iso-8859-1?Q?65Az3sYQzbpj+fIgvhxxdUob5V3O7harcoIK9NBVdkX2io/sWIqJsLNYW4?=
 =?iso-8859-1?Q?ryoDeA3SR0Z6lGiQbsC8NXsw40OHW58hui04xHtvkHcWJLBRRQqsc21zaZ?=
 =?iso-8859-1?Q?Obf1FZyN/1dKNb6/jc4oGE8K5kF/kdORySxQpnC3UeEWsi93AIM9VZKwvp?=
 =?iso-8859-1?Q?5tTDqc0cCGmuUoRwGPSAKx1gK5n9GswOFL6TgErcvgWND32+Gs5IAF7ncz?=
 =?iso-8859-1?Q?NuUHnAuCHQpA+ki+AUgI/guXo82voNpgl5PAtqY9gMYwCNsZF1n02trTds?=
 =?iso-8859-1?Q?iwIFJV2YgcaxNXp2gP7aDKy+b50zFM40XI02Tws36LdS4GrGkXk4gNTra5?=
 =?iso-8859-1?Q?FqTogNJVhyiUGr3pHCuVi61KQpxACPJrTM1UgkruIzfdIIaeYd8t9h+Qzq?=
 =?iso-8859-1?Q?BHDfQpRBRoTSTyiWu5Ra68G+LkYKz4ZjgRFq5hCRnL/n/f8pfGNNpBv+Fr?=
 =?iso-8859-1?Q?mHmvNJpicknbzLij2AhlsSyio7hZgFRz66+jbM6cVlKSzjEDiDwRUWMdbL?=
 =?iso-8859-1?Q?mPB+RAsAbBJeD0A68L6ssbCNexqsCYuiZ7/YhoX4EcnkYPtYDGdrI+e0Ud?=
 =?iso-8859-1?Q?jeg0UKBYXJbaglDfI7P5yA7w9Lws+Z/ReYyEsKCwXL4gM3L4K60mOKoprJ?=
 =?iso-8859-1?Q?icCrR1r7kIn8v6C204+DWLYTq3fZ+rQYZQWQWs9Fee9AMUlK1kNFPmmOkz?=
 =?iso-8859-1?Q?CbbBxboO1EEgHJPvvBdt8FwcYBoGpXtz7ATybmYbodmOuY60TBNWKjO4yu?=
 =?iso-8859-1?Q?06AWOgzOnvN6XTbiFzVN5aRiia7RSp3nccIkP+j9icHehju8VEtM0U3gJb?=
 =?iso-8859-1?Q?kyF0CgoC89XwFdCPo6oCy2l1YzC92iW5Ff2tdaDBTg8njkNcCmFSH2uctN?=
 =?iso-8859-1?Q?Fa+QS7MMqy7ss3iRUdUjac4D9f6vaPy1HUp3ZAi1+PZR61J58ddavONaTn?=
 =?iso-8859-1?Q?1EvMPSupyIW/81oco17tBipmDcf9IJS1DUFYY0Hx1zcvYgNA978bsL8nDJ?=
 =?iso-8859-1?Q?WFk3j+eZ7TXVtYMRloH10uPzISz9i3seRyjI0YEg49d5j7LFx4muITtE4u?=
 =?iso-8859-1?Q?v4HToR1l1fK1LbLGLVbmExRVuDWgHX7TVSKeoHV6HG4znXv5DvXvnzvjeQ?=
 =?iso-8859-1?Q?wfkFa8ZsOITsaolliAGxNr7q8avsu5QCs5y/LOmb85CaNypFavc4CQbCZp?=
 =?iso-8859-1?Q?IOv1tsum9du4jSusIeQ/clF0IRLpSB//w0uihXGDey4ZQ43O2et18Xy3ut?=
 =?iso-8859-1?Q?jwlr1fmRv5EUmcqb8Q4hqw7Dr5MA7XTiNtgLwBluTlQjU1gjiqKjfJnqN0?=
 =?iso-8859-1?Q?eAta4V4BQmRjU0oE72eRP3fiSa4/gLKWU+G7HMkh7v8K810buQE7CJ3QMl?=
 =?iso-8859-1?Q?dH+16tZYJb07DDTfGmEiFz6ZVBe8fhPjrqmRvuf/ZkD3CX4lyyz0BnEQHY?=
 =?iso-8859-1?Q?P6dycbulRZLyx3pmj67+RGIG6zSg7F9VNoywOL94+bduLr0n912TreJ8Mk?=
 =?iso-8859-1?Q?9ZX9CoqvXgsyKwHnsQDwYnaALrciI9EZbpLk4t4UbZFKr6CtjwyHzn6KPN?=
 =?iso-8859-1?Q?fK0/4KDs/Uz2Uyl6OuXp2KDhANaEn8VXHoP7S4nstTJEZKlfVT7WznFqeA?=
 =?iso-8859-1?Q?KcqiDHLJk0jol+SqkntGLQ90W4QYLNod5P2zbdGoB7+J/FbJJdA0EYXsUD?=
 =?iso-8859-1?Q?qjbva6YOzZQt5AqqrdUXWTxHe3BvjE0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e87ac0e-89a4-41fd-d0f0-08de58492cc8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:27:24.7790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRWgf10H1YrnblDVKcyNHatUNHSZkej8UqR0FqXz/Pt99BcmhRJyGNGD5pW6g04HgRavmQ7NMH3/cWGbaOTtsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
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

On Tue, Jan 20, 2026 at 11:38:51AM +0530, Arvind Yadav wrote:
> Add check_purged parameter to vma_lock_and_validate() to block
> new mapping operations on purged BOs while allowing cleanup
> operations to proceed.
> 
> Purged BOs have their backing pages freed by the kernel. New
> mapping operations (MAP, PREFETCH, REMAP) must be rejected with
> -EINVAL to prevent GPU access to invalid memory. Cleanup
> operations (UNMAP) must be allowed so applications can release
> resources after detecting purge via the retained field.
> 
> REMAP operations require mixed handling - reject new prev/next
> VMAs if the BO is purged, but allow the unmap portion to proceed
> for cleanup.
> 
> The check_purged parameter distinguishes between these cases:
> true for new mappings (must reject), false for cleanup (allow).
> 
> v2:
>   - Clarify that purged BOs are permanently invalid (i915 semantics)
>   - Remove incorrect claim about madvise(WILLNEED) restoring purged BOs
> 
> v3:
>   - Move xe_bo_is_purged check under vma_lock_and_validate (Matthew Brost)
>   - Add check_purged parameter to distinguish new mappings from cleanup
>   - Allow UNMAP operations to prevent resource leaks
>   - Handle REMAP operation's dual nature (cleanup + new mappings)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c3a5fe76ff96..f250daae3012 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2883,7 +2883,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  }
> 
>  static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> -				 bool res_evict, bool validate)
> +				 bool res_evict, bool validate, bool check_purged)

It probably time to add something like this to avoid transposing arguments.

struct lock_and_validate_flags {
	bool res_evict;
	bool validate;
	bool check_purged;
};

Logic in the patch looks correct though.

Matt

>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> @@ -2892,6 +2892,11 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>  	if (bo) {
>  		if (!bo->vm)
>  			err = drm_exec_lock_obj(exec, &bo->ttm.base);
> +
> +		/* Reject new mappings to purged BOs; allow cleanup operations */
> +		if (!err && check_purged && xe_bo_is_purged(bo))
> +			err = -EINVAL;
> +
>  		if (!err && validate)
>  			err = xe_bo_validate(bo, vm,
>  					     !xe_vm_in_preempt_fence_mode(vm) &&
> @@ -2990,7 +2995,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			err = vma_lock_and_validate(exec, op->map.vma,
>  						    res_evict,
>  						    !xe_vm_in_fault_mode(vm) ||
> -						    op->map.immediate);
> +						    op->map.immediate,
> +						    true);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> @@ -2999,13 +3005,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.remap.unmap->va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		if (!err && op->remap.prev)
>  			err = vma_lock_and_validate(exec, op->remap.prev,
> -						    res_evict, true);
> +						    res_evict, true, true);
>  		if (!err && op->remap.next)
>  			err = vma_lock_and_validate(exec, op->remap.next,
> -						    res_evict, true);
> +						    res_evict, true, true);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
> @@ -3014,7 +3020,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.unmap.va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
> @@ -3029,7 +3035,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> -					    res_evict, false);
> +					    res_evict, false, true);
>  		if (!err && !xe_vma_has_no_bo(vma))
>  			err = xe_bo_migrate(xe_vma_bo(vma),
>  					    region_to_mem_type[region],
> -- 
> 2.43.0
> 
