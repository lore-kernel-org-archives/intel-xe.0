Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B06EC110C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 17:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23E110E2D8;
	Mon, 23 Feb 2026 17:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQoUnzV8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC6D10E2D8
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771867812; x=1803403812;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6GTLBUr7ozkoWlcXV3RcovdV+UU5eP1sEM7IopDcmIE=;
 b=HQoUnzV8cIaFZw8RRu2hKdQnzTkOqXTqikdwAsEsaTtAxjLBqIVHhmXX
 p7jMYZJcYs537eiNDJupbAjYBf7KYn+gNbRq1XMZIYYvhPgrfviGLoB/3
 EChPBWQTrhS6jeIuJvz/PxmcsXpLO0q1lPqOPpLTuI6DUYfmLoZ/lvjI4
 KhHsRdYsd/5rgjql1GIzheel3PuIv00YP+HWbZovWLLB1gGLFk9hREt6w
 Hv24l+vWnEfVyyMp8IMc6sV2AlExtlIIPllhWdTSieg72h9fTmqh0oDf2
 DHLdEsD7whb651powQ7FsNqnqz2GvV4uQdOYMjpij8IKy5zbQthhh/ere g==;
X-CSE-ConnectionGUID: 9IhIJz/NQpq5GpkvVRlt5g==
X-CSE-MsgGUID: /zACq5XNQheUw+6sWt41eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72970404"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72970404"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:30:11 -0800
X-CSE-ConnectionGUID: kLdn+guRQaiFhsF8KC7sVQ==
X-CSE-MsgGUID: N9uiEw6wQomncbTqRnV+Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214014837"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:29:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:29:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 09:29:35 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:29:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnBzgq2DWDLMsBbHWWdUf1lakFEy7XwWpK/CE8AKPjHcaCZ05xU1ilITfKeb3HOUZLlQTxyvhl3kq4DG6k2z8lsYYHMqDOff0c7XMajQmxY+iP9Cxfy7/wHDqP4LxdGo8ppRC4SR2oUEntyNj0jwaZylBh89i0pej7FsNOXbrik6hyynUXWcL/Cr1CcaBuUQ5LBC9QmpJqYyc9c/qWdUt6LUmvkz7Dam8ziDrutqUDasZeBkvwwWSDCXWUhkWsm00N7vXW5DzZBul++ajKH/tqHGMghR5Y+gdpRR1xzu8a+MXbltS8DE8pVCeNueRQ9sahekSi2AoqI5rWN6maxlfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT3lKweV7pNzP4DSgmDkS0eICWatRJMqHGhAwu4jCJ0=;
 b=mQz1g5QHHybhHg+83cwC1ve08iQCCbBAeGDT43fD23o9QYiOUv0lvrRm9AcnPvllsX3wBEML8ojcWBkHTzrsCVJFAXqVJ+/qkpoxlsWwE5z1IEgtsUuhkEblH4+3MYDqvZPDDhEo/BGkoXJ67uz9qCHzDyzeTha0NjgAWNLmUR8Gvsi7LLOgyWDhBkVg2IH12wP2+a7U3KFju384Z3xW/gmRlFVdWeBTgEpc5bmBFXxHtWAJ4svhNldqFvgxkxJUMiE5eZsKGgU94N6U0CBNX/O6ANhaMYdtfINSg2aILd+gUjdiU2Zgl1EMuql2RQVwIRtHL0fohVwoaRnxZcw6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 17:29:31 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:29:30 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH v2] drm/xe: Fix memory leak in xe_vm_madvise_ioctl
Thread-Topic: [PATCH v2] drm/xe: Fix memory leak in xe_vm_madvise_ioctl
Thread-Index: AQHcpKbQRm4SuBvwo0SoL24EznirOrWQh1lg
Date: Mon, 23 Feb 2026 17:29:29 +0000
Message-ID: <DM4PR11MB5456838AF22779035DB779ECEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260223092815.1500739-1-varun.gupta@intel.com>
In-Reply-To: <20260223092815.1500739-1-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MN0PR11MB6109:EE_
x-ms-office365-filtering-correlation-id: 3c54e2eb-d387-4e29-41bf-08de730119e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?C19GnJA745wB/7kLwHYELAB7PK0aBm36exfvsauyzSxH0fhJgBAqs+Ar7Gpp?=
 =?us-ascii?Q?LpsQvv89HDiI5obxEbqnGmSBx6AhUNCxNvwa9Nu5CwN4sm9p/4v0CdwV7t1E?=
 =?us-ascii?Q?T5SCnHIuyf8TWFmsdYLDkY9nVBHUQDzIR7C7HEPw1DpTCVexft2mGWN9GYa7?=
 =?us-ascii?Q?6FW4oSO5rwAAwxg9qlhtTadG0TB7PreFmf8RI0r9nuDedmJ7Jh7h8UPAhvkP?=
 =?us-ascii?Q?1hCKmCYeN04ZCA4KP6+O5Y9QoYgVNV+iPGfBK/zWRgsFZjSW3JMGAP9bezYt?=
 =?us-ascii?Q?LFU4HNjpPlF8ledHR3RWLDb9tDljVd7Ocey+vTRmb4ir5z7gpzZTqTSuz1hf?=
 =?us-ascii?Q?10XiUmD4A/eCCaONF5FoCMW/6/qYtEc8j3e36UDxC0HxD1YsP/Gk1AFb+ff8?=
 =?us-ascii?Q?8GjKP72SNQJMac/FkqY7eeXp2IBi0+ZhlXrcB0Xk91xkpR1/f8Qu7qWjZ/8w?=
 =?us-ascii?Q?enrIz4QxdDgfq0Lbo40bmGBnUIVzMSN8Oc3BZH8crjGT2lOUKiOfZjgS1TE4?=
 =?us-ascii?Q?+mJifi3EaZt0rHGjmOTY5Bw/4qomSyc3NAyGZQqpctMuGQBwy9v1GntLxr5c?=
 =?us-ascii?Q?x6HlJHIwsavoK6Z7XavN9+Lf3DvEVX072eDukuP7qSjcfWbuNHb7Um7p2iih?=
 =?us-ascii?Q?8VuMqV0bJTp5uUqEiEF7ggY5kEVfhRBYzw14UWaizoH45xaB16Se+M40fGcF?=
 =?us-ascii?Q?3iia4XWVgVH9HbUk8Aa14Jo8QlFRPuxf/tZ8UcUuudjFLVmVd2jp4ouByKrG?=
 =?us-ascii?Q?s2Q9u17VgKu3PPYmytcO870gwd7T26GUKnWY+4izVoipYNQGvkFREPXpnHnj?=
 =?us-ascii?Q?oapqFkrFmFSAZK3M09p9gMawFHwh5lXoCML9x8lNDHxUb4P66QzlOVmzdh2w?=
 =?us-ascii?Q?aI2Ub2hMcM4e2YNVXO5zEgjnkNFvmK5LjTTWDBMQkCbf3+BX1yf2/V6Am8f8?=
 =?us-ascii?Q?mVf82Fup5uOKeUKBIt4Y//hLhnqtP4rKziiGYlynHK5rklSG1ZkTDw8CU+Bi?=
 =?us-ascii?Q?NKXEjMB8EhC36FBvxIt8rrW1i9gQAx6IdFAnur8515qSrWadlG0AnEWLD/YX?=
 =?us-ascii?Q?MCUrTr6oWaQRJ/kN5TjguVS8WEUxRuMePZXIaL4nN0d7gQrgEZE41NIgmvid?=
 =?us-ascii?Q?SC7Pg37gKZVKK96ywVCOCIMRTj1XXYapnQOwpWFBOn9wrFAZZbhOSg6YunDo?=
 =?us-ascii?Q?A8eb8hFlokxXxI9Iyz+n5MaLSBgEmvMFQYuVjiMIxq07MFWF5LEyqUnAxrwl?=
 =?us-ascii?Q?VMumXijGeX9Tf9UUBy1ZQcUsqDSBtR7BjzO83982EY9h6dWhYlOI2EMmHx+a?=
 =?us-ascii?Q?3EIm2mf6bcnUv2tmupyBT8pqu6EBb55ueYUEsb892vWInhN+ZWAvx8yMeY1a?=
 =?us-ascii?Q?PigLgFFEJO+i21mc4FLZSiqEB4nEF9ngjTXbVsAkgmVYVbx+FVa1S/LCSxSY?=
 =?us-ascii?Q?GvVG7mMQmnevNo2z3pTWnU+ioxaTkT+Un1SJcsjlO9o1OctkubcUjOgNXYIU?=
 =?us-ascii?Q?+clfZAHBBSSg9u12LnVc5nBtA/dgexcgCr8cNm5f4JTYxzrOZumRogR6OMXs?=
 =?us-ascii?Q?FnYUqL47ZxJ6PnpQ1T4qzGw4lcVKwyh5FefOdX3ZEA0SaXvqzc+xVUqlaObJ?=
 =?us-ascii?Q?CUvR4nzD42n37f+Urfq4cCw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6nIx5xhBtNaMSlLpbD5v0PpFl8WUf0fB7tL3fl144JjzxVnvC9RuzDQAEH3H?=
 =?us-ascii?Q?qgF+QeMP/vxCdsh8qff3Y21Kmxa4NvTQvn5mOB+2LflbedD0td3DfBztkIDd?=
 =?us-ascii?Q?zA/8ePhNA4qkUTIWsbx5XvRLUZhXfTAmJORZuMkRhY2eHBJRznf1JM4QMpMK?=
 =?us-ascii?Q?aDbzITmsrbtDSk6Rl9Y+dZGDJUyfsS2spQbKW5putz49nyeKJeTclhZ5vgla?=
 =?us-ascii?Q?e2wbOmxFfhTDAS3wMOaIEeDRbdBu1mDjRpI//QugRp8yAlJHWamWuFl4KQJg?=
 =?us-ascii?Q?+T7yQPLDPnNS5r4MpwYzHdUNn/pnz+oNuUDwisAfyqHJNFp9bOA/Zu+8flkW?=
 =?us-ascii?Q?wLhI93N7UljEMLyhJpFgx9PG0dMvvP7dghYgywG2Z6PNqZzRQv7kdjmLodm6?=
 =?us-ascii?Q?ypYCDhRfv1t9JSxeGXdWks9vt8Rci09Ly4aApZB4zoL/mIaH/y8kgfI3yNdo?=
 =?us-ascii?Q?KgKCZv+251Z2S/k2sbRjLmb1ir1C28E0QkDMHjPZcnwlqpA4yjSEQYHCGto2?=
 =?us-ascii?Q?SfSPJk/zYL8KM83i0KpUUY+coHVUEzrjcr5yeYHguLDPYiyqPz61JUAVdX74?=
 =?us-ascii?Q?a38OU5NXqwGSkxjDAJ/Pv6kqk+1I8uHdIbhftIMtBsqyp3DvwblAciuU6gbQ?=
 =?us-ascii?Q?4rY0gNyviO3AIvZPSX8iqMH2RCazLdQO1Sjm8Tz4F5bCPudGiZmwB1KfL62A?=
 =?us-ascii?Q?+uHlC01aap8cnPuNe/jES/maShJoqaakGlydOd18Dc0JoPFHOUnxpy9DaDfO?=
 =?us-ascii?Q?SHOLTQSgqfPf1twNABb4ZBSgi9zKmO3L/UPYnOyu3rAY1R6QBYJTxchzL7P0?=
 =?us-ascii?Q?31tww/N6ja2OKPg4XlUIBJAORW17Ly5URLm3xmvWUwT5QdmnjuXj0V9IRUcy?=
 =?us-ascii?Q?iklLRqngKYV3aRRjTSujvZkr3JMqn0fmgFU38BGGCPx8A4HxTZoWMaxj8BHn?=
 =?us-ascii?Q?6De7x1WhTtnUBMWAMwr4N+M7juaSLNTIRhF2sAZWS8dFnnxK+MWylJm8XYZA?=
 =?us-ascii?Q?6M9JezzK+odz1i1lFDJhiE7NnhZ6jIs2b6BEvt3lNdmkCkknjgvNXp0dS1Tk?=
 =?us-ascii?Q?+PWfR1hkYFM1PnvcxlWE7AxvWgL0vhA4OTcHv36Ci/h7b+2aCXKHtcG5/QQG?=
 =?us-ascii?Q?at5DybbyW1X+/oWrZmhyQeiAhD7seIW0gKvQkRgzGN5YXnWUBdWN52wAL+jo?=
 =?us-ascii?Q?pVPkiRZLHoM+edOR06EJ8pdv7KIkUe8XJrTffbBz4NwBNhtk+ScetTq1ONj5?=
 =?us-ascii?Q?O17lVFyXITz+o8bjVrrQAr0irn5HLkvKYugnf8cMY3Vgk+rOwH0IWj6uxvyh?=
 =?us-ascii?Q?aUFhR5alQDhy85o9F2y5Iv0JR8+1+BwxHLjvxknAzr/oqFE0HZjm5Zr58Wz1?=
 =?us-ascii?Q?TSO17PRzQV/1Slmcl0+QNTwhuIGrOO5KeGRz3CwKPqmE+A45h2cnuOYhkwkR?=
 =?us-ascii?Q?1ftlpt3eNzld0OYtbHclcV8UnWb5ynWAFMmk+zSjec8FT52SRvuYyqlvXp1V?=
 =?us-ascii?Q?SP6e6yV6HBiFBMbgtZ+18w2yF7cy/urEzhmMT6ATp0DXj3ATO5lcE7BXyWjm?=
 =?us-ascii?Q?9kngj/QJa+ByaA4U9X2IthbHWgl8lGWLdH9H+bepH4l5J4pN7AsfylL3N2QQ?=
 =?us-ascii?Q?30T8ad7BfS0bwdApQqp/zKiFQRDtINADwGyal+lhcws4ISVl/n6r9jcdAa4g?=
 =?us-ascii?Q?m+sJq/7vuH64gd87+6wcjYiaIoAfbVJPqGbsWg3ASyRDcU8/ezlEaGYtdn4E?=
 =?us-ascii?Q?ukgsqwWx8Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c54e2eb-d387-4e29-41bf-08de730119e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 17:29:29.9206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IsQw+/kbN0LnWxEkN83Dwa07zF0RJDw3/DTH0g1nf8Ic1wvAm6OtqZk5BkxDicGvbB9D+v+Hu69xJ4MmvIKgpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
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

On Mon, Feb 23, 2026 1:28 AM Varun Gupta wrote:
> When check_bo_args_are_sane() validation fails, jump to the new free_vmas
> cleanup label to properly free the allocated resources.
> This ensures proper cleanup in this error path.
>=20
> Fixes: dff547e137be ("drm/xe/uapi: Extend the madvise functionality to
> support foreign pagemap placement for svm")

Ths Fixes tag is not right. It should be:=20
293032eec4ba ("drm/xe/bo: Update atomic_access attribute on madvise")=20
The issue is introduced by this patch.=20

> Cc: stable@vger.kernel.org
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
> v2:
>  - Added Fixes tag and CC stable (Matt Brost)
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 52147f5eaaa0..0c92fed6c6a6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -453,7 +453,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
>  						    madvise_range.num_vmas,
>  						    args->atomic.val)) {
>  				err =3D -EINVAL;
> -				goto madv_fini;
> +				goto free_vmas;
>  			}
>  		}
>=20
> @@ -490,6 +490,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
>  err_fini:
>  	if (madvise_range.has_bo_vmas)
>  		drm_exec_fini(&exec);
> +free_vmas:
>  	kfree(madvise_range.vmas);
>  	madvise_range.vmas =3D NULL;

Nit: This set NULL could be skipped since it is a local parameter.

With the Fixes tag corrected,=20
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>  madv_fini:
> --
> 2.43.0

