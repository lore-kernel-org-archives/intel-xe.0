Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31970C004C0
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 23:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F143610E56D;
	Thu, 19 Oct 2023 23:08:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7A810E56D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 23:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697756928; x=1729292928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mYHglXSci/6mIIENkX6b5Ci78wY5Ekqvi+HnX0q9Uoc=;
 b=jVnbjic9RAn8q4wtSIJm8yZEIYzXXnSvqip0EzNThB38cLslybw3bojJ
 0b4/MJvvmKXKWC4avrXdYLW1GSqOn0GCUtOCM/WQN3VP1C9zNVAuajkJS
 Xdi/l2NCxgmz0X8XcZREVgImBgFkt/Mg0FAQ8NkWYYWah7ollNMO5T+oU
 MUcG+7vZi++iNCFetrX81txGcqtDazzx1G5UkV/GVwjCGax+4tTuEzOhY
 khoBKBc4OW5BZ3Fmfi5l7sg16iT6CrrB8oPgCTbwKhKAUQSyW4Cn71tSI
 ZQUBZZ0HpqgLE0kbZPpsUYRzbSnOF4atGwPYTwPv14R4k0VuD+MUmc1wT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="450612545"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="450612545"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 16:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792185361"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="792185361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 16:07:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 16:07:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 16:07:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 16:07:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 16:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek9h35k2hPgm2gKpjP76NPeEBFOzHOVS867zT+7MnBQe8QMX6KKhIR6ij5lbR8UK+7WAxbP1fnhLaci+OzDXvm6fR4rbwVDMSqKHcPXL8hFLEIF2+GGaByos1G9uXXRjJh96OCAzTTjBgK1DDxtzzJglV6laIEIt+m/HGjnKtZ9j3ZQETH3t3yZXQEFGKpmMTxCdoK30HzAtoz1O4m4sDOqUl33q9Do+fEC2aKpFa/uKmgRNEgZUvzLzclDB1aviljKRwoj8zi+115VzUm3mmyyviirj7V1j5wmt6oBivZaRnEX5Y0AVY+F/BdCupbifF24py8Io+Ou+pLzepONVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oveg6E/ElcQ7FcvHIOeu2YDgfKy3nwH4dSB9LnYV44c=;
 b=jJwVcHF6ZRBhQSOpfkPQv7CdSV3M8v4SOo7SYU97Ss/4i3WD5QUFjKfwuWXcFe/BlvYTZ8IXKFkxkQxIBGQw/bwXVvUpHHRcp6PqMMZZO3d2wdXHKmQX1bizrD+RV4HvO4RdpeecyOhjhhoOSydi4F6WXeM+OgcDjU4RUWzejMGOIRVrFf3zlZ/UP34AKwe2DX24IM3UEoT2W9tHerBNF/Fo7RZbN7m7d+9DvmIfW3i3czQu3pEanpVqgzfM/cygJ0Rv0r/6dmXZb8uTGNLvSv0i+Yv2gVuTUlHsTZlrMrJ6f3THGridh8bLpIy5+W5S6Lps2h6A+CNrgkOK7E1Gxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6140.namprd11.prod.outlook.com (2603:10b6:930:28::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 23:07:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::c228:5055:b7da:d0bf%6]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 23:07:28 +0000
Date: Thu, 19 Oct 2023 18:07:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <nddgbye2i6ysxx7wnj23abe4tqbtdgwvezql2oeob4cgh7ocw6@pwnj26tya736>
References: <20231018225707.1685294-1-daniele.ceraolospurio@intel.com>
 <20231018225707.1685294-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231018225707.1685294-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 9746d768-7c06-45ec-0ded-08dbd0f82a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ug7r8VHpy1294a1GgyOocF7tLAiFRs02fwAK2aXDYD3iI+OSCkyvF9301w0e7R3Zt+RWKcH9r2aOuKA1nYFzw0CaFAQ6jxwKVqwicPWuKIQQow9oomOrat9B/4qyyNnUJSWhw17mBXYhNnEUQy7zXcULOvFM5S7q8z6nBk6pjWn1jFnEm7vxsJioilnfD/jHkpFIBvPgUJFnhTkU8mHo/UDTSNyo/DBzTcrZ/bSmjPgvqSrUXC6iAkQ7FSEfVWuCir9nOEsoNsn0eMHiMuhx7gftAqJ0UA0fSDyaW5WIB+76LZmuvHT7KptmPwUlUWNEHiqnaYMByVzrI1NYxqj6xsPw5iVLfbCIJYhEbRXzKMPnEJdPoeAELDNIPLivdMVwM439HZSunctmdtrUSQiWt5FdzjSyykgkZRTS/JlWdfwK1FVV+AB99cTAkjU8+bX5MTcL24ytf+Cy4CftV5zVDUVxEvGPN7vV2FkKnfDXouqzVrcrF6CsxgVRRQmOuIvir2D95E37DTf6FfWpSJs6rljsswLDpGcGLiXefA0K30obv7jCTxxe+ddG7/0AOe4e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(346002)(366004)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(6666004)(83380400001)(6506007)(8936002)(316002)(6486002)(2906002)(30864003)(5660300002)(41300700001)(4326008)(8676002)(33716001)(478600001)(6862004)(86362001)(6636002)(66556008)(66476007)(66946007)(82960400001)(38100700002)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pJUa81ANOOlbxxkdJzIT7qfWzy83yzNAWq++O2uVLJ+ulDh0QSS6FXdluU1/?=
 =?us-ascii?Q?saianOtpFboE5e7g6m9Fg1/jCoplv1EQ09I5aG1tnoLTTd3TC34nw2nlqtHz?=
 =?us-ascii?Q?BmBBMVfJRYce+P3Dd0y8eQaVzuvD0Vi6OjQ4Ji1F3m06zfuqlJd0v5cq3MYy?=
 =?us-ascii?Q?1HwSFKpetO2g8LmLcH/duyt9N3C14WCLhUshE+53biEvJ2sQGCbQW5/89aqx?=
 =?us-ascii?Q?hwllmra5tagmtprA5HVp9lVQsxvwv7oMocNMRDN6b5iV+Lgsvz9Eyw3EFxvk?=
 =?us-ascii?Q?7Xf39FvN+mtfqh3tuXwPrPR3EqbGA5J1TUGNo2xBQvQgGPma5WPbaob3iCHM?=
 =?us-ascii?Q?nzKAiKbAjiEC2AuVCc0BZ6BZxvUOKLuRHKaayxoC0egTr74cSFhXXK2PweZz?=
 =?us-ascii?Q?5D+ruUMJHWBRIjAWfbgux9LRieTGiTZMFUIPAW1dWJQg9Qi7nFswKOkurzhd?=
 =?us-ascii?Q?maveSm106s/2s/pP8RxPbWSemUi9xByuBjk/c2PEfhnRjAiAmHPziPtBfm00?=
 =?us-ascii?Q?aXhyA2CpT9eYleMqenztHgQwIqRgzhkDdGM9uSlPM7L69+c16lTCRK6tPnez?=
 =?us-ascii?Q?oS3k3xH/wR3OjXHqIvwaotWPUYuW8JAGmDfrhBHVhCI+OiYv+21Gaj6OC56J?=
 =?us-ascii?Q?4K1qPKaKFHOOJZrr4MVmY+c+PpFhVMEz/iUP2R3O8RVWK17Ja46hnHj0FrmE?=
 =?us-ascii?Q?R57dx/E0FIKn+wU7QOGRhnCxYwd3pp0q7Oz6p+ZmFMRfRXGnqHF0BjQ0lRCt?=
 =?us-ascii?Q?Ms01tRgy56e+j+zSwbjWugId1iXplWshvmXkH0vjiYzY5TuMW+uOn/pO0gpq?=
 =?us-ascii?Q?Csq4oNfInXbYgFcEnZiDFf/AeFWUY7RLC3fWj3N+kld6tdVQMpgZELbJlBuQ?=
 =?us-ascii?Q?FdL289ug935XjbMl7IEidqpN2m1Gw8EvhnzmHdyc0UnQua3R79abBWE/Sp5x?=
 =?us-ascii?Q?XALe0l8Ai1QNUGxfIObIwqkwMw9ajfaDs8dYADOIeHt+xwGUnyrxfTZeJ3Sl?=
 =?us-ascii?Q?ECRbVa5TsmMt9w2xJebHPy4gXdtaNpI13M3qdRjRH7rhK6Ej5w+4RFBeX2xW?=
 =?us-ascii?Q?+qDBEpTsrP79Q0QOq2wXZkJiiFnWydQRjx5vtnJG8rbaCcWKQ+do5rWVBZ0F?=
 =?us-ascii?Q?67HLrI36w+x/f8ltk7je1lZMAdwQJzxv6nfR5CdBPz60Ou9ozUp5mXFRHzYZ?=
 =?us-ascii?Q?IE5Itn6lT+nnhLMh33FJ3B+zawzvSECU4rvkT3TMFOSKSFZOtDKqkoNFTR1C?=
 =?us-ascii?Q?9eXA+0tg5n3ILt0/QwcPNe1igkJDf1pJ09ShW0Ag12uOkJeBgEtwFzDsJGXV?=
 =?us-ascii?Q?txFrxdG2VjVi1vCVOX4KEHNfsklpxPh/4zBpk2RPjC0x7KVLx5uoRhZT3AJt?=
 =?us-ascii?Q?cjZkiuTkcwbk7LhS0GCep2fJsoaV+HFtrlnZkOU6RhnAcADR1h0XUJRKarUO?=
 =?us-ascii?Q?FGUvoTBd/ej/aWDsKdOqSHST/yAtKp+XlWH7DWJ4mKAQOFYtg4qiRNRNAKm2?=
 =?us-ascii?Q?IXUS9D3Pb8MPWErkwI2rTx/HGXiUiGumTPHWQcOl0HBeDqC9XFfZ3mQjaeqE?=
 =?us-ascii?Q?bkJopr8Q2prnD6LmyfdvDe3J0KFjNlhsgOXrjaDJnmE5IeZNoqbI526fk78P?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9746d768-7c06-45ec-0ded-08dbd0f82a3a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 23:07:28.4812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi12qG8MjMz+bUk8Kz9s2QnE6SsKIbQD5rRfbYjGik3d0HmLHnG/tCi4qHBDPYmSlPCwjq1T6G6OGaNWYiWCBwUazLQqmMxnuaseIfrf4hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/5] drm/xe/huc: Extract version and
 binary offset from new HuC headers
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 03:57:04PM -0700, Daniele Ceraolo Spurio wrote:
>The GSC-enabled HuC binary starts with a GSC header, which is followed
>by the legacy-style CSS header and the binary itself. We can parse the
>GSC headers to find the HuC version and the location of the binary to
>be used for the DMA transfer.
>
>The parsing function has been designed to be re-used for the GSC binary,
>so the entry names are external parameters (because the GSC uses
>different ones) and the CSS entry is optional (because the GSC doesn't
>have it).
>
>v2: move new code to uc_fw.c, better comments and error checking, split
>    old code move to separate patch (Lucas), move headers and
>    documentation to uc_fw_abi.h.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> Documentation/gpu/xe/xe_firmware.rst |   3 +
> drivers/gpu/drm/xe/xe_uc_fw.c        | 137 ++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_uc_fw.h        |   2 +-
> drivers/gpu/drm/xe/xe_uc_fw_abi.h    | 120 +++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_uc_fw_types.h  |   2 +
> 5 files changed, 261 insertions(+), 3 deletions(-)
>
>diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
>index f1ac6f608930..afcb561cd37d 100644
>--- a/Documentation/gpu/xe/xe_firmware.rst
>+++ b/Documentation/gpu/xe/xe_firmware.rst
>@@ -10,6 +10,9 @@ Firmware Layout
> .. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
>    :doc: CSS-based Firmware Layout
>
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
>+   :doc: GSC-based Firmware Layout
>+
> Write Once Protected Content Memory (WOPCM) Layout
> ==================================================
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 7345f0409cf9..2680b5082ea0 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -403,9 +403,142 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
> 	return 0;
> }
>
>+static bool is_cpd_header(const void* data)
>+{
>+	const u32 *marker = data;
>+
>+	return *marker == GSC_CPD_HEADER_MARKER;
>+}
>+
>+static inline u32 entry_offset(const struct gsc_cpd_entry *entry)

no need for the inline. Let the compiler figure it out.

>+{
>+	return entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
>+}
>+
>+/* Refer to the "GSC-based Firmware Layout" documentation entry for details */
>+static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t size,
>+			    const char *manifest_entry, const char *css_entry)
>+{
>+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>+	struct xe_device *xe = gt_to_xe(gt);
>+	const struct gsc_cpd_header_v2 *header = data;
>+	const struct gsc_cpd_entry *entry;
>+	size_t min_size = sizeof(*header);
>+	int i;
>+
>+	if (!manifest_entry)
>+		return -EINVAL;

should this be an assert since it's a programming error to pass this as
NULL?

>+
>+	if (size < sizeof(*header)) {

min_size

>+		xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);

or change this one to be sizeof() and only assign min_size for later
use.

>+		return -ENODATA;
>+	}
>+
>+	if (!is_cpd_header(header)) {
>+		xe_gt_err(gt, "Trying to CPD parse a non-CPD header\n");
>+		return -ENODATA;
>+	}
>+
>+	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
>+		xe_gt_err(gt, "invalid CPD header length %u!\n", header->header_length);
>+		return -EINVAL;
>+	}
>+
>+	min_size = header->header_length + sizeof(*entry) * header->num_of_entries;
>+	if (size < min_size) {
>+		xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>+		return -ENODATA;
>+	}
>+
>+	entry = data + header->header_length;
>+
>+	for (i = 0; i < header->num_of_entries; i++, entry++) {
>+		if (strcmp(entry->name, manifest_entry) == 0) {
>+			const struct gsc_manifest_header *manifest;
>+
>+			min_size = entry_offset(entry) + sizeof(struct gsc_manifest_header);
>+			if (size < min_size) {
>+				xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>+				return -ENODATA;
>+			}
>+
>+			manifest = data + entry_offset(entry);
>+
>+			uc_fw->major_ver_found = manifest->fw_version.major;
>+			uc_fw->minor_ver_found = manifest->fw_version.minor;
>+			uc_fw->patch_ver_found = manifest->fw_version.hotfix;

continue;

if we can't ever have css_entry == manifest_entry

>+		}
>+
>+		if (css_entry && strcmp(entry->name, css_entry) == 0) {
>+			u32 offset = entry_offset(entry);
>+			int ret;
>+
>+			/*
>+			 * This section does not contain a CSS entry on DG2. We
>+			 * don't support DG2 HuC right now, so no need to handle
>+			 * it, just add a reminder in case that changes.
>+			 */
>+			xe_assert(xe, xe->info.platform != XE_DG2);
>+
>+			/* the CSS header parser will check that the CSS header fits */
>+			if (offset > size) {
>+				xe_gt_err(gt, "FW too small! %zu < %u\n", size, offset);
>+				return -ENODATA;
>+			}
>+
>+			ret = parse_css_header(uc_fw, data + offset, size - offset);
>+			if (ret)
>+				return ret;
>+
>+			uc_fw->css_offset = offset;
>+		}

do we want to stop the search as soon as both are found? maybe even as 2
loops instead of one.

>+	}
>+
>+	if (!uc_fw->major_ver_found) {
>+		xe_gt_err(gt, "Failed to find %s version in manifest!\n",
>+			  xe_uc_fw_type_repr(uc_fw->type));
>+		return -ENODATA;
>+	}
>+
>+	if (css_entry && !uc_fw->css_offset) {
>+		xe_gt_err(gt, "Failed to find CSS offset for %s\n",
>+			  xe_uc_fw_type_repr(uc_fw->type));
>+		return -ENODATA;
>+	}
>+
>+	return 0;
>+}
>+
> static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
> {
>-	return parse_css_header(uc_fw, fw->data, fw->size);
>+	/*
>+	 * Quick check to make sure there is enough space for the headers. FWs
>+	 * are expected to be hundreds of KB big, so we can keep it simple and
>+	 * start by checking that we have at least a page (which is enough for
>+	 * the headers), while further checks will be done based on the headers
>+	 * contents.
>+	 */
>+	if (fw->size < PAGE_SIZE)
>+		return -ENODATA;

functions below should be able to survive with no crashes if they always
check the there's enough data in the buffer to cover what they are
trying to access. I don't like much checking for an arbitrary PAGE_SIZE
number and eventually failing that in future platforms when/if the
header grows.

>+
>+	/*
>+	 * All GuC releases and older HuC ones use CSS headers, while newer HuC
>+	 * releases use GSC CPD headers.
>+	 */
>+	switch (uc_fw->type) {
>+	case XE_UC_FW_TYPE_HUC:
>+		if (is_cpd_header(fw->data))
>+			return parse_cpd_header(uc_fw, fw->data, fw->size,
>+						"HUCP.man", "huc_fw");

alternative to use one specific error number like ENOENT in
parse_cpd_header(), so you know to fallback on that

case XE_UC_FW_TYPE_HUC:
	ret = parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", "huc_fw");
	if (!ret || ret != -ENOENT)
		return ret;

	fallthrough;

then the is_cpd_header() can just be inside the function actually
parsing the cpd_header and you can remove the extra error message from
there.

>+		fallthrough;
>+	case XE_UC_FW_TYPE_GUC:
>+		return parse_css_header(uc_fw, fw->data, fw->size);
>+		break;
>+	default:
>+		return -EINVAL;
>+	}
>+
>+	return 0;
> }
>
> int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>@@ -511,7 +644,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>
> 	/* Set the source address for the uCode */
>-	src_offset = uc_fw_ggtt_offset(uc_fw);
>+	src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->css_offset;
> 	xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
> 	xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
>index a519c77d4962..1d1a0c156cdf 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.h
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>@@ -21,7 +21,7 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p);
>
> static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
> {
>-	return sizeof(struct uc_css_header) + uc_fw->ucode_size;
>+	return sizeof(struct uc_css_header) + uc_fw->ucode_size + uc_fw->css_offset;
> }
>
> static inline void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw,
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>index edae7bb3cd72..d6725c963251 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>@@ -85,4 +85,124 @@ struct uc_css_header {
> } __packed;
> static_assert(sizeof(struct uc_css_header) == 128);
>
>+/**
>+ * DOC: GSC-based Firmware Layout
>+ *
>+ * The GSC-based firmware structure is used for GSC releases on all platforms
>+ * and for HuC releases starting from DG2/MTL. Older HuC releases use the
>+ * CSS-based layout instead. Differently from the CSS headers, the GSC headers
>+ * uses a directory + entries structure (i.e., there is array of addresses
>+ * pointing to specific header extensions identified by a name). Although the
>+ * header structures are the same, some of the entries are specific to GSC while
>+ * others are specific to HuC. The manifest header entry, which includes basic
>+ * information about the binary (like the version) is always present, but it is
>+ * named differently based on the binary type.
>+ *
>+ * The HuC binary starts with a Code Partition Directory (CPD) header. The
>+ * entries we're interested in for use in the driver are:
>+ *
>+ * 1. "HUCP.man": points to the manifest header for the HuC.
>+ * 2. "huc_fw": points to the FW code. On platforms that support load via DMA
>+ *    and 2-step HuC authentication (i.e. MTL+) this is a full CSS-based binary,
>+ *    while if the GSC is the one doing the load (which only happens on DG2)
>+ *    this section only contains the uCode.
>+ *
>+ * The GSC-based HuC firmware layout looks like this::
>+ *
>+ *	+================================================+
>+ *	|  CPD Header                                    |
>+ *	+================================================+
>+ *	|  CPD entries[]                                 |
>+ *	|      entry1                                    |
>+ *	|      ...                                       |
>+ *	|      entryX                                    |
>+ *	|          "HUCP.man"                            |
>+ *	|           ...                                  |
>+ *	|           offset  >----------------------------|------o
>+ *	|      ...                                       |      |
>+ *	|      entryY                                    |      |
>+ *	|          "huc_fw"                              |      |
>+ *	|           ...                                  |      |
>+ *	|           offset  >----------------------------|----------o
>+ *	+================================================+      |   |
>+ *	                                                        |   |
>+ *	+================================================+      |   |
>+ *	|  Manifest Header                               |<-----o   |
>+ *	|      ...                                       |          |
>+ *	|      FW version                                |          |
>+ *	|      ...                                       |          |
>+ *	+================================================+          |
>+ *	                                                            |
>+ *	+================================================+          |
>+ *	|  FW binary                                     |<---------o
>+ *	|      CSS (MTL+ only)                           |
>+ *	|      uCode                                     |
>+ *	|      RSA Key (MTL+ only)                       |
>+ *	|      ...                                       |
>+ *	+================================================+

awesome! much easier now.

Consider the comments above just nits and feel free to incorporate the
suggestions or leave as is.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+ */
>+
>+struct gsc_version {
>+	u16 major;
>+	u16 minor;
>+	u16 hotfix;
>+	u16 build;
>+} __packed;
>+
>+/* Code partition directory (CPD) structures */
>+struct gsc_cpd_header_v2 {
>+	u32 header_marker;
>+#define GSC_CPD_HEADER_MARKER 0x44504324
>+
>+	u32 num_of_entries;
>+	u8 header_version;
>+	u8 entry_version;
>+	u8 header_length; /* in bytes */
>+	u8 flags;
>+	u32 partition_name;
>+	u32 crc32;
>+} __packed;
>+
>+struct gsc_cpd_entry {
>+	u8 name[12];
>+
>+	/*
>+	 * Bits 0-24: offset from the beginning of the code partition
>+	 * Bit 25: huffman compressed
>+	 * Bits 26-31: reserved
>+	 */
>+	u32 offset;
>+#define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
>+#define GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
>+
>+	/*
>+	 * Module/Item length, in bytes. For Huffman-compressed modules, this
>+	 * refers to the uncompressed size. For software-compressed modules,
>+	 * this refers to the compressed size.
>+	 */
>+	u32 length;
>+
>+	u8 reserved[4];
>+} __packed;
>+
>+struct gsc_manifest_header {
>+	u32 header_type; /* 0x4 for manifest type */
>+	u32 header_length; /* in dwords */
>+	u32 header_version;
>+	u32 flags;
>+	u32 vendor;
>+	u32 date;
>+	u32 size; /* In dwords, size of entire manifest (header + extensions) */
>+	u32 header_id;
>+	u32 internal_data;
>+	struct gsc_version fw_version;
>+	u32 security_version;
>+	struct gsc_version meu_kit_version;
>+	u32 meu_manifest_version;
>+	u8 general_data[4];
>+	u8 reserved3[56];
>+	u32 modulus_size; /* in dwords */
>+	u32 exponent_size; /* in dwords */
>+} __packed;
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>index 444bff83cdbe..1650599303c8 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>@@ -113,6 +113,8 @@ struct xe_uc_fw {
> 	u32 rsa_size;
> 	/** @ucode_size: micro kernel size */
> 	u32 ucode_size;
>+	/** @css_offset: offset within the blob at which the CSS is located */
>+	u32 css_offset;
>
> 	/** @private_data_size: size of private data found in uC css header */
> 	u32 private_data_size;
>-- 
>2.41.0
>
