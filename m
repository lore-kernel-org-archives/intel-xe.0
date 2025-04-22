Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E633C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 13:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C963910E1DB;
	Tue, 22 Apr 2025 13:20:53 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5169310E1DB;
 Tue, 22 Apr 2025 13:20:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2966408085869842763=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fvm=3A_Implement?=
 =?utf-8?q?_xe=5Fvm=5Fget=5Fproperty=5Fioctl_=28rev21=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 13:20:53 -0000
Message-ID: <174532805332.25748.2720746318339111182@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250421203353.64900-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250421203353.64900-1-jonathan.cavitt@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============2966408085869842763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=3D=3D Series Details =3D=3D

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev21)
URL   : https://patchwork.freedesktop.org/series/145529/
State : success

=3D=3D Summary =3D=3D

{
    "bugs": [
        {
            "id": 25078,
            "short_name": "Intel XE#4829",
            "url": "https://gitlab.freedesktop.org/drm/xe/kernel/issues/482=
9"
        }
    ],
    "builds": {
        "Linux": {
            "component": {
                "__str__": "Linux",
                "description": "The Linux kernel.",
                "id": 2,
                "name": "Linux",
                "public": true,
                "url": "https://kernel.org"
            },
            "from_build": {
                "__str__": "xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea=
8",
                "added_on": "2025-04-22T07:37:12.808239Z",
                "id": 61509,
                "name": "xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8",
                "parents": [],
                "upstream_url": null
            },
            "to_build": {
                "__str__": "xe-pw-145529v21",
                "added_on": "2025-04-21T21:35:33.743032Z",
                "id": 61504,
                "name": "xe-pw-145529v21",
                "parents": [],
                "upstream_url": null
            }
        }
    },
    "new_tests": {},
    "results": [
        {
            "machine": "bat-dg2-oem2",
            "result_from": {
                "__str__": "dmesg-warn",
                "all_failures_covered": true,
                "bugs_covering": [
                    "Intel XE#4829"
                ],
                "is_failure": true
            },
            "result_to": {
                "__str__": "pass",
                "all_failures_covered": true,
                "bugs_covering": [],
                "is_failure": false
            },
            "test": "igt@kms_cursor_legacy@basic-flip-after-cursor-atomic",
            "testsuite": "IGT"
        },
        {
            "machine": "bat-dg2-oem2",
            "result_from": {
                "__str__": "pass",
                "all_failures_covered": true,
                "bugs_covering": [],
                "is_failure": false
            },
            "result_to": {
                "__str__": "dmesg-warn",
                "all_failures_covered": true,
                "bugs_covering": [
                    "Intel XE#4829"
                ],
                "is_failure": true
            },
            "test": "igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pi=
pe-b-dp-3",
            "testsuite": "IGT"
        },
        {
            "machine": "bat-dg2-oem2",
            "result_from": {
                "__str__": "dmesg-warn",
                "all_failures_covered": true,
                "bugs_covering": [
                    "Intel XE#4829"
                ],
                "is_failure": true
            },
            "result_to": {
                "__str__": "pass",
                "all_failures_covered": true,
                "bugs_covering": [],
                "is_failure": false
            },
            "test": "igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pi=
pe-c-dp-3",
            "testsuite": "IGT"
        },
        {
            "machine": "bat-dg2-oem2",
            "result_from": {
                "__str__": "pass",
                "all_failures_covered": true,
                "bugs_covering": [],
                "is_failure": false
            },
            "result_to": {
                "__str__": "dmesg-warn",
                "all_failures_covered": true,
                "bugs_covering": [
                    "Intel XE#4829"
                ],
                "is_failure": true
            },
            "test": "igt@kms_cursor_legacy@basic-flip-after-cursor-legacy",
            "testsuite": "IGT"
        },
        {
            "machine": "bat-dg2-oem2",
            "result_from": {
                "__str__": "pass",
                "all_failures_covered": true,
                "bugs_covering": [],
                "is_failure": false
            },
            "result_to": {
                "__str__": "dmesg-warn",
                "all_failures_covered": true,
                "bugs_covering": [
                    "Intel XE#4829"
                ],
                "is_failure": true
            },
            "test": "igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pi=
pe-d-dp-3",
            "testsuite": "IGT"
        },
        {
            "machine": "bat-dg2-oem2",
            "result_from": {
                "__str__": "dmesg-warn",
                "all_failures_covered": true,
                "bugs_covering": [
                    "Intel XE#4829"
                ],
                "is_failure": true
            },
            "result_to": {
                "__str__": "pass",
                "all_failures_covered": true,
                "bugs_covering": [],
                "is_failure": false
            },
            "test": "igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pi=
pe-b-dp-3",
            "testsuite": "IGT"
        }
    ],
    "runcfg_from": {
        "__str__": "xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8_BAT",
        "added_on": "2025-04-22T07:37:21.326581Z",
        "builds": [
            "IGT_8329",
            "xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8"
        ],
        "environment": null,
        "id": 117512,
        "name": "xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8_BAT",
        "tags": [
            "xe"
        ],
        "temporary": false,
        "url": null
    },
    "runcfg_to": {
        "__str__": "xe-pw-145529v21_BAT",
        "added_on": "2025-04-21T21:35:37.166751Z",
        "builds": [
            "IGT_8329",
            "xe-pw-145529v21"
        ],
        "environment": null,
        "id": 117504,
        "name": "xe-pw-145529v21_BAT",
        "tags": [
            "xe"
        ],
        "temporary": true,
        "url": null
    },
    "status": "SUCCESS",
    "text": "CI Bug Log - changes from xe-2975-59b03675a8b030e69f6a4927223c=
d342cb01cea8_BAT -> xe-pw-145529v21_BAT\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\nSummary\n-------\n\n  *=
*SUCCESS**\n\n  No regressions found.\n\n  \n\nParticipating hosts (9 -> 8)=
\n------------------------------\n\n  Missing    (1): bat-adlp-vm \n\nKnown=
 issues\n------------\n\n  Here are the changes found in xe-pw-145529v21_BA=
T that come from known issues:\n\n### IGT changes ###\n\n#### Issues hit ##=
##\n\n  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:\=
n    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4829]) +=
2 other tests dmesg-warn\n   [1]: https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8/bat-dg2-oem2/igt@kms_pipe=
_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html\n   [2]: https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v21/bat-dg2-oem2/igt@kms_pipe_=
crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html\n\n  \n#### Possibl=
e fixes ####\n\n  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:\n=
    - bat-dg2-oem2:       [DMESG-WARN][3] ([Intel XE#4829]) -> [PASS][4] +2=
 other tests pass\n   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-297=
5-59b03675a8b030e69f6a4927223cd342cb01cea8/bat-dg2-oem2/igt@kms_cursor_lega=
cy@basic-flip-after-cursor-atomic.html\n   [4]: https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145529v21/bat-dg2-oem2/igt@kms_cursor_legacy@basic-fli=
p-after-cursor-atomic.html\n\n  \n  [Intel XE#4829]: https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4829\n\n\nBuild changes\n-------------\n\n  *=
 Linux: xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8 -> xe-pw-145529v21=
\n\n  IGT_8329: 8329\n  xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8: 5=
9b03675a8b030e69f6a4927223cd342cb01cea8\n  xe-pw-145529v21: 145529v21\n\n"
}

=3D=3D Logs =3D=3D

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14552=
9v21/index.html

--===============2966408085869842763==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe/xe_vm: Implement xe_vm_get_property_i=
octl (rev21)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145529/">https://patchwork.freedesktop.org/series/145529/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-145529v21/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-145529v21/index.html</a></td></tr>

</table>


    <p>{<br />
    "bugs": [<br />
        {<br />
            "id": 25078,<br />
            "short_name": "Intel XE#4829",<br />
            "url": "https://gitlab.freedesktop.org/drm/xe/kernel/issues/482=
9"<br />
        }<br />
    ],<br />
    "builds": {<br />
        "Linux": {<br />
            "component": {<br />
                "<strong>str</strong>": "Linux",<br />
                "description": "The Linux kernel.",<br />
                "id": 2,<br />
                "name": "Linux",<br />
                "public": true,<br />
                "url": "https://kernel.org"<br />
            },<br />
            "from_build": {<br />
                "<strong>str</strong>": "xe-2975-59b03675a8b030e69f6a492722=
3cd342cb01cea8",<br />
                "added_on": "2025-04-22T07:37:12.808239Z",<br />
                "id": 61509,<br />
                "name": "xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8",=
<br />
                "parents": [],<br />
                "upstream_url": null<br />
            },<br />
            "to_build": {<br />
                "<strong>str</strong>": "xe-pw-145529v21",<br />
                "added_on": "2025-04-21T21:35:33.743032Z",<br />
                "id": 61504,<br />
                "name": "xe-pw-145529v21",<br />
                "parents": [],<br />
                "upstream_url": null<br />
            }<br />
        }<br />
    },<br />
    "new_tests": {},<br />
    "results": [<br />
        {<br />
            "machine": "bat-dg2-oem2",<br />
            "result_from": {<br />
                "<strong>str</strong>": "dmesg-warn",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [<br />
                    "Intel XE#4829"<br />
                ],<br />
                "is_failure": true<br />
            },<br />
            "result_to": {<br />
                "<strong>str</strong>": "pass",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [],<br />
                "is_failure": false<br />
            },<br />
            "test": "igt@kms_cursor_legacy@basic-flip-after-cursor-atomic",=
<br />
            "testsuite": "IGT"<br />
        },<br />
        {<br />
            "machine": "bat-dg2-oem2",<br />
            "result_from": {<br />
                "<strong>str</strong>": "pass",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [],<br />
                "is_failure": false<br />
            },<br />
            "result_to": {<br />
                "<strong>str</strong>": "dmesg-warn",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [<br />
                    "Intel XE#4829"<br />
                ],<br />
                "is_failure": true<br />
            },<br />
            "test": "igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pi=
pe-b-dp-3",<br />
            "testsuite": "IGT"<br />
        },<br />
        {<br />
            "machine": "bat-dg2-oem2",<br />
            "result_from": {<br />
                "<strong>str</strong>": "dmesg-warn",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [<br />
                    "Intel XE#4829"<br />
                ],<br />
                "is_failure": true<br />
            },<br />
            "result_to": {<br />
                "<strong>str</strong>": "pass",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [],<br />
                "is_failure": false<br />
            },<br />
            "test": "igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pi=
pe-c-dp-3",<br />
            "testsuite": "IGT"<br />
        },<br />
        {<br />
            "machine": "bat-dg2-oem2",<br />
            "result_from": {<br />
                "<strong>str</strong>": "pass",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [],<br />
                "is_failure": false<br />
            },<br />
            "result_to": {<br />
                "<strong>str</strong>": "dmesg-warn",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [<br />
                    "Intel XE#4829"<br />
                ],<br />
                "is_failure": true<br />
            },<br />
            "test": "igt@kms_cursor_legacy@basic-flip-after-cursor-legacy",=
<br />
            "testsuite": "IGT"<br />
        },<br />
        {<br />
            "machine": "bat-dg2-oem2",<br />
            "result_from": {<br />
                "<strong>str</strong>": "pass",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [],<br />
                "is_failure": false<br />
            },<br />
            "result_to": {<br />
                "<strong>str</strong>": "dmesg-warn",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [<br />
                    "Intel XE#4829"<br />
                ],<br />
                "is_failure": true<br />
            },<br />
            "test": "igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pi=
pe-d-dp-3",<br />
            "testsuite": "IGT"<br />
        },<br />
        {<br />
            "machine": "bat-dg2-oem2",<br />
            "result_from": {<br />
                "<strong>str</strong>": "dmesg-warn",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [<br />
                    "Intel XE#4829"<br />
                ],<br />
                "is_failure": true<br />
            },<br />
            "result_to": {<br />
                "<strong>str</strong>": "pass",<br />
                "all_failures_covered": true,<br />
                "bugs_covering": [],<br />
                "is_failure": false<br />
            },<br />
            "test": "igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pi=
pe-b-dp-3",<br />
            "testsuite": "IGT"<br />
        }<br />
    ],<br />
    "runcfg_from": {<br />
        "<strong>str</strong>": "xe-2975-59b03675a8b030e69f6a4927223cd342cb=
01cea8_BAT",<br />
        "added_on": "2025-04-22T07:37:21.326581Z",<br />
        "builds": [<br />
            "IGT_8329",<br />
            "xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8"<br />
        ],<br />
        "environment": null,<br />
        "id": 117512,<br />
        "name": "xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8_BAT",<br =
/>
        "tags": [<br />
            "xe"<br />
        ],<br />
        "temporary": false,<br />
        "url": null<br />
    },<br />
    "runcfg_to": {<br />
        "<strong>str</strong>": "xe-pw-145529v21_BAT",<br />
        "added_on": "2025-04-21T21:35:37.166751Z",<br />
        "builds": [<br />
            "IGT_8329",<br />
            "xe-pw-145529v21"<br />
        ],<br />
        "environment": null,<br />
        "id": 117504,<br />
        "name": "xe-pw-145529v21_BAT",<br />
        "tags": [<br />
            "xe"<br />
        ],<br />
        "temporary": true,<br />
        "url": null<br />
    },<br />
    "status": "SUCCESS",<br />
    "text": "CI Bug Log - changes from xe-2975-59b03675a8b030e69f6a4927223c=
d342cb01cea8_BAT -&gt; xe-pw-145529v21_BAT\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\nSummary\n-------\n\n=
  <strong>SUCCESS</strong>\n\n  No regressions found.\n\n  \n\nParticipatin=
g hosts (9 -&gt; 8)\n------------------------------\n\n  Missing    (1): ba=
t-adlp-vm \n\nKnown issues\n------------\n\n  Here are the changes found in=
 xe-pw-145529v21_BAT that come from known issues:\n\n### IGT changes ###\n\=
n#### Issues hit ####\n\n  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck=
-nv12@pipe-b-dp-3:\n    - bat-dg2-oem2:       [PASS][1] -&gt; [DMESG-WARN][=
2] ([Intel XE#4829]) +2 other tests dmesg-warn\n   [1]: https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8/bat=
-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.h=
tml\n   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v21/bat-=
dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.ht=
ml\n\n  \n#### Possible fixes ####\n\n  * igt@kms_cursor_legacy@basic-flip-=
after-cursor-atomic:\n    - bat-dg2-oem2:       [DMESG-WARN][3] ([Intel XE#=
4829]) -&gt; [PASS][4] +2 other tests pass\n   [3]: https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2975-59b03675a8b030e69f6a4927223cd342cb01cea8/bat-dg2=
-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html\n   [4]: ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v21/bat-dg2-oem2/igt@km=
s_cursor_legacy@basic-flip-after-cursor-atomic.html\n\n  \n  [Intel XE#4829=
]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829\n\n\nBuild chan=
ges\n-------------\n\n  * Linux: xe-2975-59b03675a8b030e69f6a4927223cd342cb=
01cea8 -&gt; xe-pw-145529v21\n\n  IGT_8329: 8329\n  xe-2975-59b03675a8b030e=
69f6a4927223cd342cb01cea8: 59b03675a8b030e69f6a4927223cd342cb01cea8\n  xe-p=
w-145529v21: 145529v21\n\n"<br />
}</p>

</body>
</html>

--===============2966408085869842763==--
