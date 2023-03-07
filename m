Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA591C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 21:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8783010E14B;
	Tue,  7 Mar 2023 21:40:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5D010E14B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 21:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678225215; x=1709761215;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QxE1eBxlrVfqMk7res1eJ2VSwrQAl/fXcY5qt/ice9E=;
 b=jfVP9KVNQG7xANg015EMe46VzlJLTr+ToTwKLr9RGm7x6BmA6NdClluL
 Gf5Blv7IUnfJhXHVdhdeTco4BSNi7xHUbSDzW8nqHjtDGZJenTjAg9ZVx
 rNxNsrWfn8Qe/HFwNQ4y2ux5k+9o6dUBF3K+hpUnuptq0ADjMy/viS0nj
 uAY4izpviT+PgxGadxQMTaA72vRhj1JfZAxgdLxmKweOPAtXawBIlITMu
 AcNjJmjYbqVJBQF5mmAEjkbdXbaECyGhBI+J+FmFofj1DjBd8ZeDxr1OW
 u8O3svqnOeE5TdetXLKRbswFStY6L1xpCU+M1mP4RtZq/T9YvMpnQXaBC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334696236"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="334696236"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 13:40:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="819927225"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="819927225"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2023 13:40:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 13:40:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 13:40:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 13:40:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HevWr3+K51ZGtvnIA20IFsJ6JmtRmcaedMohOvEwbUnbf7kWiMtGil1B+tTYuGXSbF+xE0Whjw9b9xgxvIoOL9d23LBX1a28KLqTz0L5yrUvKM2aLrJGHkIEHMX0HCODeZ6CD6yomXGKMgMxSlg85vf22kZ7p3JtkVNyySPIU0Z8sOf+0kxAiAHtl9DjW1P0YOcnxkez/Ot13ikMWcQHdXZbDxe6folQCGKn2cJsN6b4gS0i4IiJujr1Ck9vF8/ExZgobu66HG/hkXONovExLwGpBdz01su8JDa8PwtsZNM7MfmDUJrJh8czAk8QGOdIwTxeveIRhJ44oLCaqnCpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pB/Duc3jtyD1aev0j62O6BIFf6emOF4sy7uoQj0f2xY=;
 b=iLn7eB2FuIsz+5Egpi8RwsJeim9STEwBDqlLkGXjwrDZTRJSkjmYn0HdwOt3J4EENHOA6QS7jcT5nKo3rmIFzJeirEWY7rSUdYG+HqvCCM5NH68AENQmB442nlAkJxn/bls9YHl5iFbaBh/s5VrQClcfXgdFcYAxP+rS/r2xYgxIjioCl+67MgYd4baBf8SWho2b6YNcuozdWU/p93Xyhis2agpy0QmZ6XwvGy3rHF40A3Yg68LR7+x3wK78ivZQiqkWgN+YkuoQExlcJZNUqp9AcFMZNRB/oCrPFTJG3N7zgaWOCXt7j7JoRRQvBrByqNUBBjUwC2sZ83rU/P/+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Tue, 7 Mar
 2023 21:40:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 21:40:06 +0000
Date: Tue, 7 Mar 2023 13:40:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230307214003.zwcgwgxkasm6cmzb@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230306133459.7803-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230306133459.7803-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 0279ceed-9301-431b-bc4d-08db1f548434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bTdN9m3Gz4oAmfPqD7j+2Z3gzzQUs9r1vviq231pnuQssnzUVwKhokswDP8xcp9KrvjxLeHbHqixoYoucZcYbCxiv9QiB6ZJ4UuputC4xzTFY0loeb7A6MKJQGoz9SkfRUeZ/yKtw7j1gmYVqvnsdg9I+ZPvCuAGKUUmgnpAHOPZRqKK0+GX/sSFOHe1/kGuAqn9o0ThhODWKuHeJih3fHKgYfi6/HQVxtZeUI2vpFwYWWH+AnvfXlwstPAlL0QQfXHHf9BQkC/CTAxnMo0OQmo/X/Tkybs8L1ZXq0yw4scC2Xexpvp8O2z5++Vx4Pq+LKecuJyl8VcSA6VSWlJFdWcjncP6WRicehBKjdinl+aOwkgmTXJ6dgDNdK1e2cSsO9ocQWCH7iczSxFfhGKUUVLcx4/JTmMUyCtVBMtooBzDGm+2cS7zwuuFLkv4RzOaOMu+6g64NB+1e+VTX2VyitwxbCQYE0jOk99zgE36XNkiWXIFZhP4TPd/Lw1fHr2TbcsN+fDo4HuOTgZsfmVML0nO/MXzcoaYugrIT/r0PUGz70qYAQhSXs01qhR2eUcOBm6gvgDcHtBv834ZBUNQZ3ERUOKyt+xaIqaQYC2T3fSsvNwBocEZyuvOwpV2sgYWOfcGHSZ7gnpJV9lbe+QPSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199018)(8936002)(5660300002)(8676002)(66946007)(4326008)(66556008)(66476007)(41300700001)(6862004)(36756003)(316002)(6636002)(6506007)(186003)(6486002)(86362001)(1076003)(107886003)(82960400001)(9686003)(6666004)(26005)(6512007)(478600001)(38100700002)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4DDuFkRq2aMHTpDioVMyUCFtq0ZZi/FWNZToaXoHj/IRWmb5E2Yqlbh2hNHW?=
 =?us-ascii?Q?z8mQbrvUcMMuXZIqUJhyeAPBlYgEEmwAd86IY3aS07Jt84nA9s+r59hLJZQs?=
 =?us-ascii?Q?gv47iXPmXl/CwAxOyCcv/LXwwNncFOkZmcxqbbl2+wElWTgefZmEgafN9tzV?=
 =?us-ascii?Q?jngYc+bydFBXy49g6+3th8i25ZWQF2fGUNWpSQ4cT2iIAWMdGGnu8MLR6Mmu?=
 =?us-ascii?Q?maXeRO7ZVnJCQMkl8u0Vu3cLRspR1BOOqa//5WmyHmy7y1/QVz+9q89k8zoP?=
 =?us-ascii?Q?pkXt1To0vrOsp1yBOj1w+Ley/aX3488j2hDeRjOygVEwi0/7vwLIkj7EFO4Q?=
 =?us-ascii?Q?V0EA/25u2OpPulTcQWfyAPlhV3e1MadAw65mPjV0rg5kpKUMSWiWy/gTVeKc?=
 =?us-ascii?Q?TR+acqPr4av37hOdtGxffiLTxRFQTSH+TWosCY3mB1IfbCyVx3gxzMoGIaKa?=
 =?us-ascii?Q?2YR0EOF+AiiaO7WWO52rQL7NwoQnMZV6RJFaXnpotQobTuVsA5Y/egCN/Pnj?=
 =?us-ascii?Q?OJoQydz3IiE0eSpTFNYo9dhGw868I5sfOEQIMwbNY2w863SXazF0CplxENTD?=
 =?us-ascii?Q?3iUM0r51btwozs4LIwnMqtLxSvo8OBgY1cbsqgitQ5RHjN+C/qd2f2EPB6vp?=
 =?us-ascii?Q?HooCwd49mi807qSZa8X2ikFcNSo7tqMKPBf9+CcYqP9ttyTPM47wfDWjhoNB?=
 =?us-ascii?Q?UsepXtirS1pUTpNHchGTXwyL3fQpvGwEZlFGahyJ9W2Fs8I4ITJhAtojki1e?=
 =?us-ascii?Q?Xmh0r/qqxUd7lUb2ZRQqQSOoydQR2nkNnJfIbxsSpUOy4Eyu3Ksp5T3JygLP?=
 =?us-ascii?Q?tZ5Zs82fs91l7cBKy/IyS+MaWHlOayRideFRvnmpA9W/dw5vSXXksCLkUXY2?=
 =?us-ascii?Q?b12T+bumrSMxxGN3ghC2pgm7Omrp4WuMLz8oDyMq8jnG5XCmPQuzlFgBkFyv?=
 =?us-ascii?Q?IhShAxfc17E1wP/jYv5JYfjwXOtwAOQfW9xm8Gdx8gpAfl7f0dz22J4HwUhv?=
 =?us-ascii?Q?sYKVk1/Q8WIatqwP4mlcnJ8KwMYCdntlCnDuip6/DnZTpFfjlgrK4h/Gv+eg?=
 =?us-ascii?Q?1lnYcYXR84N6lXh6Vb7DyyGZXjUVrlG8/c+jeFtfsgmd4A1O3BWwhmdNC6O3?=
 =?us-ascii?Q?8HyqytLS9GVO97/UDnlJgjJJTsTshRQ6qAdEkkoLF/GxtUn4jv4c+BA4FkUY?=
 =?us-ascii?Q?5cJuaODxUXbsVuFvC2B/xOygsw0OUXXNkApdNjc44ZhGDAzMwvCOaMvaZLWs?=
 =?us-ascii?Q?GfkKjZMpce8lf8yMpsaZo+5xk570dUy40IQgds+ys5y1b+4YbTw7XwkoD/yo?=
 =?us-ascii?Q?WeAU1j+NMUKMhU7NLn49KsA7YLRjkYUSnlB4wbn+a0AUhIzY1aq5GWHwzj02?=
 =?us-ascii?Q?qjKY8E26f1sM1bruWRzL8iVbmp36XLbYEzg+pRSx51dnSS8QoFaL1D8w4Vf6?=
 =?us-ascii?Q?822o04UvEdqYfZDK0Ydd/BqdtBmoVJECjhWhff6kb0UVWl+gd+vgBEyjhRDF?=
 =?us-ascii?Q?5cUz2vbb7Z0w0A3Whdip0RhOTzbIIi8KYPiqdLsF9iEzr3sjIGKx7uli8+qw?=
 =?us-ascii?Q?LNbpylmJ0V0JQrLfIdwhOghjk/SB8TEFDI134oPFGE+HgBZiPzyPTXuRAAP2?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0279ceed-9301-431b-bc4d-08db1f548434
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 21:40:06.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuLnMUqqlwIfs9PxpH4aQjkMKe21uRWc5i3N6g30d1Jwc/DwJ4B3J7GveFxdpCZ7NtiSlmvl1c+h0FPLVi/g1KDVytIdR++UIZ1qW3I9Vrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/migrate: Fix number of PT structs
 in docbook
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
Cc: dev@mblankhorst.nl, thomas.hellstrom@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 05:34:59AM -0800, Niranjana Vishwanathapura wrote:
>Update xe_migrate_doc.h with 32 page table structs (not 48)
>
>v2: minor typo fix
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

unrelated fail in CI... it seems CI is applying series to the wrong
head.

applied, thanks

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_migrate_doc.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
>index 6a68fdff08dc..63c7d67b5b62 100644
>--- a/drivers/gpu/drm/xe/xe_migrate_doc.h
>+++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
>@@ -21,7 +21,7 @@
>  * table BOs for updates, and identity map the entire device's VRAM with 1 GB
>  * pages.
>  *
>- * Currently the page structure consists of 48 phyiscal pages with 16 being
>+ * Currently the page structure consists of 32 physical pages with 16 being
>  * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
>  * several pages are needed to setup the identity mappings (exact number based
>  * on how many bits of address space the device has), and the rest are reserved
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
