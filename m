Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D22C05027
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 06:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977FE10E3C7;
	Fri, 17 Feb 2023 06:19:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2165710E3C7
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 06:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676614781; x=1708150781;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WvBP0n1WOfwdCt3AHUnM7mLM0hqQKs3uVvZfFK95oT0=;
 b=J5j3Y/aWJVgE+sCupmcptVFx71+TTjRuJa95/Q4xYOki9ph7c+dH/aSG
 MLQZYgVHhIoA2rcMOIhloybFHr5n0wd9Lsu7O/eiUXPmymFLgRXEwHaCX
 TmN4W+ibpKyyF7aw236XI0SEXUSldQ+Lx46U9F/rKpN0v+4+x5MIfMs4J
 JETCTupll+PUeEcNxtLWt7SQ2hFwGhv1HRUXo73cbyPMSSaNxY9RLYX9H
 HeVsLGmV6HWhqU8Y1uvVhdEjlldpn0dtNKBYHJuLZ2PgOwd30AUMPQwA/
 7VIxhbN+0Q/uWTfg89NgpeuScqtx8xiyNdfwcYxD37I1r94bi03JPlLgL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333280321"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="333280321"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 22:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813265269"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="813265269"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2023 22:19:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 22:19:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 22:19:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 22:19:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmtzYU175JSSoV4wavsPRIANP1u05SW3pjM+1WJP7+lWeBWmRVGnrq88lOHuHs5FyIrvCgbfUkyCaRItgEPw5Tkwr23X0ngQSnZ0DYAyuUwZi44Cn92ZNoosvg0xFIz8anman6kU+QoqNSEURMaIryOLCWIkYCbMOnj7alnt0cjR5Zh9B2R2BylZS0PNKjAuyx2EqtmA8pMKM5wUHJ1VWyViAUJR5yHhLAVhPU9dlK4TY7SJmtCyLBhivloGUnv1BZrpxPaR9cHNO7RANkSQksUGDdHwZYd3SzymjQVy0eaJjdKr4TWyO0bnTEGoT3kbX1p8koFFNzpOubUp3IYpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UAkF9P+LrZc9ow9zPeRcbiAPdpCG1NOf8gneXQ++g0=;
 b=PUSQ2XxF/2Muo2gU5NaJODHyhd44JihAjCGQr9z06W9rLMauIWhKyGOGIBSUkPHp8lILQ2sbCayATPFFtmYwvOZcqlbxsTEhZ+hkZU+V0IlS34AjSVkpMcd+ot+K+5Jt5/IMP/y6rXTjAqzC3PrgwllwGv/MbmRO0x5140dZZPIWi9mjY344h9CjyI72jws/WezVQFduGPvpvTiGUK9e34B2Qi/o+cOo2LBwI2UF6suydGmeeC1pVgL7XAigMkgpjvScqNv7fpFb2PucxkJQhGDI57N30i20rRh/gNIfiij1pebvJfV1JsZe+i+s6m62lbbIn9zy+RLDMJ416hgQtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7960.namprd11.prod.outlook.com (2603:10b6:8:fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 06:19:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 06:19:38 +0000
Date: Thu, 16 Feb 2023 22:19:34 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230217061934.xihofsukxdyfiyc4@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230217005226.106499-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:180::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 10faac45-77fc-4c6a-eade-08db10aef20b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IKtd6xhaSFt9C1OnuZlKBf3aF82KOH0XG0y8OWtyDrHRja5WeO4crmeQP6eHbm0TYOhT8wfRLS9zvtpCTmrfPpvdQaZ+JqizNrs3ABzaKwjTh22oDviX9u1noq8OblcIdsNknl59orCpD+FRB2CeWcvhC0yUy6kxz6Hh2pO/jVfi2y8YFtyk/Ct65t236+kPY26W4RgjI1OWp/ZhTStMJg1e1mu4KrIs/4ZUKgNTEiYQ07vVygujxEcW6Z8YaDIcxlN81Iyeu1bZu5nzQ4ZpfVVwY27jR0v6NOYQsgs5g/sJ2PQxFGAmyKkSCPTbVLbqJj4iJThjhTMm6082UnozWlGtOO6Hb3qKD+Za3f36JOy22ac4TovxKcQJtLkwwxarJapRKrDyiCl6MLfl1U14ZfXWDvikpv933HkjZfEINIHQANOiPeluzXWLiV8yE25WCcLtYAu3q+rJ0JCsWEkYhNJTPWHdNXL2sw/GfzlZyu6qFygHe34XQ6f7r/N8qJSAqZzWBGypgLNBjcgi2mExU8bwM1H/J+5OeYfm49AT/MiQJaq3/I1PVqr3XYscQbtCv8b1T79wnUs7Zib+P9AASTDxZ7jiYXjXzKgND9+OKuUtbmCGAUgdCvC3FjlNL+RsfXg+58FFFZt9NIFsl1yXVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199018)(6486002)(478600001)(8936002)(8676002)(5660300002)(82960400001)(66476007)(66556008)(4326008)(66946007)(6916009)(41300700001)(38100700002)(36756003)(2906002)(316002)(54906003)(86362001)(83380400001)(107886003)(186003)(26005)(1076003)(9686003)(6506007)(6666004)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FapOUMpvPE4J7MAivhX8qXvzMc8f2UeEXw0ZaFdP3jEqV+sG2eaxgRVbC6Yj?=
 =?us-ascii?Q?lzvNWDinaQrJ+VhB2AaP/dzbRsXmVSsnkXydNOP6C+LpjYZPvYoWtYpBjQvf?=
 =?us-ascii?Q?oNvY+oDZGItT1mxz42BXejUfxclHFMamT3haCLz35YAn9Rj8yXtA1KrXlbQL?=
 =?us-ascii?Q?bypRElb4jggOE2qsvedCf3WVE+nXq5md0Y//g0mOVKS0gcUTtpJNckGPrH1+?=
 =?us-ascii?Q?GkW83LgI8W2AS8jhKs+jvY8Dj88Ot9KWD/W67Zhy2GGPd4O4ODT+xk27A0wL?=
 =?us-ascii?Q?obRnxeoFnQ7VuYSzQr13AfoIL5aPwA0Zev63XgwNqzgqcIVjps5loY0keiz4?=
 =?us-ascii?Q?iAyj+Sc+Ik15HPxk7UI1pgSLkrIy6H+EyKrfKEch5lH39mzniJ9ZuBgVekc4?=
 =?us-ascii?Q?QV0Xz23f941SR/18UxAFYVwmrAKuge0tVhkmwRP7o7Bvsxul0Exrd8nf3YA/?=
 =?us-ascii?Q?ntrFkNmYHQUXvtDdbi4C/xWsKsBpYUYnP6EaGtRjH/Prp4fu4aK4Xf4xMjmj?=
 =?us-ascii?Q?Nm9wdmZ0YeY98s8w5yCtnQV4oq5ODqBwY1E5NdOuDurQP8PtaG237Y2nr24M?=
 =?us-ascii?Q?N+eN+/Fpogyth2GpJKmh7XGl1yFez0Au/4Nedj1XQX9RFBDznRP1Hfs1B9/K?=
 =?us-ascii?Q?nX7bJCwnU8/aiIiqMha3gTq45qhHDbtHwuNqw/IY8c+wnH3m46tKk8Pz+bav?=
 =?us-ascii?Q?nYike2M/HcngiWiZFLKuLYXTLagVkkNsf52OOqYI/KD3c1gmXqW4PiQRjMvw?=
 =?us-ascii?Q?qtp4X91j3wDkIs9SqZw5QzfeiqUB9eQlODD+EKPHWRn6SIgtGLh1NI2qcFV5?=
 =?us-ascii?Q?InMZBRqLZL5CX0/J3RoHs7Z0yLcgx2VsZEH0V5TG8Mxvcp3ZA2pbN5LsS0W6?=
 =?us-ascii?Q?eRw4R6OGT8lSRgDiZtFp1hMes2EZ5HLqeC7xRzLLtbzcRkR3581pMkf0lQDw?=
 =?us-ascii?Q?nfbHIDizYtqSQGAe//tZukTvZ0gmC0VgRdDNaM/3py7kwX/4ZP50AgWdAEcS?=
 =?us-ascii?Q?yxfPfF4JlHYVemlyme06CGBxAXsAPu8PzejjzdQe/Xre5QSn8vyFcFB/0XaM?=
 =?us-ascii?Q?OTWyCQRpa7qMo+9O2jQWFKoal9o9Ut5NvQnrGaE04UPtns43CFmiZgY7EpQJ?=
 =?us-ascii?Q?sRyl994sg6BhjQQEhnkziLAM8TbLqD/XzhEoWzLZqeaBweKBjtwtonMahRuf?=
 =?us-ascii?Q?H54JnbJgr5dbproQehBpm8PlcyejIV3FYSdtt2iTid/dSR+K10PU6wb9b6l/?=
 =?us-ascii?Q?xurBAH0SNQzEKkjs42ws/+LknciPoDvVU3xPWYRDov55APv9icS39g4sI4uH?=
 =?us-ascii?Q?E+4OLKMQspi5b9ZgmXWkFZ/71MuuSarpbnyDQEej5eKco7z4TsCqH16DLOv/?=
 =?us-ascii?Q?fO9/vKwGU/YZjoIpWkOBNWLTVKV2X4xWuw9OK0BNAMEwY9PvduWwiHu8+Zu1?=
 =?us-ascii?Q?Qr7q+9cG317OlTAWKaiV91LEy1QL4zyPzSXjNoDi65UfY+1/H6XWybcE2F6I?=
 =?us-ascii?Q?1iWW/T8w4pAk4FQbll8V/fQEJLeo088vyeI/7ixwaXQ2clb/F9ox4htP/ZEs?=
 =?us-ascii?Q?4M90R7K8rU3echZNIi5b99EStIep0R9Q/cJ3Sho9jFTExqWeFGd+7B17FsP1?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10faac45-77fc-4c6a-eade-08db10aef20b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 06:19:37.8652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6TaxQACRb8pLxwPdJL7Q93rBQJrSC95dDlzKRTYpWTUFloobtoHTvBkQOr7OvKuToNu8OijXJkK0MEIi5hP7CVRMpPcUDhYWvC3txGK+oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7960
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 00/11] Start register cleanup
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:52:15PM -0800, Lucas De Marchi wrote:
>Start cleaning up the register definitions used in xe.
>This removes dependency on the following registers:
>
>	- intel_engine_regs.h
>	- intel_gt_regs.h
>	- intel_lrc_reg.h
>	- intel_gpu_commands.h
>	- i915_reg.h
>	- intel_mchbar_regs.h
>
>The includes on the display/ part are left as is since there is still
>some more work to do to detangle dependencies. Other than from the
>display/ files, xe still depends on:
>
>	- i915_reg_defs.h
>	- display/intel_display_core.h
>	- display/ext/intel_device_info.h
>	- display/ext/intel_pch.h
>
>The first one are the generic defines used for defining the registers.
>They probably can be split and part of them copied to include/drm to be
>shared across the drivers. The last 3 are expected to be cleaned up
>together with the rest of the display.
>
>This series started by doing it manually with a few greps, migrated in
>the middle to do by "remove the include, parse the warnings from the
>compile and use that to generate the header" and finished with a small
>python script with clang. There may be some inconsistencies how the

fwiw this is the quick hack script I used (helper.py only exports a
git() wrapper). It does ~90% of the job -
just couldn't find a way to make it recurse into the macros  - we'd need
the preprocessed header, but then the values would not be valid.


------8<------------
#!/usr/bin/python3

import sys
import clang.cindex

import helpers

FILE = sys.argv[1]
file_data = open(FILE, "r").readlines()
macros_instantiated = []
macros = dict()
macros_prereq = []

def is_used_by_xe(macro):
     return helpers.git(["grep", "-q", f"\\b{macro}\\b", "--", "drivers/gpu/drm/xe/", ":(exclude)drivers/gpu/drm/xe/display/ext/"], check=False).returncode == 0


def print_source(node):
     sline = node.extent.start.line
     eline = node.extent.end.line
     ecolumn = node.extent.end.column

     line = sline
     while line < eline:
         print(file_data[line - 1].rstrip())
         line += 1

     print(file_data[line - 1][:ecolumn].rstrip())


def recurse(node):
     if node.kind == clang.cindex.CursorKind.MACRO_DEFINITION and str(node.location.file) == FILE:
         macros[node.spelling] = node
         if is_used_by_xe(node.spelling):
             print_source(node)
     elif node.kind == clang.cindex.CursorKind.MACRO_INSTANTIATION and str(node.location.file) == FILE:
         macros_instantiated.append(node)

     for c in node.get_children():
         recurse(c)

index = clang.cindex.Index.create()
root = index.parse(FILE,
                    options=clang.cindex.TranslationUnit.PARSE_DETAILED_PROCESSING_RECORD |
                            clang.cindex.TranslationUnit.PARSE_INCOMPLETE |
                            clang.cindex.TranslationUnit.PARSE_SKIP_FUNCTION_BODIES)
recurse(root.cursor)

for node in macros_instantiated:
     if node.spelling in macros:
         macros_prereq.append(macros[node.spelling])

macros_prereq.sort(key=lambda x: x.location.line)

if len(macros_prereq):
     print("\n\n/* move me up */\n\n")
     for node in macros_prereq:
         print_source(node)
