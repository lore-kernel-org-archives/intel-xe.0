Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B7CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F3B10E2E1;
	Tue, 30 Sep 2025 22:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIyw4qQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4E810E2E1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759273117; x=1790809117;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=banSQnPopQBUFQBtvhCBXSkhalMKt4MPotmz6UXWAI8=;
 b=aIyw4qQ8czha5xetVDGzHGtxvTnBfoMijujI0WSU6AV9UzZ7JoNLOnqu
 Ihj4ZHBQYP+EEEITzEYQUuDNt9f9+3G6kscVc6la8Mo3omxtjXH8HGT6d
 TwmzJnXoGedLGWo/EkrJZ0Zg7zIKBz1SZrJuDaCytxajtkzL8xzM5GXDu
 D8yzY003IGRBWsyN/D326PdbefkNlPRQNs2b2aZU5iobwYFfnBfpgVjwP
 nBlZSTpK3r6N2epSKmC51dV8NLw9v5ewYnGAHjwK5rdDyYCZtS9htoGu+
 M0VNMolEDqFQe15jwxaoAkdF7qKJmM3xVdjbhKUXHtorSmkzI6Gv5O0Fl Q==;
X-CSE-ConnectionGUID: mVnzwJkITSKZNpErCCsk4g==
X-CSE-MsgGUID: 5dNov1fXQX6AnxNfmmtTIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72901424"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72901424"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:58:36 -0700
X-CSE-ConnectionGUID: 48etwujAQUK2oNhiY1r95A==
X-CSE-MsgGUID: 9/+J4WmaSVGY9dnsQuvlJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178236283"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:58:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 15:58:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 15:58:34 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 15:58:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi0nT9clxqbXC2iF9+tRNicNryX7ZlB/sQV4tZJTbTmduvK4rGv1turxfpZIp5aeyziHN/LInEN9x4Hp9Y169zTKxPnsH32serGlgFEGkHOVqVCBp1+uhevWKk9iIhWChheGnQOqjF0Da1CUxC9MVRsPB8LaoCbdz77w4dKZ5ADkqohdUVJnP7QVJXfRT9Oco8VC2GpIVJEeB9EMWMXsllmTJwWBtSU+D9XsJ+ZxQV6jjB++K3L+F2bRgl6ExSIiDxyZ8BZ1yHNRAbNU41QZxC16LQi9ql+7vromSeuLN8F25Us/Cpcu5bbJwmGqx0xTwUqRFPfQBXE2EGJFR8D/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65TMetzO/SrzorNhfoKRPFiZpdGeipFZ0HOzT53k9I8=;
 b=lyplgi8jmSxdz7vKmXGzMQAqo6aSVvRmU30RmknT6o/MBdz/IQM7Kv2ZqlGJrDLpi6KIL0crcz4iDri6lPzZvZU807Om5rBpAJ7A8RXItL/XG/3DI7d8OKIDwbpQ+fpc9pfYI1e758nAsnQMk8wCpVe+E6jvL8Dw9H073fNHqXP1jBdPMxBmQG9LUOrE4NYIJb7FI+t/whf2XP+BStGYOiWckKigjWd07zJ+5KIDPxT7xCRwRjbeu7Z75FJy65dorNzmmnfu1h/IkRFT7csEsEyWq217Dgry2e6K2lpFBHqXg+kEsmgx5LwnI4zC2AGFI/GDoeEgiv6k6crFgFizVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 22:58:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 22:58:26 +0000
Date: Tue, 30 Sep 2025 15:58:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2] drm/gpusvm, drm/xe: Fix userptr to not allow device
 private pages
Message-ID: <aNxgj+aJEkXBF6Je@lstrano-desk.jf.intel.com>
References: <20250930072144.12170-1-thomas.hellstrom@linux.intel.com>
 <801fda09-2865-44fe-9a11-bb53b145f649@intel.com>
 <840c1e3a-bac4-4827-bcc9-c5096d07b6af@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <840c1e3a-bac4-4827-bcc9-c5096d07b6af@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4835:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb7e6a5-cdcb-4f9a-fef5-08de0074dd94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZKOYEWin9Ype9QqHQcPx9cSEYl/1qsTBdVurvu2dgQMeqXxKdV6HjHxGg0?=
 =?iso-8859-1?Q?sBl9feg+/0/7tMBEs1Waev6FsuDtmtrc62qCmBpZFn5go2kDt2Pb75Mkml?=
 =?iso-8859-1?Q?4txyCqwrr+P/6+/ZcWohK4YvuDvaCFinW+czC1/JRVrP+rrZqJnlRu02Z9?=
 =?iso-8859-1?Q?rtcep6xqbkt7pQlrSE0B0vwoz3GN3LmfkeogJNPQ3EylclBeCOyk8Scowh?=
 =?iso-8859-1?Q?veQ3U5ztZefPxk9xmeV1fXvwG9tGObrY8Mz3jDE78Q1mLP3febrji220GN?=
 =?iso-8859-1?Q?VJxT0vk4LDTfL+2k3Qr/dKBaTZZ3pBACKwkcMVkQzr7CwyDO/j4557/BNM?=
 =?iso-8859-1?Q?KVKH//FltRfTLDXTBsrXQh8KfV89umquzSsJFDi7SyB9luL2LDg6UpbqY6?=
 =?iso-8859-1?Q?9fSDdPAz8+JlTNntb6Pqe57XbPj76Z144kRQlSpyiKX3j8k4uf+GdFffLQ?=
 =?iso-8859-1?Q?USD4lsDlM8ojqTtT+YmyHxMHaolQviLzh7Fall0YXiHuTSEqtONL31LRg5?=
 =?iso-8859-1?Q?nzI5Ac06/6KoHYpMZlwYvjcpkp2H4wTEvQdimJsO0QDmf/Nd0XERLzb03I?=
 =?iso-8859-1?Q?NxuQBsu2sMn+rHgl8DXqZYCo4J4MmqWqppbrQFG3lmoxNuJ0YGHm342mxQ?=
 =?iso-8859-1?Q?8+9/ApfYSF6xdhdGS/nOYgVHdQTKeeFgxWOUF9tVmmLhxsNoB8o5JcagY6?=
 =?iso-8859-1?Q?JG9B/z5cMTC/qtjdIuzOFBmSjQP5dJp3g9Hna28ieaesW8JIN/NOGzq1Jp?=
 =?iso-8859-1?Q?58n6H1v4O+a7e0JzotZtKzodt4HSpjx7gMF+wJudWfX8Q0V8Tp9uhSTT59?=
 =?iso-8859-1?Q?+dhE04P2JoGSqA+alu3PsZxmv9voFuC/df9pJtNhTbTCOL+4F+9kRPNWr4?=
 =?iso-8859-1?Q?6PYztZvv3Heo6rmrL196GbfblLiz0878vUdK2z0MxgjomM7a5KT0zlgFSd?=
 =?iso-8859-1?Q?1oPdLj9aoaHWZFUjxUNKY+4AWOK1zAsYXQii61hTUBUjotyqX9lN7MjXCb?=
 =?iso-8859-1?Q?mIg9tPQSbBVYj9K+Sqi+fANjDS5OHwpmQi4x0SjEPDsn0/ctV2Chxbf7ic?=
 =?iso-8859-1?Q?PE9fnmXSHlZZRADBfHTnDYJLg53UDCjSmCSrh8juVrn500WwQqm6iCzykf?=
 =?iso-8859-1?Q?IppQVcEa6paWxr/x0UrEgpIdUj/q1ImyXTxeI+WJeMfrg4Bt3aXuw4EqDe?=
 =?iso-8859-1?Q?FZXEVxlAMsffUVaEhIflvYJa4YMIkhffogYbaD6DJEMLPpuSbvB46qDL2G?=
 =?iso-8859-1?Q?nAgFbHhIkE3byd1pvqlRLUMGcDfOLl8PgdfuBwUHxdGoJC4BgfrVpL2Ktx?=
 =?iso-8859-1?Q?v5+njnYT5AyzVBNzP/duIfEJivgl9TpvZjEmHxbrDeWff38am4I4neXFyN?=
 =?iso-8859-1?Q?awQ+m52Os7PbxwXkzAGjxKuiXEYq7vyX+OT9ks4AM+Xbz/0UXGPevbRMmt?=
 =?iso-8859-1?Q?KRs+fWjjM9UosrjYr/8TsK1OOYMGzx7BOYDKOyAVwSNAh+rDRrKIRKVVnk?=
 =?iso-8859-1?Q?Nwy3vnYWf6BK+OQDhkSJzI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bSLB2UbBCecK6hGQAYQe+QtwyxHjvNUVDOl56ImOj0QS0/Fosw1K67ffJq?=
 =?iso-8859-1?Q?lmu4LL2OgPSQJvybE0KqeQE9z9mBV2QkExOkl00qG5n8tWygColvtAIkJg?=
 =?iso-8859-1?Q?xgBnOEV8Wy4PQN7KigmvIwodqQd+MDx6nQvcNMFVV1OfsAWtI7BzTDnKrR?=
 =?iso-8859-1?Q?il1laO+0JQdf5OJrTFIOx21a/O1gBRenq/e7mbvOHsIYe0aZszpQfDo4fS?=
 =?iso-8859-1?Q?6TetWrdb8j6KsHjKZRG3TTjMxuR/e2bxhBATMU2aArDe7xZrkUgAuCY9Zo?=
 =?iso-8859-1?Q?wsaNceMljmVBwpsunT+kxdiQma3qp1Kef4ItWVgwZ/WYYU4wYL5EwM4TSP?=
 =?iso-8859-1?Q?/kh6zF2Oy2tveLOunnuVgjTHhuK9TAoRVV/cQgWY1G6tJyrSg2y1KvpE1N?=
 =?iso-8859-1?Q?yg7lGLKbVhUQbYa3faKXsIDpsn+3RDfQ4yrA8gHic5ndN+xcOw8qwqBLve?=
 =?iso-8859-1?Q?bv8vgQwCXN1UTt1BETO4ENTK9z6XgQTWAvA3q6r7GlYjtK9hGfO/shzrPg?=
 =?iso-8859-1?Q?PMA3IJ0/rTjzTdWiot/w4wVFKqH+YsEm3kOV/Hc+L/jXlB76w84bsxzbHQ?=
 =?iso-8859-1?Q?qOIxF9GtXWPhvpa2RnX9WsKDixtDlpFFOD4/dc5BcOwm5/sxLjfaQApXxz?=
 =?iso-8859-1?Q?EVW2trQ+YpcbfYrltj14YYZL/V3/dfY5Mg0nfUtl7UvlGKdJ7LYv3hegXc?=
 =?iso-8859-1?Q?yqR7+shNQPBtVuJpU5ETPsCzjbSj21QSTk0+Fo2tyqhDba9bZUe4gBOMRW?=
 =?iso-8859-1?Q?0HD47Y2ZH90PhJ3WqM+vdYhhcQf5ifO/JptV/kRkSCooKpMvGmpVprQQTC?=
 =?iso-8859-1?Q?OrlR0tr12ALDhFh5gbMKYAcAbJQMnoyU+YC8hQYLJU18g4uUvS5QeJgm9Y?=
 =?iso-8859-1?Q?teutX3r+5Xu0Aqj2zzXnH3vy7cQ9/yyYFnVx5n7jbBgdm4ncNfZR8IjjOt?=
 =?iso-8859-1?Q?QEwp+n/6AD34necRdK+D1qJznYBCmuthAQngLRx12J1cDwL9zGCHb6WBEv?=
 =?iso-8859-1?Q?ydIIq36UNQZNw+BEWNlhTeIWQi/+fgUY+h20k91x8zgzM5HcT3n70xYqu4?=
 =?iso-8859-1?Q?Yaj7SUgn3dJ+J+ZcbNA5cdVBnxUZJRUq1651yv/e60qYMJ9NmA48xQxgST?=
 =?iso-8859-1?Q?W3lEgknz6X9G+36yXsWsBm6lftYLRY4pPDxyJdUGZlkoVJl0My5YoqzlCZ?=
 =?iso-8859-1?Q?37ervOBIxt0a10rnwhXKwMEiYaHH/AtzbJjRKwq5sV+H8RXKBsUqXtkjik?=
 =?iso-8859-1?Q?TZkyVDuyKxfnrlu3Qe2H0cTjYYsAsR1hN0kcbxWVJ3AoJ/hXrUuLddwoUr?=
 =?iso-8859-1?Q?F51C9vZZuxy+jR+ZYoTe+Am3kzM3QHXLglI315L1iorgwC27z17UVQrvgf?=
 =?iso-8859-1?Q?oK552/YojDK15xWl/CnX1U8FxmLHKwpEvwvnLacOZHJ4t+PwnPyB2MijDg?=
 =?iso-8859-1?Q?HBdIE0Pykdv+ikBRNFCD1tel8d6DUFDPUKA9GIHxZUbFSOicWtPrxb46lJ?=
 =?iso-8859-1?Q?s+4GVOzD1ydFBU6opBizAVJbMCZWwgehNrNiS+MWfHBGVZpggntOv3r6Ug?=
 =?iso-8859-1?Q?ZXs7baVsLloWOuxkzhSVhkKmcDbVxRnou+8HorI0+E0e+krPqC4jBl9bze?=
 =?iso-8859-1?Q?UgOtu2W/nZMHY5lMlxmetn06yEorDXTho0aMigNrvCb8FrjlzMZLwRGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb7e6a5-cdcb-4f9a-fef5-08de0074dd94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 22:58:26.8420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEoAQtn4HxbPGvyFF9ZV0WjSN5NmZg6/Y8a5YDIhzdGeaRBvWbGPCssScQULyzisV8nV+B4+oNxBZSyY9JAU3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4835
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

On Tue, Sep 30, 2025 at 02:26:00PM +0200, Thomas Hellström wrote:
> 
> On 9/30/25 13:16, Matthew Auld wrote:
> > On 30/09/2025 08:21, Thomas Hellström wrote:
> > > When userptr is used on SVM-enabled VMs, a non-NULL
> > > hmm_range::dev_private_owner value might mean that
> > > hmm_range_fault() attempts to return device private pages.
> > > Either that will fail, or the userptr code will not know
> > > how to handle those.
> > > 
> > > Use NULL for hmm_range::dev_private_owner to migrate
> > > such pages to system. In order to do that, move the
> > > struct drm_gpusvm::device_private_page_owner field to
> > > struct drm_gpusvm_ctx::device_private_page_owner so that
> > > it doesn't remain immutable over the drm_gpusvm lifetime.
> > > 
> > > v2:
> > > - Don't conditionally compile xe_svm_devm_owner().
> > > - Kerneldoc xe_svm_devm_owner().
> > > 
> > > Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > So in theory this should give the same behavior pre gpusvm conversion
> > for userptr?
> 
> Actually not, the same problem is there, but we need to have a patch that
> fixes this in Linus' tree before sending a backported patch that fixes the
> behaviour before the conversion.
> 
> On top of this, we will then as a follow-up actually allow VRAM pages in
> userptr with the SVM code modified to handle this, since l0 has a some
> use-cases that are not fully ported to SVM yet that would otherwise see
> multiple migration blits for the same memory.
> 
> > 
> > I guess missing Cc: dri-devel ?
> 
> Right. I'll resend with that CC.
> 
> > 
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Thanks,
> 
> Thomas
> 
> > 
> > > ---
> > >   drivers/gpu/drm/drm_gpusvm.c    | 24 +++++++++++++-----------
> > >   drivers/gpu/drm/xe/xe_svm.c     | 11 +++--------
> > >   drivers/gpu/drm/xe/xe_svm.h     | 14 ++++++++++++++
> > >   drivers/gpu/drm/xe/xe_userptr.c |  1 +
> > >   drivers/gpu/drm/xe/xe_vm.c      |  1 +
> > >   include/drm/drm_gpusvm.h        |  7 ++++---
> > >   6 files changed, 36 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > > index eeeeb99cfdf6..cb906765897e 100644
> > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > @@ -361,7 +361,6 @@ static const struct mmu_interval_notifier_ops
> > > drm_gpusvm_notifier_ops = {
> > >    * @name: Name of the GPU SVM.
> > >    * @drm: Pointer to the DRM device structure.
> > >    * @mm: Pointer to the mm_struct for the address space.
> > > - * @device_private_page_owner: Device private pages owner.
> > >    * @mm_start: Start address of GPU SVM.
> > >    * @mm_range: Range of the GPU SVM.
> > >    * @notifier_size: Size of individual notifiers.
> > > @@ -383,7 +382,7 @@ static const struct mmu_interval_notifier_ops
> > > drm_gpusvm_notifier_ops = {
> > >    */
> > >   int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > >               const char *name, struct drm_device *drm,
> > > -            struct mm_struct *mm, void *device_private_page_owner,
> > > +            struct mm_struct *mm,
> > >               unsigned long mm_start, unsigned long mm_range,
> > >               unsigned long notifier_size,
> > >               const struct drm_gpusvm_ops *ops,
> > > @@ -395,15 +394,13 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > >           mmgrab(mm);
> > >       } else {
> > >           /* No full SVM mode, only core drm_gpusvm_pages API. */
> > > -        if (ops || num_chunks || mm_range || notifier_size ||
> > > -            device_private_page_owner)
> > > +        if (ops || num_chunks || mm_range || notifier_size)
> > >               return -EINVAL;
> > >       }
> > >         gpusvm->name = name;
> > >       gpusvm->drm = drm;
> > >       gpusvm->mm = mm;
> > > -    gpusvm->device_private_page_owner = device_private_page_owner;
> > >       gpusvm->mm_start = mm_start;
> > >       gpusvm->mm_range = mm_range;
> > >       gpusvm->notifier_size = notifier_size;
> > > @@ -684,6 +681,7 @@ static unsigned int
> > > drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
> > >    * @notifier: Pointer to the GPU SVM notifier structure
> > >    * @start: Start address
> > >    * @end: End address
> > > + * @dev_private_owner: The device private page owner
> > >    *
> > >    * Check if pages between start and end have been faulted in on
> > > the CPU. Use to
> > >    * prevent migration of pages without CPU backing store.
> > > @@ -692,14 +690,15 @@ static unsigned int
> > > drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
> > >    */
> > >   static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
> > >                      struct drm_gpusvm_notifier *notifier,
> > > -                   unsigned long start, unsigned long end)
> > > +                   unsigned long start, unsigned long end,
> > > +                   void *dev_private_owner)
> > >   {
> > >       struct hmm_range hmm_range = {
> > >           .default_flags = 0,
> > >           .notifier = &notifier->notifier,
> > >           .start = start,
> > >           .end = end,
> > > -        .dev_private_owner = gpusvm->device_private_page_owner,
> > > +        .dev_private_owner = dev_private_owner,
> > >       };
> > >       unsigned long timeout =
> > >           jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > @@ -753,6 +752,7 @@ static bool drm_gpusvm_check_pages(struct
> > > drm_gpusvm *gpusvm,
> > >    * @gpuva_start: Start address of GPUVA which mirrors CPU
> > >    * @gpuva_end: End address of GPUVA which mirrors CPU
> > >    * @check_pages_threshold: Check CPU pages for present threshold
> > > + * @dev_private_owner: The device private page owner
> > >    *
> > >    * This function determines the chunk size for the GPU SVM range
> > > based on the
> > >    * fault address, GPU SVM chunk sizes, existing GPU SVM ranges,
> > > and the virtual
> > > @@ -767,7 +767,8 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm
> > > *gpusvm,
> > >                   unsigned long fault_addr,
> > >                   unsigned long gpuva_start,
> > >                   unsigned long gpuva_end,
> > > -                unsigned long check_pages_threshold)
> > > +                unsigned long check_pages_threshold,
> > > +                void *dev_private_owner)
> > >   {
> > >       unsigned long start, end;
> > >       int i = 0;
> > > @@ -814,7 +815,7 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm
> > > *gpusvm,
> > >            * process-many-malloc' mallocs at least 64k at a time.
> > >            */
> > >           if (end - start <= check_pages_threshold &&
> > > -            !drm_gpusvm_check_pages(gpusvm, notifier, start, end)) {
> > > +            !drm_gpusvm_check_pages(gpusvm, notifier, start, end,
> > > dev_private_owner)) {
> > >               ++i;
> > >               goto retry;
> > >           }
> > > @@ -957,7 +958,8 @@ drm_gpusvm_range_find_or_insert(struct
> > > drm_gpusvm *gpusvm,
> > >       chunk_size = drm_gpusvm_range_chunk_size(gpusvm, notifier, vas,
> > >                            fault_addr, gpuva_start,
> > >                            gpuva_end,
> > > -                         ctx->check_pages_threshold);
> > > +                         ctx->check_pages_threshold,
> > > +                         ctx->device_private_page_owner);
> > >       if (chunk_size == LONG_MAX) {
> > >           err = -EINVAL;
> > >           goto err_notifier_remove;
> > > @@ -1268,7 +1270,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > > *gpusvm,
> > >           .notifier = notifier,
> > >           .start = pages_start,
> > >           .end = pages_end,
> > > -        .dev_private_owner = gpusvm->device_private_page_owner,
> > > +        .dev_private_owner = ctx->device_private_page_owner,
> > >       };
> > >       void *zdd;
> > >       unsigned long timeout =
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index 7f2f1f041f1d..7e2db71ff34e 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -67,11 +67,6 @@ void xe_svm_range_debug(struct xe_svm_range
> > > *range, const char *operation)
> > >       range_debug(range, operation);
> > >   }
> > >   -static void *xe_svm_devm_owner(struct xe_device *xe)
> > > -{
> > > -    return xe;
> > > -}
> > > -
> > >   static struct drm_gpusvm_range *
> > >   xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> > >   {
> > > @@ -744,15 +739,14 @@ int xe_svm_init(struct xe_vm *vm)
> > >                 xe_svm_garbage_collector_work_func);
> > >             err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM",
> > > &vm->xe->drm,
> > > -                      current->mm, xe_svm_devm_owner(vm->xe), 0,
> > > -                      vm->size,
> > > +                      current->mm, 0, vm->size,
> > >                         xe_modparam.svm_notifier_size * SZ_1M,
> > >                         &gpusvm_ops, fault_chunk_sizes,
> > >                         ARRAY_SIZE(fault_chunk_sizes));
> > >           drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> > >       } else {
> > >           err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
> > > -                      &vm->xe->drm, NULL, NULL, 0, 0, 0, NULL,
> > > +                      &vm->xe->drm, NULL, 0, 0, 0, NULL,
> > >                         NULL, 0);
> > >       }
> > >   @@ -1017,6 +1011,7 @@ static int __xe_svm_handle_pagefault(struct
> > > xe_vm *vm, struct xe_vma *vma,
> > >           .devmem_only = need_vram && devmem_possible,
> > >           .timeslice_ms = need_vram && devmem_possible ?
> > >               vm->xe->atomic_svm_timeslice_ms : 0,
> > > +        .device_private_page_owner = xe_svm_devm_owner(vm->xe),
> > >       };
> > >       struct xe_validation_ctx vctx;
> > >       struct drm_exec exec;
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index cef6ee7d6fe3..0955d2ac8d74 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -6,6 +6,20 @@
> > >   #ifndef _XE_SVM_H_
> > >   #define _XE_SVM_H_
> > >   +struct xe_device;
> > > +
> > > +/**
> > > + * xe_svm_devm_owner() - Return the owner of device private memory
> > > + * @xe: The xe device.
> > > + *
> > > + * Return: The owner of this device's device private memory to use in
> > > + * hmm_range_fault()-
> > > + */
> > > +static inline void *xe_svm_devm_owner(struct xe_device *xe)
> > > +{
> > > +    return xe;
> > > +}
> > > +
> > >   #if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> > >     #include <drm/drm_pagemap.h>
> > > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > > b/drivers/gpu/drm/xe/xe_userptr.c
> > > index 91d09af71ced..f16e92cd8090 100644
> > > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > > @@ -54,6 +54,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma
> > > *uvma)
> > >       struct xe_device *xe = vm->xe;
> > >       struct drm_gpusvm_ctx ctx = {
> > >           .read_only = xe_vma_read_only(vma),
> > > +        .device_private_page_owner = NULL,
> > >       };
> > >         lockdep_assert_held(&vm->lock);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 80b7f13ecd80..4e914928e0a9 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2883,6 +2883,7 @@ static int prefetch_ranges(struct xe_vm *vm,
> > > struct xe_vma_op *op)
> > >       ctx.read_only = xe_vma_read_only(vma);
> > >       ctx.devmem_possible = devmem_possible;
> > >       ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> > > +    ctx.device_private_page_owner = xe_svm_devm_owner(vm->xe);
> > >         /* TODO: Threading the migration */
> > >       xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > index 5434048a2ca4..b92faa9a26b2 100644
> > > --- a/include/drm/drm_gpusvm.h
> > > +++ b/include/drm/drm_gpusvm.h
> > > @@ -179,7 +179,6 @@ struct drm_gpusvm_range {
> > >    * @name: Name of the GPU SVM
> > >    * @drm: Pointer to the DRM device structure
> > >    * @mm: Pointer to the mm_struct for the address space
> > > - * @device_private_page_owner: Device private pages owner
> > >    * @mm_start: Start address of GPU SVM
> > >    * @mm_range: Range of the GPU SVM
> > >    * @notifier_size: Size of individual notifiers
> > > @@ -204,7 +203,6 @@ struct drm_gpusvm {
> > >       const char *name;
> > >       struct drm_device *drm;
> > >       struct mm_struct *mm;
> > > -    void *device_private_page_owner;
> > >       unsigned long mm_start;
> > >       unsigned long mm_range;
> > >       unsigned long notifier_size;
> > > @@ -226,6 +224,8 @@ struct drm_gpusvm {
> > >   /**
> > >    * struct drm_gpusvm_ctx - DRM GPU SVM context
> > >    *
> > > + * @device_private_page_owner: The device-private page owner to use for
> > > + * this operation
> > >    * @check_pages_threshold: Check CPU pages for present if chunk is
> > > less than or
> > >    *                         equal to threshold. If not present,
> > > reduce chunk
> > >    *                         size.
> > > @@ -239,6 +239,7 @@ struct drm_gpusvm {
> > >    * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> > >    */
> > >   struct drm_gpusvm_ctx {
> > > +    void *device_private_page_owner;
> > >       unsigned long check_pages_threshold;
> > >       unsigned long timeslice_ms;
> > >       unsigned int in_notifier :1;
> > > @@ -249,7 +250,7 @@ struct drm_gpusvm_ctx {
> > >     int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > >               const char *name, struct drm_device *drm,
> > > -            struct mm_struct *mm, void *device_private_page_owner,
> > > +            struct mm_struct *mm,
> > >               unsigned long mm_start, unsigned long mm_range,
> > >               unsigned long notifier_size,
> > >               const struct drm_gpusvm_ops *ops,
> > 
